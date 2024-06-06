import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Complete extends StatefulWidget {
  @override
  _CompleteState createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  String? selectedYear; // Declare as nullable string for initial state

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 18),
            color: const Color.fromARGB(255, 255, 255, 255),
            child: const Text(
              "Years",
              style: TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(238, 231, 227, 227),
              ), // Border color
              borderRadius: BorderRadius.circular(8.0),
            ),
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
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          115, 255, 255, 255), // Background color
                      border: Border.all(
                          color: const Color.fromARGB(238, 231, 227, 227)),
                      borderRadius: BorderRadius.circular(12) // Border color
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 15,
                                  color: Colors.green,
                                ),
                                Flexible(
                                  child: Text(
                                    "January",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "90,000.00 THB",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          115, 255, 255, 255), // Background color
                      border: Border.all(
                          color: const Color.fromARGB(238, 231, 227, 227)),
                      borderRadius: BorderRadius.circular(12) // Border color
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 15,
                                  color: Colors.green,
                                ),
                                Flexible(
                                  child: Text(
                                    "February",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "90,000.00 THB",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          115, 255, 255, 255), // Background color
                      border: Border.all(
                          color: const Color.fromARGB(238, 231, 227, 227)),
                      borderRadius: BorderRadius.circular(12) // Border color
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 15,
                                  color: Colors.green,
                                ),
                                Flexible(
                                  child: Text(
                                    "March",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "90,000.00 THB",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          115, 255, 255, 255), // Background color
                      border: Border.all(
                          color: const Color.fromARGB(238, 231, 227, 227)),
                      borderRadius: BorderRadius.circular(12) // Border color
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 15,
                                  color: Colors.green,
                                ),
                                Flexible(
                                  child: Text(
                                    "Aprill",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "90,000.00 THB",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          115, 255, 255, 255), // Background color
                      border: Border.all(
                          color: const Color.fromARGB(238, 231, 227, 227)),
                      borderRadius: BorderRadius.circular(12) // Border color
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 15,
                                  color: Colors.green,
                                ),
                                Flexible(
                                  child: Text(
                                    "May",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "90,000.00 THB",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          115, 255, 255, 255), // Background color
                      border: Border.all(
                          color: const Color.fromARGB(238, 231, 227, 227)),
                      borderRadius: BorderRadius.circular(12) // Border color
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 15,
                                  color: Colors.green,
                                ),
                                Flexible(
                                  child: Text(
                                    "June",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "90,000.00 THB",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          115, 255, 255, 255), // Background color
                      border: Border.all(
                          color: const Color.fromARGB(238, 231, 227, 227)),
                      borderRadius: BorderRadius.circular(12) // Border color
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 15,
                                  color: Colors.green,
                                ),
                                Flexible(
                                  child: Text(
                                    "July",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "90,000.00 THB",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          115, 255, 255, 255), // Background color
                      border: Border.all(
                          color: const Color.fromARGB(238, 231, 227, 227)),
                      borderRadius: BorderRadius.circular(12) // Border color
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 15,
                                  color: Colors.green,
                                ),
                                Flexible(
                                  child: Text(
                                    "August",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "90,000.00 THB",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          115, 255, 255, 255), // Background color
                      border: Border.all(
                          color: const Color.fromARGB(238, 231, 227, 227)),
                      borderRadius: BorderRadius.circular(12) // Border color
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 15,
                                  color: Colors.green,
                                ),
                                Flexible(
                                  child: Text(
                                    "September",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "90,000.00 THB",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          115, 255, 255, 255), // Background color
                      border: Border.all(
                          color: const Color.fromARGB(238, 231, 227, 227)),
                      borderRadius: BorderRadius.circular(12) // Border color
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 15,
                                  color: Colors.green,
                                ),
                                Flexible(
                                  child: Text(
                                    "October",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "90,000.00 THB",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          115, 255, 255, 255), // Background color
                      border: Border.all(
                          color: const Color.fromARGB(238, 231, 227, 227)),
                      borderRadius: BorderRadius.circular(12) // Border color
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 15,
                                  color: Colors.green,
                                ),
                                Flexible(
                                  child: Text(
                                    "November",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "90,000.00 THB",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          115, 255, 255, 255), // Background color
                      border: Border.all(
                          color: const Color.fromARGB(238, 231, 227, 227)),
                      borderRadius: BorderRadius.circular(12) // Border color
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 15,
                                  color: Colors.green,
                                ),
                                Flexible(
                                  child: Text(
                                    "December",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "90,000.00 THB",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
