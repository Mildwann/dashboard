import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:dashbord_flutter/dashboard/tabveiwer/tabVeiw_components/complete.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';

class Complete extends StatefulWidget {
  @override
  _CompleteState createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  String? selectedYear; // Declare as nullable string for initial state

  @override
  Widget build(BuildContext context) {
    String convertNumber(double number) {
      if (number >= 1000) {
        return NumberFormat('#,###0.00').format(number);
      } else {
        return number.toString();
      }
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 34),
            color: ColorApp.white,
            child: const Text(
              "Years",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: orderItem.bordercomplete,
              ), // Border color
              borderRadius: BorderRadius.circular(8.0),
            ),

            //Dropdown
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  'Select Year',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                value: selectedYear,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedYear = newValue;
                  });
                },
                items: <String>['2022', '2023', '2024', '2025']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.transparent, // Transparent background
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: Com_Complete(
                      amount: convertNumber(90000),
                      month: "January",
                      image: "assets/images/calender.png")),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Com_Complete(
                      amount: convertNumber(90000),
                      month: "February",
                      image: "assets/images/calender.png")),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Com_Complete(
                      amount: convertNumber(90000),
                      month: "March",
                      image: "assets/images/calender.png")),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: Com_Complete(
                      amount: convertNumber(90000),
                      month: "Aprill",
                      image: "assets/images/calender.png")),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Com_Complete(
                      amount: convertNumber(90000),
                      month: "May",
                      image: "assets/images/calender.png")),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Com_Complete(
                      amount: convertNumber(90000),
                      month: "June",
                      image: "assets/images/calender.png")),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: Com_Complete(
                      amount: convertNumber(90000),
                      month: "July",
                      image: "assets/images/calender.png")),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Com_Complete(
                      amount: convertNumber(90000),
                      month: "August",
                      image: "assets/images/calender.png")),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Com_Complete(
                      amount: convertNumber(90000),
                      month: "September",
                      image: "assets/images/calender.png")),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: Com_Complete(
                      amount: convertNumber(90000),
                      month: "October",
                      image: "assets/images/calender.png")),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Com_Complete(
                      amount: convertNumber(90000),
                      month: "November",
                      image: "assets/images/calender.png")),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Com_Complete(
                      amount: convertNumber(90000),
                      month: "December",
                      image: "assets/images/calender.png")),
            ],
          ),
        ],
      ),
    );
  }
}
