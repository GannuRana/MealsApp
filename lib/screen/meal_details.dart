import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/favorites_provider.dart';

class MealDetailScreen extends  ConsumerWidget{
  const MealDetailScreen({super.key,required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: (){
               final wasAdded= ref
                   .read(favoritesMealsProvider.notifier)
                   .toggleFavoriteMealStatus(meal);
               ScaffoldMessenger.of(context).clearSnackBars();
               ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                     content: Text(wasAdded ? 'Meal added as favorite':'Meal removed'),
                   )
               );
              },
              icon: Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
                meal.imageUrl,
               height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 12,),
            Text(
                'Ingradients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
               color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            for(final ingradient in meal.ingredients)
              Text(
                ingradient,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                 ),
              ),
            SizedBox(height: 12,),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            for(final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
