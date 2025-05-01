import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;
  final Color borderColor;
  final Color fillColor;
  final Color checkColor;
  final ShapeBorder shape;

  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.size = 20.0,
    this.borderColor = const Color(0xff1960FF),
    this.fillColor = const Color(0xffDAF1FF),
    this.checkColor = const Color(0xff1960FF),
    this.shape = const RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xff1960FF),
        width: 1,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: size,
        height: size,
        decoration: ShapeDecoration(
          color: value ? fillColor : Colors.transparent,
          shape: shape,
          shadows: value
              ? [const BoxShadow(color: Colors.black12, blurRadius: 2)]
              : null,
        ),
        child: value
            ? Center(
                child: Icon(
                  Icons.check,
                  size: size * 0.6,
                  color: checkColor,
                ),
              )
            : null,
      ),
    );
  }
}
