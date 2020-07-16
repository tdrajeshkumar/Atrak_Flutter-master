class ApiRoutes{
  /// Api Endpoint URL
  static final endPointURL = "http://atrak.protellabs.com:8087";

  /// Api paths
  static final login = "/token"; // get Token and Store them in locally.
  static final userDetails = "/api/User/GetStaffDetail"; // get User details.
  static final holidayList = "/api/Dashboard/Holidays/{location}/{year}";

}