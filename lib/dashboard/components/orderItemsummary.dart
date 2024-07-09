import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:dashbord_flutter/gen/assets.gen.dart';

import 'package:flutter/material.dart';

class Orderitemsummary extends StatelessWidget {
  final String title;
  final String amount;
  final Image image;
  final String total;

  const Orderitemsummary({
    super.key,
    required this.title,
    required this.amount,
    required this.image,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
      decoration: BoxDecoration(
          color: ColorApp.white, // Background color
          border: Border.all(color: ColorApp.borderColor),
          borderRadius: BorderRadius.circular(20) // Border color
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: image),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Text(
                  "$amount THB",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  "$total Item",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
