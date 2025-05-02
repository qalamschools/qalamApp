import 'package:flutter/material.dart';

class CustomScrollBarWidget extends StatefulWidget {
  final ScrollController controller;
  final double trackWidth;
  final double thumbWidth;
  final double trackHeight;
  final double thumbHeight;
  final Color trackColor;
  final Color thumbColor;

  const CustomScrollBarWidget({
    super.key,
    required this.controller,
    this.trackWidth = 250,
    this.thumbWidth = 37,
    this.trackHeight = 4,
    this.thumbHeight = 8,
    this.trackColor = const Color(0xFFFFCDD2),
    this.thumbColor = const Color(0xFFC62828),
  });

  @override
  State<CustomScrollBarWidget> createState() => _CustomScrollBarWidgetState();
}

class _CustomScrollBarWidgetState extends State<CustomScrollBarWidget> {
  double _thumbOffset = 0.0;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateThumbPosition);
  }

  void _updateThumbPosition() {
    if (_isDragging) return;

    final scrollExtent = widget.controller.position.maxScrollExtent;
    final scrollOffset = widget.controller.offset;
    final availableTrack = widget.trackWidth - widget.thumbWidth;

    if (scrollExtent <= 0) return;

    setState(() {
      _thumbOffset = (scrollOffset / scrollExtent) * availableTrack;
    });
  }

  void _onThumbDragUpdate(DragUpdateDetails details) {
    setState(() {
      _thumbOffset += details.delta.dx;
      _thumbOffset =
          _thumbOffset.clamp(0.0, widget.trackWidth - widget.thumbWidth);
    });

    final maxScroll = widget.controller.position.maxScrollExtent;
    final availableTrack = widget.trackWidth - widget.thumbWidth;
    final scrollPosition = (_thumbOffset / availableTrack) * maxScroll;

    widget.controller.jumpTo(scrollPosition);
  }

  void _onThumbDragStart(_) => _isDragging = true;

  void _onThumbDragEnd(_) => _isDragging = false;

  @override
  void dispose() {
    widget.controller.removeListener(_updateThumbPosition);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.trackWidth,
      height: 20,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            top: (20 - widget.trackHeight) / 2,
            child: Container(
              width: widget.trackWidth,
              height: widget.trackHeight,
              decoration: BoxDecoration(
                color: widget.trackColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            left: _thumbOffset,
            top: (20 - widget.thumbHeight) / 2,
            child: GestureDetector(
              onHorizontalDragStart: _onThumbDragStart,
              onHorizontalDragUpdate: _onThumbDragUpdate,
              onHorizontalDragEnd: _onThumbDragEnd,
              child: Container(
                width: widget.thumbWidth,
                height: widget.thumbHeight,
                decoration: BoxDecoration(
                  color: widget.thumbColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
