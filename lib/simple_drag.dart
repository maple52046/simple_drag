library simple_drag;

import 'package:flutter/widgets.dart';

class SimpleDrag<T extends Object> extends StatelessWidget {
  final Axis? affinity;
  final Axis? axis;
  final Draggable<T> Function(BuildContext, List<T?>, List<dynamic>)? builder;
  final Widget child;
  final Widget? childWhenDragging;
  final T? data;
  final Offset Function(Draggable<Object>, BuildContext, Offset)
      dragAnchorStrategy;
  final Widget? feedback;
  final Offset feedbackOffset;
  final HitTestBehavior hitTestBehavior;
  final HitTestBehavior innerHitTestBehavior;
  final bool ignoringFeedbackSemantics;
  final bool ignoringFeedbackPointer;
  final int? maxSimultaneousDrags;
  final void Function(T)? onAccept;
  final void Function(DragTargetDetails<T>)? onAcceptWithDetails;
  final void Function()? onDragCompleted;
  final void Function(DraggableDetails)? onDragEnd;
  final void Function(Velocity, Offset)? onDraggableCanceled;
  final void Function()? onDragStarted;
  final void Function(DragUpdateDetails)? onDragUpdate;
  final void Function(T?)? onLeave;
  final void Function(DragTargetDetails<T>)? onMove;
  final bool Function(T?)? onWillAccept;
  final bool rootOverlay;
  const SimpleDrag({
    required this.child,
    this.affinity,
    this.axis,
    this.builder,
    this.childWhenDragging,
    this.data,
    this.dragAnchorStrategy = childDragAnchorStrategy,
    this.feedback,
    this.feedbackOffset = Offset.zero,
    this.hitTestBehavior = HitTestBehavior.translucent,
    this.innerHitTestBehavior = HitTestBehavior.deferToChild,
    this.ignoringFeedbackSemantics = true,
    this.ignoringFeedbackPointer = true,
    this.maxSimultaneousDrags,
    this.onAccept,
    this.onAcceptWithDetails,
    this.onDragCompleted,
    this.onDragEnd,
    this.onDraggableCanceled,
    this.onDragStarted,
    this.onDragUpdate,
    this.onLeave,
    this.onMove,
    this.onWillAccept,
    this.rootOverlay = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<T>(
      hitTestBehavior: hitTestBehavior,
      onAccept: onAccept,
      onAcceptWithDetails: onAcceptWithDetails,
      onLeave: onLeave,
      onMove: onMove,
      onWillAccept: onWillAccept,
      builder: (context, candidates, rejected) => Draggable<T>(
        affinity: affinity,
        axis: axis,
        childWhenDragging: childWhenDragging,
        data: data,
        dragAnchorStrategy: dragAnchorStrategy,
        feedback: feedback ?? child,
        feedbackOffset: feedbackOffset,
        hitTestBehavior: innerHitTestBehavior,
        ignoringFeedbackPointer: ignoringFeedbackPointer,
        ignoringFeedbackSemantics: ignoringFeedbackSemantics,
        maxSimultaneousDrags: maxSimultaneousDrags,
        onDragCompleted: onDragCompleted,
        onDragEnd: onDragEnd,
        onDraggableCanceled: onDraggableCanceled,
        onDragStarted: onDragStarted,
        onDragUpdate: onDragUpdate,
        rootOverlay: rootOverlay,
        child: child,
      ),
    );
  }
}
