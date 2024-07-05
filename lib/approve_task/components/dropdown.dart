import 'package:dashbord_flutter/approve_task/model/approve_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownApprove extends StatelessWidget {
  final List<Items>? listItem;
  final Items? selectedValue;
  final Function(Items)? callback;
  final TextEditingController controller;

  const DropdownApprove({
    required this.controller,
    this.listItem,
    this.selectedValue,
    this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Approval Status",
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<Items>(
              isExpanded: true,
              hint: const Text(
                "My group & open",
                style: TextStyle(fontSize: 20, color: Color(0xFFC8C8C8)),
              ),
              items: (listItem ?? [])
                  .map((Items item) => DropdownMenuItem<Items>(
                        value: item,
                        child: Text(
                          item.value ?? "",
                          style: const TextStyle(
                              fontSize: 20, color: Color(0xFFC8C8C8)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (Items? value) {
                if (value != null) {
                  controller.text = value.key ?? "";
                  callback?.call(value);
                }
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
          ),
        ),
      ],
    );
  }
}
