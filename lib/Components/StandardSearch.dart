import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:flutter/material.dart';

class Standardsearch extends StatelessWidget {
  final String head;
  final String hintText;
  final IconData icon;

  Standardsearch(
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
      width: ((width - 100) / 3) - 10,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: height * 0.005),
              child: Text(
                head,
                style: TextStyle(fontSize: 11),
              ),
            ),
            SizedBox(
              height: 30,
              child: TextField(
                controller: userId3Controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ColorApp.borderColorSearch),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: hintText,
                    hintStyle: const TextStyle(fontSize: 13),
                    suffixIcon: IconButton(
                      icon: Icon(
                        icon,
                        size: 16,
                      ),
                      onPressed: () {},
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
