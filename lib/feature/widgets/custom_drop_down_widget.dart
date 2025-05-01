import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMultiSelectDropDown<T> extends StatefulWidget {
  final List<T> items;
  final String Function(T) itemAsString;
  final void Function(List<T>) onSelectionChanged;
  final List<T>? initialSelection;
  final String? hintText;
  final String? title;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? selectedTextColor;
  final Color? selectedItemBackgroundColor;
  final Color? dropdownBorderColor;
  final double? dropdownBorderRadius;
  final double? dropdownBorderWidth;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final TextStyle? selectedTextStyle;
  final OutlinedBorder? dropdownShape;
  final OutlinedBorder? checkboxShape;
  final bool showClearAll;
  final String? clearAllText;
  final TextStyle? clearAllTextStyle;
  final IconData? clearAllIcon;
  final bool showItemsCount;
  final TextStyle? itemsCountTextStyle;
  final Widget Function(List<T> selectedItems)? selectedItemsBuilder;
  final InputDecoration? textFormFieldDecoration;
  final double? dropdownMaxHeight;
  final Function(bool value) onTap;
  final bool isExpanded;

  const CustomMultiSelectDropDown({
    Key? key,
    required this.items,
    required this.itemAsString,
    required this.onSelectionChanged,
    required this.onTap,
    this.initialSelection,
    this.hintText = "Select reason",
    this.title = "Select reason",
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.selectedTextColor = Colors.blue,
    this.selectedItemBackgroundColor = Colors.white,
    this.dropdownBorderColor = Colors.grey,
    this.dropdownBorderRadius = 5.0,
    this.dropdownBorderWidth = 1.0,
    this.hintTextStyle,
    this.textStyle,
    this.selectedTextStyle,
    this.dropdownShape,
    this.checkboxShape,
    this.showClearAll = false,
    this.clearAllText = "Clear All",
    this.clearAllTextStyle,
    this.clearAllIcon = Icons.close,
    this.showItemsCount = false,
    this.itemsCountTextStyle,
    this.selectedItemsBuilder,
    this.textFormFieldDecoration,
    this.dropdownMaxHeight = 300,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<CustomMultiSelectDropDown<T>> createState() =>
      _CustomMultiSelectDropDownState<T>();
}

class _CustomMultiSelectDropDownState<T>
    extends State<CustomMultiSelectDropDown<T>> {
  final FocusNode _focusNode = FocusNode();
  late List<T> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = List<T>.from(widget.initialSelection ?? []);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _toggleItemSelection(T item) {
    setState(() {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        _selectedItems.add(item);
      }
      widget.onSelectionChanged(_selectedItems);
    });
  }

  TextStyle _getTextStyle(bool isSelected) {
    return isSelected
        ? widget.selectedTextStyle ??
            TextStyle(fontSize: 16, color: widget.selectedTextColor)
        : widget.textStyle ?? TextStyle(fontSize: 16, color: widget.textColor);
  }

  Widget _buildDropdownItem(T item) {
    final isSelected = _selectedItems.contains(item);
    return InkWell(
      onTap: () => _toggleItemSelection(item),
      child: Row(
        children: [
          Checkbox(
            side: WidgetStateBorderSide.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const BorderSide(color: Color(0xff1960FF));
              } else {
                return const BorderSide(color: Color(0xff1960FF));
              }
            }),
            value: isSelected,
            onChanged: (checked) => _toggleItemSelection(item),
            fillColor: const WidgetStatePropertyAll(Color(0xffDAF1FF)),
            shape: widget.checkboxShape,
            checkColor: const Color(0xff1960FF),
            activeColor: const Color(0xff1960FF),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              widget.itemAsString(item),
              style: _getTextStyle(isSelected),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        child: Container(
          height: widget.dropdownMaxHeight,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius:
                BorderRadius.circular(widget.dropdownBorderRadius ?? 5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListView.builder(
            itemCount: widget.items.length,
            itemBuilder: (context, index) =>
                _buildDropdownItem(widget.items[index]),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration() {
    return widget.textFormFieldDecoration ??
        InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(
            widget.title!,
            style: GoogleFonts.nunitoSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xff6E727A),
            ),
          ),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.nunitoSans(
            color: const Color(0xFF7D7D7D),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: Icon(
            widget.isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: widget.textColor,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        );
  }

  void _handleTap() {
    widget.onTap(!widget.isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _handleTap,
          child: TextFormField(
            focusNode: _focusNode,
            readOnly: true,
            onTap: _handleTap,
            decoration: _buildInputDecoration(),
            style: widget.textStyle ??
                TextStyle(fontSize: 16, color: widget.textColor),
          ),
        ),
        if (widget.isExpanded) _buildDropdown(),
        SizedBox(height: 15.h),
        Wrap(
          alignment: WrapAlignment.start,
          runSpacing: 5,
          children: _selectedItems.map((reason) {
            return Chip(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color(0xffF3F3F3),
                ),
                borderRadius: BorderRadius.circular(59),
              ),
              backgroundColor: const Color(0xffF3F3F3),
              surfaceTintColor: const Color(0xffF3F3F3),
              label: Text(
                reason as String,
                style: GoogleFonts.nunitoSans(
                  color: const Color(0xFF7D7D7D),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              deleteIconColor: const Color(0xff4B4B4B),
              deleteIcon: SvgPicture.asset("assets/icons/cross.svg"),
              onDeleted: () {
                setState(() {
                  _selectedItems.remove(reason);
                });
              },
            );
          }).toList(),
        )
      ],
    );
  }
}
