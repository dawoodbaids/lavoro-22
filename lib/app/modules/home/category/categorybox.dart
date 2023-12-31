import 'package:flutter/material.dart';

import 'categorypage.dart';

class CategoryBox extends StatelessWidget {
  final String imagePath;
  final String name;
  final Function(String, String) onPressed;

  const CategoryBox({
    super.key,
    required this.imagePath,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to CategoryPage and send the name
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategoryPage(
                    categoryName: name,
                    imagepath: imagePath,
                  )),
        );
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 5),
            Text(name, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
