import 'package:flutter/material.dart';

class GrabIconMenu extends StatelessWidget {
  final String image;
  final String title;

  const GrabIconMenu({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  bool isNetworkImage(String path) {
    return path.startsWith('http://') || path.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isNetworkImage(image)
            ? Image.network(
                image,
                width: 40,
                height: 40,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.broken_image, size: 40),
              )
            : Image.asset(
                image,
                width: 40,
                height: 40,
              ),
        SizedBox(height: 8),
        Text(title, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
