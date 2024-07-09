import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:dashbord_flutter/dashboard/tabveiwer/tabVeiw_components/complete.dart';
import 'package:dashbord_flutter/dashboard/view_model/dashboard_complete_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Complete extends StatefulWidget {
  @override
  _CompleteState createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  final DashboardCompleteViewmodel dashboardCompleteViewmodel = getIt();
  String? selectedYear;

  @override
  void initState() {
    dashboardCompleteViewmodel.getComplete2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String convertNumber(double? number) {
      if (number == null) {
        return "";
      }
      if (number >= 1000) {
        return NumberFormat('#,###0.00').format(number);
      } else {
        return number.toString();
      }
    }

    return ChangeNotifierProvider(
      create: (context) => dashboardCompleteViewmodel,
      builder: (context, _) {
        return Container(
          child: Consumer<DashboardCompleteViewmodel>(
            builder: (context, viewModel, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 34),
                    color: ColorApp.white,
                    child: const Text(
                      "Years",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
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
                            if (newValue != null) {
                              dashboardCompleteViewmodel
                                  .getCompleteByYear(newValue);
                            }
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
                              color:
                                  Colors.transparent, // Transparent background
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                        ),
                      )),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Com_Complete(
                          amount: convertNumber(
                            (dashboardCompleteViewmodel
                                    .orderComplete.janValues ??
                                0.0) as double?,
                          ),
                          month: "January",
                          image: "assets/images/calender.png",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Com_Complete(
                          amount: convertNumber(
                            (dashboardCompleteViewmodel
                                    .orderComplete.febValues ??
                                0.0) as double?,
                          ),
                          month: "February",
                          image: "assets/images/calender.png",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Com_Complete(
                          amount: convertNumber(
                            (dashboardCompleteViewmodel
                                    .orderComplete.marValues ??
                                0.0) as double?,
                          ),
                          month: "March",
                          image: "assets/images/calender.png",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Com_Complete(
                          amount: convertNumber(
                            (dashboardCompleteViewmodel
                                    .orderComplete.aprValues ??
                                0.0) as double?,
                          ),
                          month: "April",
                          image: "assets/images/calender.png",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Com_Complete(
                          amount: convertNumber(
                            (dashboardCompleteViewmodel
                                    .orderComplete.mayValues ??
                                0.0) as double?,
                          ),
                          month: "May",
                          image: "assets/images/calender.png",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Com_Complete(
                          amount: convertNumber(
                            (dashboardCompleteViewmodel
                                    .orderComplete.junValues ??
                                0.0) as double?,
                          ),
                          month: "June",
                          image: "assets/images/calender.png",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Com_Complete(
                          amount: convertNumber(
                            (dashboardCompleteViewmodel
                                    .orderComplete.julValues ??
                                0.0) as double?,
                          ),
                          month: "July",
                          image: "assets/images/calender.png",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Com_Complete(
                          amount: convertNumber(
                            (dashboardCompleteViewmodel
                                    .orderComplete.augValues ??
                                0.0) as double?,
                          ),
                          month: "August",
                          image: "assets/images/calender.png",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Com_Complete(
                          amount: convertNumber(
                            (dashboardCompleteViewmodel
                                    .orderComplete.sepValues ??
                                0.0) as double?,
                          ),
                          month: "September",
                          image: "assets/images/calender.png",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Com_Complete(
                          amount: convertNumber(
                            (dashboardCompleteViewmodel
                                    .orderComplete.octValues ??
                                0.0) as double?,
                          ),
                          month: "October",
                          image: "assets/images/calender.png",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Com_Complete(
                          amount: convertNumber(
                            (dashboardCompleteViewmodel
                                    .orderComplete.novValues ??
                                0.0) as double?,
                          ),
                          month: "November",
                          image: "assets/images/calender.png",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Com_Complete(
                          amount: convertNumber(
                            (dashboardCompleteViewmodel
                                    .orderComplete.decValues ??
                                0.0) as double?,
                          ),
                          month: "December",
                          image: "assets/images/calender.png",
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
