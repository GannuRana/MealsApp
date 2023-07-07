import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoritesMealsProvider extends StateNotifier<List<Meal>>{
  FavoritesMealsProvider():super([]);

  bool toggleFavoriteMealStatus(Meal meal){
    final mealIsFavorite=state.contains(meal);

    if(mealIsFavorite){
      state.where((m) => m.id!=meal.id);
      return false;
    }else{
      state=[...state,meal];
      return true;
    }

  }

}

final favoritesMealsProvider=StateNotifierProvider<FavoritesMealsProvider,List<Meal>>((ref){
  return FavoritesMealsProvider();
});