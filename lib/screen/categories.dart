

import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/Category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widget/category_grid_item.dart';
// import 'package:meals/models/category.dart';

class CategoriesScreen extends StatelessWidget{

   const CategoriesScreen({super.key,required this.availableMeals});
   final List<Meal> availableMeals;

   void _selectCategory(BuildContext context,Category category){
     final filterdMeal=availableMeals
         .where((meal) =>
         meal.categories
             .contains(category.id))
         .toList();

     Navigator.of(context).push(
         MaterialPageRoute(
             builder: (context)=>MealsScreen(
                 title: category.title,
                 meals: filterdMeal,
             ),
         ),
     );
   }


  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          ),
          children: [
            // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
            for(final category in availableCategories)
            CategoryGridItem(
                category: category,
              onSelectCategory: (){
                  _selectCategory(context,category);
              },
            )
          ],
    );
  }
}

