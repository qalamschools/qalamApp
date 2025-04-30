import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMultiSelectDropDown<T> extends StatefulWidget {
  /// The list of items to display in the dropdown.  Required.
  final List<T> items;

  /// A function to convert an item `T` to a human-readable string. Required.
  final String Function(T) itemAsString;

  /// Called when the selected items change.  Passes the new list of selected items. Required.
  final void Function(List<T>) onSelectionChanged;

  /// The initially selected items.  Optional.
  final List<T>? initialSelection;

  /// The text to display as a hint when no items are selected. Default: "Select reason".
  final String? hintText;

  /// The text to display when the dropdown is expanded. Default: "Select reason".
  final String? title;

  /// The background color of the dropdown. Default: `Colors.white`.
  final Color? backgroundColor;

  /// The color of the text in the dropdown. Default: `Colors.black`.
  final Color? textColor;

  /// The color of the selected items' text. Default: `Colors.blue`.
  final Color? selectedTextColor;

  /// The background color of the selected items in the dropdown list. Default: `Colors.white`.
  final Color? selectedItemBackgroundColor;

  /// The border color of the dropdown. Default: `Colors.grey`.
  final Color? dropdownBorderColor;

  /// The border radius of the dropdown. Default: `5.0`.
  final double? dropdownBorderRadius;

  /// The width of the dropdown's border. Default: `1.0`.
  final double? dropdownBorderWidth;

  /// The style of the hint text.
  final TextStyle? hintTextStyle;

  /// The style of the text in the dropdown.
  final TextStyle? textStyle;

  /// The style of the selected items' text.
  final TextStyle? selectedTextStyle;

  /// The shape of the dropdown.
  final OutlinedBorder? dropdownShape;

  /// The shape of the checkbox.
  final OutlinedBorder? checkboxShape;

  /// Whether to show a clear all button. Default: `false`.  (always false in your design)
  final bool showClearAll;

  /// Text for the clear all button. Default: "Clear All".
  final String? clearAllText;

  /// Style for the clear all button text.
  final TextStyle? clearAllTextStyle;

  /// Icon for the clear all button.
  final IconData? clearAllIcon;

  /// Whether to show the items count. Default: `false`.
  final bool showItemsCount;

  /// Style for the items count.
  final TextStyle? itemsCountTextStyle;

  /// Builder for the selected items display.
  final Widget Function(List<T> selectedItems)? selectedItemsBuilder;

  /// A custom TextFormField to trigger the dropdown.
  final InputDecoration? textFormFieldDecoration;

  /// Max height of the dropdown when expanded.
  final double? dropdownMaxHeight;

  /// Creates a custom multi-select dropdown widget.
  const CustomMultiSelectDropDown({
    Key? key,
    required this.items,
    required this.itemAsString,
    required this.onSelectionChanged,
    this.initialSelection,
    this.hintText = "Select reason", // changed default
    this.title = "Select reason", // changed default
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.selectedTextColor = Colors.blue,
    this.selectedItemBackgroundColor = Colors.white, //changed default
    this.dropdownBorderColor = Colors.grey,
    this.dropdownBorderRadius = 5.0,
    this.dropdownBorderWidth = 1.0,
    this.hintTextStyle,
    this.textStyle,
    this.selectedTextStyle,
    this.dropdownShape,
    this.checkboxShape,
    this.showClearAll = false, // changed default
    this.clearAllText = "Clear All",
    this.clearAllTextStyle,
    this.clearAllIcon = Icons.close,
    this.showItemsCount = false,
    this.itemsCountTextStyle,
    this.selectedItemsBuilder,
    this.textFormFieldDecoration,
    this.dropdownMaxHeight = 400, // Added max height, default value
  }) : super(key: key);

  @override
  _CustomMultiSelectDropDownState<T> createState() =>
      _CustomMultiSelectDropDownState<T>();
}

