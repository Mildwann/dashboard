import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:flutter/material.dart';

class Standardsearch extends StatelessWidget {
  final String head;
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  Standardsearch({
    Key? key,
    required this.head,
    required this.hintText,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: ((width - 100) / 3) - 30,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Text(
                head,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: "NT",
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: ColorApp.borderColorSearch),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: hintText,
                  hintStyle: const TextStyle(fontSize: 13),
                  suffixIcon: IconButton(
                    icon: Icon(
                      icon,
                      size: 16,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
