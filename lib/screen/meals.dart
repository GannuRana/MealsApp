


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:flutter/src/material/color_scheme.dart';
import 'package:meals/screen/meal_details.dart';
import 'package:meals/widget/meal_item.dart';


class MealsScreen extends StatelessWidget{

  const MealsScreen({super.key,this.title,required this.meals});
   final String? title;
   final List<Meal>meals;
void selectMeal(BuildContext context, Meal meal){
  Navigator.of(context)
      .push(MaterialPageRoute(
      builder: (ctx)=>MealDetailScreen(
          meal: meal,
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    Widget content=ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx,idx)=>
      Text(meals[idx].title,
    ),
  );
  if(meals.isEmpty){
    
    content=Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
          children: [
             Text('Uh oh ....Nothing here!', 
             style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
            ),),
            const SizedBox(height: 16,),
            Text(
              'Try Selecting different Category! ',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ],
      ),
    );
  }
    if(meals.isNotEmpty){
      content=ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx,index)=>
            MealItem(meal: meals[index],onSelectMeal: (meal) {
              selectMeal(context, meal);
            }
            ),
      );
    }
    if(title==null){
      return content;
    }

   return Scaffold(
    appBar: AppBar(
      title: Text(title!),
    ),
    body: content,
   );
  }
}