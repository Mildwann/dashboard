// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final String head;
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  const Search({
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
      width: ((width - 80) / 3) - 12,
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
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 200, 200, 200),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12.0,
                ),
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
    );
  }
}
