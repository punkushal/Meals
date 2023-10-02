import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/meal_details.dart';
import 'package:meal/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meals, required this.onToggleMeal});
  final Meal meals;
  final void Function(Meal meal) onToggleMeal;
  String get complexityText {
    return meals.complexity.name[0] + meals.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meals.affordability.name[0] + meals.affordability.name.substring(1);
  }

  void _selectedMealDetail(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) =>
          MealDetailScreen(meal: meals, onToggleMeal: onToggleMeal),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _selectedMealDetail(context);
        },
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meals.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 44),
                color: Colors.black54, //This color has some opacity by default
                child: Column(
                  children: [
                    Text(
                      meals.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //This Row() will display the meta infomation about meals
                    //for e.g duration, complexity and affordability
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule,
                            label: '${meals.duration} min'),
                        const SizedBox(
                          width: 8,
                        ),
                        MealItemTrait(icon: Icons.work, label: complexityText),
                        const SizedBox(
                          width: 8,
                        ),
                        MealItemTrait(
                            icon: Icons.attach_money, label: affordabilityText),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
