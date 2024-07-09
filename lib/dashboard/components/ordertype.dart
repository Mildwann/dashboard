import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:flutter/material.dart';

class Ordertype extends StatelessWidget {
  final String title;
  final String amount;
  final String order;
  final Color color;
  final String image;
  const Ordertype(
      {super.key,
      required this.title,
      required this.amount,
      required this.order,
      required this.color,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 15, 32, 15),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              title,
              style: const TextStyle(
                  color: ColorApp.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Flexible(
            child: Text(
              "$amount THB",
              style: const TextStyle(
                  color: ColorApp.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Flexible(
                  child: Container(
                      height: 20,
                      child: Image.asset(
                        image,
                        fit: BoxFit.contain,
                      ))),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Text(
                    "$order Order",
                    style: const TextStyle(
                        color: ColorApp.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
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
