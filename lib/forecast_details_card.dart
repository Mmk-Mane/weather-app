import 'package:flutter/material.dart';

class ForecastDetailsCard extends StatelessWidget {
  const ForecastDetailsCard(
      {super.key,
      required this.hours,
      required this.temp,
      required this.foreCastIcon});

  final double hours;
  final double temp;
  final IconData foreCastIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Card(
        // color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                hours.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Icon(
                foreCastIcon,
                color: Colors.white,
                size: 35,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "$temp F",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
