import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final List<String>? dropdownList;
  final String? selectedItem;
  final ValueChanged<String>? callback;

  const Dropdown({
    super.key,
    this.dropdownList,
    this.selectedItem,
    this.callback,
  });

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? selectedValue;

  @override
  void initState() {
    selectedValue = widget.selectedItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: const Text(
          "My group & open",
          style: TextStyle(fontSize: 20, color: Color(0xFFC8C8C8)),
        ),
        items: (widget.dropdownList ?? [])
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style:
                        const TextStyle(fontSize: 20, color: Color(0xFFC8C8C8)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
          });
          widget.callback?.call(value ?? "");
        },
        iconStyleData: const IconStyleData(
          icon: Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.keyboard_arrow_down_rounded),
          ),
          iconSize: 20,
          iconEnabledColor: Color(0xFF3C3C3C),
          iconDisabledColor: Colors.grey,
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.only(right: 14, left: 14),
        ),
      ),
    );
  }
}
