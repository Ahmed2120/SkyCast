import 'package:flutter/material.dart';
import 'package:weather_app/core/utility/app_colors.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<CategoryModel> categoriesList = [
    CategoryModel(1, 'Today', isActive: true),
    CategoryModel(2, 'Tomorrow'),
    CategoryModel(3, 'Next 7 Days'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        // padding: const EdgeInsets.symmetric(horizontal: 16),
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          final category = categoriesList[index];
          return GestureDetector(
            onTap: () => openCategory(category.id!),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: category.isActive
                    ? AppColors.stringsColor.withOpacity(0.8)
                    : Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: category.isActive
                      ? Colors.transparent
                      : Colors.white.withOpacity(0.3),
                ),
              ),
              child: Text(
                category.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: category.isActive ? Colors.white : AppColors.stringsColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void openCategory(int id) {
    setState(() {
      for (var element in categoriesList) {
        element.isActive = element.id == id;
      }
    });
  }
}

class CategoryModel {
  int? id;
  final String name;
  bool isActive;

  CategoryModel(this.id, this.name, {this.isActive = false});
}
