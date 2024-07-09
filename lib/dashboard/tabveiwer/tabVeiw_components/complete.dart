import 'package:flutter/material.dart';

class Com_Complete extends StatelessWidget {
  final String image;
  final String month;
  final String amount;
  const Com_Complete(
      {super.key,
      required this.amount,
      required this.month,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color.fromARGB(115, 255, 255, 255), // Background color
          border: Border.all(color: const Color.fromARGB(255, 224, 224, 224)),
          borderRadius: BorderRadius.circular(20) // Border color
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(height: 20, child: Image.asset(image)),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Text(
                        month,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
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
            child: Text(
              "$amount THB",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
