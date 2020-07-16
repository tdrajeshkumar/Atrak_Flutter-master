import 'dart:async';
import 'dart:ui';

import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:vibrate/vibrate.dart';

@immutable
class ViewModel {
  final CurrentState currentState;
  final double slidePercent;
  final Color color;
  final TransitionGoal goal;
  final Function(CurrentState) stateChanged;

  ViewModel(
      {this.currentState,
      this.slidePercent,
      this.color,
      this.goal,
      this.stateChanged});

  get percent => slidePercent;

  get state => currentState;

  ViewModel copyWith(
      {CurrentState currentState,
      double slidePercent,
      Color color,
      TransitionGoal goal}) {
    return ViewModel(
        currentState: currentState ?? this.currentState,
        slidePercent: slidePercent ?? this.slidePercent,
        color: color ?? this.color,
        goal: goal ?? this.goal,
        stateChanged: this.stateChanged
    );
  }
}

@immutable
class PunchSlider extends StatefulWidget {
  final CurrentState currentState;

  final Function(CurrentState) stateChanged;

  PunchSlider({CurrentState currentState, this.stateChanged})
      : currentState = currentState;

  @override
  _PunchSliderState createState() => _PunchSliderState();
}

class _PunchSliderState extends State<PunchSlider>
    with TickerProviderStateMixin {
  StreamController<ViewModel> slideUpdateController =
      StreamController<ViewModel>();

  AnimatedSlideDragger animatedSlideDragger;

  ViewModel _viewModel;

  double slidePercent = 0.0, _endPosition, _buttonWidth;
  Offset dragStart;

  Stream<ViewModel> slidePercentStream;
  Sink<ViewModel> slidedPercentSink;

  @override
  void initState() {
    super.initState();

    print(widget.currentState);

    _viewModel = ViewModel(
        currentState: widget.currentState ?? CurrentState.checkedOut,
        slidePercent: 0.0,
        color: (widget.currentState == null ||
                widget.currentState == CurrentState.checkedOut)
            ? AtrakTheme.slideBarCheckInColor
            : AtrakTheme.slideBarCheckOutColor,
        goal: TransitionGoal.idle,
        stateChanged: widget.stateChanged);
  }

  _initStateConstrains(BoxConstraints constrains) {
    slidePercentStream = slideUpdateController.stream;
    slidedPercentSink = slideUpdateController.sink;
    _buttonWidth = constrains.maxHeight - 2;
    _endPosition = constrains.maxWidth - _buttonWidth - 4;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      _initStateConstrains(constrains);

      onDragStart(DragStartDetails details) {
        dragStart = details.globalPosition;
      }

      onDragUpdate(DragUpdateDetails details) {
        if (dragStart != null) {
          final newPosition = details.globalPosition;
          final dx = newPosition.dx - dragStart.dx;
          if (dx > 0) {
            slidePercent = (dx / _endPosition).clamp(0.0, 1.0);

            _viewModel = _viewModel.copyWith(slidePercent: slidePercent);
            slidedPercentSink.add(_viewModel);
          }
        }
      }

      onDragEnd(DragEndDetails details) {
        dragStart = null;
        if (slidePercent > 0.5) {
          animatedSlideDragger = AnimatedSlideDragger(
              transitionGoal: TransitionGoal.farward,
              viewModel: _viewModel,
              slideUpdateStream: slideUpdateController,
              vsync: this);
        } else {
          animatedSlideDragger = AnimatedSlideDragger(
              transitionGoal: TransitionGoal.cancel,
              viewModel: _viewModel,
              slideUpdateStream: slideUpdateController,
              vsync: this);
        }
        animatedSlideDragger.run();
      }

      return Container(
          alignment: Alignment.center,
          child: StreamBuilder<ViewModel>(
              stream: slidePercentStream,
              initialData: _viewModel,
              builder: (context, snapShot) {
                if (snapShot.hasData) _viewModel = snapShot.data;

                return Stack(
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            color: AtrakTheme.slideBarBackgroundColor,
                            borderRadius: BorderRadius.circular(
                                constrains.maxHeight / 2))),
                    Opacity(
                      opacity: 1.0 - _viewModel.slidePercent,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: _buttonWidth / 2),
                        child: Text(
                          snapShot.hasData &&
                                  snapShot.data.currentState ==
                                      CurrentState.checkedOut
                              ? "Slide to Checkin"
                              : "Slide to Checkout",
                          style: Theme.of(context).textTheme.display1.copyWith(
                              fontSize: 18.0, color: AtrakTheme.slideBarTextColor),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onHorizontalDragStart: onDragStart,
                      onHorizontalDragUpdate: onDragUpdate,
                      onHorizontalDragEnd: onDragEnd,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Transform(
                          transform: Matrix4.translationValues(
                              _endPosition *
                                  (snapShot.hasData
                                      ? snapShot.data.percent
                                      : 0.0),
                              0.0,
                              0.0),
                          child: Container(
                              width: _buttonWidth,
                              height: _buttonWidth,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: _buttonWidth * .80,
                              ),
                              decoration: BoxDecoration(
                                  color: snapShot.data.color,
                                  borderRadius: BorderRadius.circular(
                                      constrains.maxHeight / 2))),
                        ),
                      ),
                    ),
                  ],
                );
              }));
    });
  }

  @override
  void dispose() {
    if (slidedPercentSink != null) {
      slidedPercentSink.close();
    }

    if (slideUpdateController.isClosed) {
      slideUpdateController.close();
    }

    super.dispose();
  }
}

