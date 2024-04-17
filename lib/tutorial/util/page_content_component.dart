import 'package:flutter/material.dart';

class PageContentComponent extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;

  const PageContentComponent({
    Key? key,
    required this.title,
    required this.description,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imageAsset),
        const SizedBox(height: 50),
        Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text(description, textAlign: TextAlign.center),
      ],
    );
  }
}
