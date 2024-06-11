import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final String head;
  final String hintText;
  final IconData icon;

  Search(
      {super.key,
      required this.head,
      required this.hintText,
      required this.icon});

  TextEditingController userId1Controller = TextEditingController();

  TextEditingController userId2Controller = TextEditingController();

  TextEditingController userId3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: ((width - 80) / 3) - 12,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: Text(
                head,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NT"),
              ),
            ),
            SizedBox(
              height: 40,
              child: TextField(
                controller: userId3Controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 200, 200, 200)),
                        borderRadius: BorderRadius.circular(12)),
                    hintText: hintText,
                    hintStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12.0), // Add padding for the hint text
                    suffixIcon: IconButton(
                      icon: Icon(
                        icon,
                        size: 16,
                      ),
                      onPressed: () {},
                    )),
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
