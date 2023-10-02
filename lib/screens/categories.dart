import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/category.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/meals.dart';

import 'package:meal/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleMeal});
  final void Function(Meal meal) onToggleMeal;
  void _selectedCategory(BuildContext context, Category category) {
    final filteredData = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredData,
            onToggleMeal: onToggleMeal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //This says how many column we need
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20, //Spacing Between column
          mainAxisSpacing: 20), //Spacing between horizontally
      children: [
        // availableCategories.map((category)=>CategoryGridItem(category: category) ).toList()
        for (final category in availableCategories)
          CategoryGridItem(
              category: category,
              onSelectedCategory: () {
                _selectedCategory(context, category);
              }),
      ],
    );
  }
}
