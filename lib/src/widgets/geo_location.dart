import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:flutter/services.dart';

class GeoLocation extends StatefulWidget {
  @override
  _GeoLocationState createState() => _GeoLocationState();
}

class _GeoLocationState extends State<GeoLocation> with WidgetsBindingObserver {
  BehaviorSubject<String> locationStream =
      BehaviorSubject<String>(seedValue: "Loading your location...", sync: true);

  Location _location = new Location();

  bool isLocationPermissionChecked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (!isLocationPermissionChecked) {
      _checkPermission();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkPermission();
    }

    print(state.toString());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: locationStream,
      builder: (context, location) {
        print("location printing.");
        return location.hasData && location.data == "open settings"
            ? FlatButton(
                child: Text("Goto Settings",
                    style: Theme.of(context).textTheme.display2.copyWith(
                        fontSize: 20.0,
                        color: AtrakTheme.iconColor,
                        fontWeight: FontWeight.w300)),
                onPressed: _openSettings,
              )
            : location.hasData ? Text(
                location.data,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.display2.copyWith(
                    fontSize: 20.0,
                    color: AtrakTheme.iconColor,
                    fontWeight: FontWeight.w300),
              ) : Text("Loading");
      },
    );
  }

  void _checkPermission() {
    Permission permission = Permission.WhenInUseLocation;

    _checkLocationPermission(permission).then((hasPermission) {
      if (hasPermission) {
        print("Have Permission to Show the Location");
        initPlatformState();
      } else {
        _checkPermissionStatus(permission).then((status) {
          print(status.toString());

          switch (status) {
            case PermissionStatus.authorized:
              isLocationPermissionChecked = true;
              initPlatformState();
              break;
            case PermissionStatus.denied:
              locationStream.add("open settings");
              break;
            case PermissionStatus.restricted:
            case PermissionStatus.deniedNeverAsk:
              break;
            default:
              _requestPermission(permission).then((status) {
                if (status == PermissionStatus.authorized) {
                  isLocationPermissionChecked = true;
                  initPlatformState();
                } else {
                  print("Show Settings Button");
                }
              });
          }
        });
      }
    });
  }

  Future<bool> _checkLocationPermission(Permission permission) {
    return SimplePermissions.checkPermission(permission);
  }

  Future<PermissionStatus> _checkPermissionStatus(Permission permission) {
    return SimplePermissions.getPermissionStatus(permission);
  }

  Future<PermissionStatus> _requestPermission(Permission permission) {
    return SimplePermissions.requestPermission(permission);
  }

  Future<void> _openSettings() async {
    bool hasPermission = await SimplePermissions.openSettings();
    if (hasPermission) {
      initPlatformState();
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    Map<String, double> location;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      await _location.hasPermission();
      location = await _location.getLocation();
    } on PlatformException catch (_) {
      return;
    }

    _getLocation(location);
  }

  void _getLocation(Map<String, double> data) async {
    try {
      // From coordinates
      final coordinates = new Coordinates(data['latitude'], data['longitude']);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      locationStream.add('${first.subLocality}, ${first.featureName}');
    } on PlatformException catch (error) {
      print(error.message);
      return;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    locationStream.close();
    super.dispose();
  }
}
