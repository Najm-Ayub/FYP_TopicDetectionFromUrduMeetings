import 'package:flutter/material.dart';
import 'package:topicdetectionweb/ui/common/app_strings.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';

class CardWidget extends StatefulWidget {
  final String pic;
  final String name;
  final String description;

  const CardWidget({
    Key? key,
    required this.pic,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: Matrix4.translationValues(
          0,
          0,
          isHovered
              ? -50
              : 0, // Adjust the translation value for forward movement
        ),
        decoration: BoxDecoration(
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10.0,
                    offset: Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: SizedBox(
          width: 250,
          height: 300,
          child: Card(
            color:
                isHovered ? Color.fromARGB(255, 241, 240, 240) : Colors.white,
            elevation: 3,
            child: Column(
              children: [
                verticalSpaceMedium,
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                    image: DecorationImage(
                      image: AssetImage(widget.pic),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                verticalSpaceSmall,
                Text(widget.name),
                verticalSpaceSmall,
                Text(widget.description),
                verticalSpaceLarge,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(twitter),
                      width: 20,
                      height: 20,
                    ),
                    horizontalSpaceSmall,
                    Image(
                      image: AssetImage(linkdinicon),
                      width: 20,
                      height: 20,
                    ),
                    horizontalSpaceSmall,
                    Image(
                      image: AssetImage(githubicon),
                      width: 20,
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
