import 'package:flutter/material.dart';

class LockingPageScrollPhysics extends ScrollPhysics {
  /// Requests whether a drag may occur from the page at index "from"
  /// to the page at index "to". Return true to allow, false to deny.
  final bool Function(int from, int to) onAttemptDrag;

  /// Creates physics for a [PageView].
  const LockingPageScrollPhysics(
      {ScrollPhysics? parent, required this.onAttemptDrag})
      : super(parent: parent);

  @override
  LockingPageScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return LockingPageScrollPhysics(
        parent: buildParent(ancestor), onAttemptDrag: onAttemptDrag);
  }

  double _getPage(ScrollMetrics position) {
    // if (position is PageMetrics) return position.page;
    return position.pixels / position.viewportDimension;
  }

  double _getPixels(ScrollMetrics position, double page) {
    // if (position is PagePosition) return position.getPixelsFromPage(page);
    return page * position.viewportDimension;
  }

  double _getTargetPixels(
      ScrollMetrics position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity)
      page -= 0.5;
    else if (velocity > tolerance.velocity) page += 0.5;
    return _getPixels(position, page.roundToDouble());
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
    if (value < position.pixels &&
        position.pixels <= position.minScrollExtent) // under-scroll
      return value - position.pixels;
    if (position.maxScrollExtent <= position.pixels &&
        position.pixels < value) // over-scroll
      return value - position.pixels;
    if (value < position.minScrollExtent &&
        position.minScrollExtent < position.pixels) // hit top edge
      return value - position.minScrollExtent;
    if (position.pixels < position.maxScrollExtent &&
        position.maxScrollExtent < value) // hit bottom edge
      return value - position.maxScrollExtent;

    bool left = value < position.pixels;

    int fromPage, toPage;
    double overScroll = 0;

    if (left) {
      fromPage = position.pixels.ceil() ~/ position.viewportDimension;
      toPage = value ~/ position.viewportDimension;

      overScroll = value - fromPage * position.viewportDimension;
      overScroll = overScroll.clamp(value - position.pixels, 0.0);
    } else {
      fromPage =
          (position.pixels + position.viewportDimension).floor() ~/
              position.viewportDimension;
      toPage =
          (value + position.viewportDimension) ~/ position.viewportDimension;

      overScroll = value - fromPage * position.viewportDimension;
      overScroll = overScroll.clamp(0.0, value - position.pixels);
    }

    if (fromPage != toPage && !onAttemptDrag(fromPage, toPage)) {
      return overScroll;
    } else {
      return super.applyBoundaryConditions(position, value);
    }
  }}