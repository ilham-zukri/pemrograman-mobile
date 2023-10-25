import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class DestinationCard extends StatefulWidget {
  final String destinationName;
  final String imagePath;
  final double ratings;
  final String location;

  const DestinationCard(
      {super.key,
      required this.destinationName,
      required this.imagePath,
      required this.ratings,
      required this.location});

  @override
  State<DestinationCard> createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  late String destinationName;
  late String imagePath;
  late double ratings;
  late String location;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    destinationName = widget.destinationName;
    imagePath = widget.imagePath;
    ratings = widget.ratings;
    location = widget.location;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 230,
      child: Card(
        elevation: 10,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: Image(
                width: size.width,
                height: 165,
                fit: BoxFit.cover,
                image: AssetImage(imagePath),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 8, left: 8),
                      child: Text(
                        destinationName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 2, left: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            ratings.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(
                            Icons.pin_drop_sharp,
                            color: Colors.blue,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            location,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16, top: 10),
                  child: LikeButton(
                    size: 24,
                    circleColor: const CircleColor(
                        start: Color(0xffff0000), end: Colors.pink),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: Color(0xffe53380),
                      dotSecondaryColor: Color(0xffe91e63),
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        CupertinoIcons.suit_heart_fill,
                        color: isLiked ? Colors.pink : Colors.grey,
                        size: 24,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


