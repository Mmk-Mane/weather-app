import 'package:flutter/material.dart';

class CurrentWaeatherDetailsCard extends StatelessWidget {
  const CurrentWaeatherDetailsCard(
      {super.key,
      required this.cityName,
      required this.weatherLine,
      required this.currentTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherIcon});

  final String cityName;
  final String weatherLine;
  final double currentTemp;
  final double maxTemp;
  final double minTemp;
  final IconData weatherIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        //color: Colors.amberAccent,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8, top: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                cityName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                weatherLine,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Icon(
                weatherIcon,
                color: Colors.white,
                size: 60,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "$currentTemp F",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Max",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "$maxTemp F",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 2,
                      color: Colors.white,
                    ),
                    Column(
                      children: [
                        const Text(
                          "Min",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "$minTemp F",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
