import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'categorybox.dart';

class CategoriesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CategoryBox(
          imagePath: 'assets/images/sql.png',
          name: 'sql',
          onPressed: (String imagePath, String name) {
            handleCategorySelection(imagePath, name);
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/Py.png',
          name: 'Paython',
          onPressed: (String imagePath, String name) {
            handleCategorySelection(imagePath, name);
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/c#.png',
          name: 'C# (C-Sharp) ',
          onPressed: (String imagePath, String name) {
            handleCategorySelection(imagePath, name);
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/flutter.png',
          name: 'Flutter',
          onPressed: (String imagePath, String name) {
            handleCategorySelection(imagePath, name);
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/html.png',
          name: 'Html',
          onPressed: (String imagePath, String name) {
            handleCategorySelection(imagePath, name);
          },
        ),
        CategoryBox(
          imagePath: 'assets/images/others.png',
          name: 'Other',
          onPressed: (String imagePath, String name) {
            handleCategorySelection(imagePath, name);
          },
        ),
      ],
    );
   
  }

// ignore: non_constant_identifier_names

  void handleCategorySelection(String imagePath, String name) {
    // Implement your logic to handle the selected category
    if (kDebugMode) {
      print('Selected Category: $name, Image Path: $imagePath');
    }
  }
}