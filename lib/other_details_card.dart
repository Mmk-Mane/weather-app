import 'package:flutter/material.dart';

class OtherDetailsCard extends StatelessWidget {
  const OtherDetailsCard(
      {super.key,
      required this.title,
      required this.value,
      required this.otherIcons});

  final String title;
  final double value;
  final IconData otherIcons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            maxLines: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          Icon(
            otherIcons,
            color: Colors.white,
            size: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            value.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