class _CustomMultiSelectDropDownState<T>
    extends State<CustomMultiSelectDropDown<T>> {
  List<T> _selectedItems = [];
  bool _isExpanded = false;
  final ListEquality<T> _listEquality =
      const ListEquality(); // Use ListEquality
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.initialSelection ?? [];
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  // Toggles the selection state of an item.
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

  // Clears all selected items.
  void _clearAll() {
    setState(() {
      _selectedItems.clear();
      widget.onSelectionChanged(_selectedItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultHintTextStyle = TextStyle(
      fontSize: 16,
      color: widget.textColor ?? Colors.grey,
    );

    final defaultTextStyle = TextStyle(
      fontSize: 16,
      color: widget.textColor ?? Colors.black,
    );

    final defaultSelectedTextStyle = TextStyle(
      fontSize: 16,
      color: widget.selectedTextColor ?? Colors.blue,
    );

    final defaultItemsCountTextStyle = TextStyle(
      fontSize: 12,
      color: widget.textColor ?? Colors.black,
    );

    final selectedItemBackgroundColor = widget.selectedItemBackgroundColor ??
        Colors.white; //now defaults to white

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Focus(
          onFocusChange: (hasFocus) {
            if (hasFocus) {
              setState(() {
                _isExpanded = true;
              });
            }
          },
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
              if (!_isExpanded) {
                _focusNode.unfocus();
              }
            },
            child: TextFormField(
              focusNode: _focusNode,
              readOnly: true,
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              decoration: widget.textFormFieldDecoration ??
                  InputDecoration(
                    label: Text(
                      'Reason for Contacting',
                      style: GoogleFonts.nunitoSans(
                          color: const Color(0xff6E727A),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    hintStyle: GoogleFonts.nunitoSans(
                      color: const Color(0xFF7D7D7D),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: widget.hintText,
                    suffixIcon: Icon(
                      _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: widget.textColor ?? Colors.black,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                  ),
              style: widget.textStyle ?? defaultTextStyle,
              controller: TextEditingController(
                text: _selectedItems.isNotEmpty
                    ? _selectedItems
                        .map((item) => widget.itemAsString(item))
                        .join(', ')
                    : null,
              ),
            ),
          ),
        ),
        if (_isExpanded) ...{
          SizedBox(
            height: 10.h,
          ),
          Card(
            child: Container(
              height: widget.dropdownMaxHeight ?? 200,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: widget.backgroundColor ?? Colors.white,
                borderRadius:
                    BorderRadius.circular(widget.dropdownBorderRadius ?? 5.0),
                // border: Border.all(
                //   color: widget.dropdownBorderColor ?? Colors.grey,
                //   width: widget.dropdownBorderWidth ?? 1.0,
                // ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Scrollbar(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: widget.items.length,
                        itemBuilder: (context, index) {
                          final item = widget.items[index];
                          final isSelected = _selectedItems.contains(item);
                          return InkWell(
                            onTap: () => _toggleItemSelection(item),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0), // increased padding
                              color: isSelected
                                  ? selectedItemBackgroundColor
                                  : Colors.transparent,
                              child: Row(
                                children: [
                                  Checkbox(
                                    side: BorderSide(
                                        width: 1,
                                        color: isSelected
                                            ? const Color(0xff1960FF)
                                            : const Color(0xff1960FF)),
                                    value: isSelected,
                                    onChanged: (checked) =>
                                        _toggleItemSelection(item),
                                    fillColor: const WidgetStatePropertyAll(
                                        Color(0xffDAF1FF)),
                                    shape: widget.checkboxShape,
                                    checkColor: const Color(0xff1960FF),
                                    activeColor: const Color(0xff1960FF),
                                  ),
                                  const SizedBox(width: 6), // increased spacing
                                  Expanded(
                                    child: Text(
                                      widget.itemAsString(item),
                                      style: isSelected
                                          ? widget.selectedTextStyle ??
                                              defaultSelectedTextStyle
                                          : widget.textStyle ??
                                              defaultTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        }
      ],
    );
  }

  @override
  void didUpdateWidget(covariant CustomMultiSelectDropDown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the items or initial selection has changed.
    if (!_listEquality.equals(oldWidget.items, widget.items) ||
        !_listEquality.equals(
            oldWidget.initialSelection, widget.initialSelection)) {
      // Update the selected items based on the new initial selection.
      setState(() {
        _selectedItems = widget.initialSelection ?? [];
      });
    }
  }
}
