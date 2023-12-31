import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/screen/filters.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter,bool>>{
FiltersNotifier():super({
  Filter.glutenFree:false,
  Filter.lactoseFree:false,
  Filter.vegetarian: false,
  Filter.vegan:false,
});

  void setFilters(Filter filter,bool isActive){
    state  = {
    ...state,
    filter:isActive,
  };
  }
}

final filterProvider=StateNotifierProvider
        <FiltersNotifier,Map<Filter,bool>>(
        (ref) => FiltersNotifier()
);