import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals});

  final List<Meal> availableMeals;

  void _selectCateogry(BuildContext context, Category category) { //context isnt globally available, must build
    final filteredMeals = availableMeals
    .where((meal) => meal.categories.contains(category.id))
    .toList();
    
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    ); // Navigator.push(context,route)
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children:  [
         for (final category in availableCategories)
          CatergoryGridItem(
            category: category, 
            onSelectCategory: (){
            _selectCateogry(context, category);
          },
        ),
      ],
    );
  }
}