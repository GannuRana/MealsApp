import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:meals/data/dummy_data.dart';
import 'package:meals/screen/categories.dart';
import 'package:meals/screen/filters.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widget/main_drawer.dart';
import 'package:meals/provider/meals_provider.dart';
import 'package:meals/provider/favorites_provider.dart';



const kInitialFilter={
  Filter.glutenFree:false,
  Filter.lactoseFree:false,
  Filter.vegetarian:false,
  Filter.vegan:false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {

  int _selectPageIndex=0;

  Map<Filter,bool> _selectdFilter= kInitialFilter;


  void selectPage(int index){
    setState(() {
      _selectPageIndex=index;
    });
  }
  void _setScreen(String identifier)async{
    Navigator.of(context).pop();
     if(identifier=='Filters'){
       final result=await Navigator.push<Map<Filter,bool>>(context,
           MaterialPageRoute(builder: (context)=>FilterScreen(currentFilter: _selectdFilter,)));
       setState(() {
         _selectdFilter=result ?? kInitialFilter;
       });
     }
  }
  @override
  Widget build(BuildContext context) {
    final meals= ref.watch(mealsProvider);
    final availableMeals=meals.where((meal){
      if(_selectdFilter[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(_selectdFilter[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(_selectdFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if(_selectdFilter[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();

    Widget activePage=CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle='Category';
    if(_selectPageIndex==1){
      final favoritesMeals=ref.watch(favoritesMealsProvider);
      activePage=MealsScreen(
        meals: favoritesMeals,
      );
      activePageTitle='Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
          currentIndex: _selectPageIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favorites'),
          ]
      ),
    );
  }
}
