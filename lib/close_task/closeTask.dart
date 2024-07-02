// ignore_for_file: file_names, camel_case_types

import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:flutter/material.dart';

class closeTask extends StatefulWidget {
  const closeTask({super.key});

  @override
  State<closeTask> createState() => _closetaskState();
}

class _closetaskState extends State<closeTask> {
  TextEditingController dateStartedController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void dispose() {
    dateStartedController.dispose();
    descriptionController.dispose(); // Dispose the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 195, 24, 24),
      body: Center(
        child: Container(
          width: width * 0.6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFFFFFFF)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Container(
                  //margin: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  width: double.infinity,
                  color: const Color.fromRGBO(254, 206, 0, 0.10),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Close Task",
                      style: TextStyle(
                          color: Color.fromARGB(255, 252, 181, 0),
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(40, 32, 0, 0),
                child: const Text(
                  "Date Started",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: dateStartedController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 200, 200, 200)),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: "[DD/MM/YYYY]",
                      hintStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 200, 200, 200)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 22), // Add padding for the hint text
                      suffixIcon: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        child: IconButton(
                          icon: const Icon(
                            Icons.calendar_today_outlined,
                            size: 24,
                          ),
                          onPressed: () {},
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(40, 32, 0, 0),
                child: const Text(
                  "Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: double.infinity, // Width of the TextField
                  height: 127, // Height of the TextField
                  child: TextField(
                    controller: descriptionController,
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 200, 200, 200),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Description",
                      hintStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 200, 200, 200),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(
                          22, 16, 22, 0), // Adjust top padding
                      isCollapsed:
                          true, // This will remove the default padding around the text field.
                      alignLabelWithHint:
                          true, // Ensures the label (hint text) aligns with the hint
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              //button
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //Cancel button
                    Container(
                      width: width * 0.09,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 241, 213, 85))),
                          textStyle: const TextStyle(fontSize: 14),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: buttonColor.yellow,
                                fontWeight: FontWeight.w700,
                                fontFamily: "NT",
                                fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    // OK Button
                    Container(
                      width: width * 0.09,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor.yellow,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                          child: Text(
                            'OK',
                            style: TextStyle(
                                color: ColorApp.white,
                                fontWeight: FontWeight.w700,
                                fontFamily: "NT",
                                fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
