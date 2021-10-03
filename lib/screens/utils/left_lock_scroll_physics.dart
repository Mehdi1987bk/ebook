// Custom page scroll physics
// ignore: must_be_immutable
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LeftLockScrollPhysics extends ScrollPhysics {
  /// Lock swipe on drag-drop gesture
  /// If it is a user gesture, [applyPhysicsToUserOffset] is called before [applyBoundaryConditions];
  /// If it is a programming gesture eg. `controller.animateTo(index)`, [applyPhysicsToUserOffset] is not called.
  bool _lock = false;

  LeftLockScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  LeftLockScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return LeftLockScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    if (offset < 0) {
      _lock = true;
      return 0.0;
    }

    return offset;
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    assert(() {
      if (value == position.pixels) {
        throw FlutterError(
            '$runtimeType.applyBoundaryConditions() was called redundantly.\n'
            'The proposed new position, $value, is exactly equal to the current position of the '
            'given ${position.runtimeType}, ${position.pixels}.\n'
            'The applyBoundaryConditions method should only be called when the value is '
            'going to actually change the pixels, otherwise it is redundant.\n'
            'The physics object in question was:\n'
            '  $this\n'
            'The position object in question was:\n'
            '  $position\n');
      }
      return true;
    }());

    /*
     * Handle the hard boundaries (min and max extents)
     * (identical to ClampingScrollPhysics)
     */
    // under-scroll
    if (value < position.pixels &&
        position.pixels <= position.minScrollExtent) {
      return value - position.pixels;
    }
    // over-scroll
    else if (position.maxScrollExtent <= position.pixels &&
        position.pixels < value) {
      return value - position.pixels;
    }
    // hit top edge
    else if (value < position.minScrollExtent &&
        position.minScrollExtent < position.pixels) {
      return value - position.pixels;
    }
    // hit bottom edge
    else if (position.pixels < position.maxScrollExtent &&
        position.maxScrollExtent < value) {
      return value - position.pixels;
    }
    // If true, movement goes to the left. If it's a swipe, it goes to the left.
    var isMovingLeft = value >= position.pixels;
    var screenIndex = (value / position.viewportDimension).floor();
    var pointInScreen = value - (screenIndex * position.viewportDimension);
    // If true, the middle point of the screen is in the left side of the screen.
    // This will be useful in order to not block some movements when in returning position.
    var isPointInScreenLeftRange =
        pointInScreen < (position.viewportDimension / 2);
    var delta = value - position.pixels;

    if (isMovingLeft && isPointInScreenLeftRange && _lock) {
      _lock = false;
      print('applyBoundaryConditions');
      if (pointInScreen.abs() < delta.abs()) {
        // fix for strong movements
        return pointInScreen;
      }
      return delta;
    }
    print('RETURN 0.0');
    return 0.0;
  }
}
