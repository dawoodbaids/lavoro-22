// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavoro/app/modules/home/widgets/custom_adv.dart';

import '../../../global_widgets/text_theme.dart';
import '../category/categorybox.dart';


class HomeBody extends StatelessWidget {
  const HomeBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSection(),
          SizedBox(height: 20),
          Text(
            "Programming Languages",
            style: AppStyles.headLine3.copyWith(
              color: Get.theme.colorScheme.onBackground,
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection:
                Axis.horizontal, // Make the row horizontally scrollable
            child: CategoriesRow(),
          ),
          SizedBox(height: 10),
        
        ],
      ),
    );
  }
}

class CarouselSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Adjust the height as needed
      child: CarouselContainer(
        imageUrls: [
          'https://mostaql.hsoubcdn.com/uploads/thumbnails/1176897/63ad33c83c003/12218.jpg',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkBpXijVUC9uaLqxV7Ps8CBbnf--09zyqt9Q&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLPRPv1Ko9oqB7h_IvOWcRVP5AGaotcoROFg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKpTZcDIHJw977lAspfwFlhEGWbrpIb6_eAg&usqp=CAU',
          'https://scontent.famm11-1.fna.fbcdn.net/v/t31.18172-8/10353289_911160948900469_4877796891270672131_o.jpg?_nc_cat=107&ccb=1-7&_nc_sid=c2f564&_nc_eui2=AeGS7vjyLJRTMthDK17fX7yx3KJz2SYqRMfconPZJipEx6Z-6sFIBzLERiV-s2cBwVJv0zqyppof7lXJ9mpKBCyR&_nc_ohc=IPsYmmB2ORwAX9G1L1M&_nc_ht=scontent.famm11-1.fna&oh=00_AfDHlv1O98lQT1StsdQkeAN657gswUc_YVElDYuFCYjtKA&oe=65B28002',
        ],
        imageLinks: [
          "https://www.google.com/",
          "https://www.google.com/",
          "https://www.google.com/",
          "https://www.google.com/",
          "https://www.google.com/",
        ],
      ),
    );
  }
}

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

  void handleCategorySelection(String imagePath, String name) {
    // Implement your logic to handle the selected category
    if (kDebugMode) {
      print('Selected Category: $name, Image Path: $imagePath');
    }
  }
}