import 'package:flutter/material.dart';
import 'package:test_2/widgets/destination_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> destinations = [
    {
      "destination_name": "Pink Beach",
      "location": "Lombok",
      "ratings": 4.7,
      "image_path": "assets/pink_beach.png",
    },
    {
      "destination_name": "Gunung Rinjani",
      "location": "Lombok",
      "ratings": 4.5,
      "image_path": "assets/rinjani.png",
    },
    {
      "destination_name": "Candi Borobudur",
      "location": "Jawa Tengah",
      "ratings": 4.3,
      "image_path": "assets/borobudur.png",
    },
    {
      "destination_name": "Raja Ampat",
      "location": "Papua",
      "ratings": 4.8,
      "image_path": "assets/raja_ampat.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text("Tempat Populer"),
        leading: BackButton(
          onPressed: () {},
        ),
        elevation: 8,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: destinations.map((destination) {
            return Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                DestinationCard(
                    destinationName: destination["destination_name"],
                    imagePath: destination["image_path"],
                    ratings: destination["ratings"],
                    location: destination["location"]),
                (destinations.indexOf(destination) == destinations.length - 1)
                    ? const SizedBox(height: 24)
                    : const SizedBox.shrink()
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