class AnimatedSlideDragger {
  static const PERCENT_PER_MILLISECOND = 0.005;
  final transitionGoal;
  AnimationController startAnimationController;

  AnimatedSlideDragger(
      {this.transitionGoal,
      StreamController<ViewModel> slideUpdateStream,
      TickerProvider vsync,
      ViewModel viewModel}) {
    var startSlidePercent = viewModel.slidePercent;
    var endSlidePercent;
    var duration;

    if (transitionGoal == TransitionGoal.farward) {
      endSlidePercent = 1.0;
      final slideRemining = 1.0 - viewModel.slidePercent;
      duration = Duration(
          milliseconds: (slideRemining / PERCENT_PER_MILLISECOND).round());
    } else if (transitionGoal == TransitionGoal.cancel) {
      endSlidePercent = 0.0;
      duration = Duration(
          milliseconds:
              (viewModel.slidePercent / PERCENT_PER_MILLISECOND).round());
    }

    startAnimationController = AnimationController(
      duration: duration,
      vsync: vsync,
    )
      ..addListener(() {
        var slidePercent = lerpDouble(
            startSlidePercent, endSlidePercent, startAnimationController.value);
        slideUpdateStream.add(viewModel.copyWith(slidePercent: slidePercent));
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed &&
            transitionGoal == TransitionGoal.farward) {
          final AnimationCompletion animationCompletion = AnimationCompletion(
              viewModel: viewModel.copyWith(
                  currentState:
                      viewModel.currentState == CurrentState.checkedOut
                          ? CurrentState.checkedIn
                          : CurrentState.checkedOut,
                  slidePercent: 1.0,
                  goal: TransitionGoal.idle),
              slideUpdateStream: slideUpdateStream,
              vsync: vsync);
          animationCompletion.run();
          _vibrate();
        }

        if (status == AnimationStatus.completed) dispose();
      });
  }

  run() {
    startAnimationController.forward(from: 0.0);
  }

  dispose() {
    if (!startAnimationController.isDismissed) {
      startAnimationController.dispose();
    }
  }

  _vibrate() async {
    if (await Vibrate.canVibrate) Vibrate.feedback(FeedbackType.heavy);
  }
}

class AnimationCompletion {
  static const PERCENT_PER_MILLISECOND = 0.002;

  AnimationController completionAnimationController;
  Animation _animation;

  final ViewModel viewModel;

  AnimationCompletion({
    this.viewModel,
    TickerProvider vsync,
    StreamController<ViewModel> slideUpdateStream,
  }) {
    completionAnimationController = AnimationController(
        vsync: vsync, duration: Duration(milliseconds: 300));

    _animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: completionAnimationController,
        curve: Interval(0.3, 1.0, curve: Curves.fastOutSlowIn)));
    var endColor = viewModel.currentState == CurrentState.checkedIn
        ? AtrakTheme.slideBarCheckOutColor
        : AtrakTheme.slideBarCheckInColor;

    _animation
      ..addListener(() {
        var slidePercent = lerpDouble(0.0, 1.0, _animation.value);
        var color = Color.lerp(endColor, viewModel.color, _animation.value);
        slideUpdateStream
            .add(viewModel.copyWith(slidePercent: slidePercent, color: color));
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (viewModel.stateChanged != null) {
            viewModel.stateChanged(viewModel.currentState);
          }
          dispose();
        }
      });
  }

  run() {
    completionAnimationController.forward();
  }

  dispose() {
    completionAnimationController.dispose();
  }
}

enum TransitionGoal { farward, cancel, completing, idle }
enum CurrentState { checkedIn, checkedOut }
