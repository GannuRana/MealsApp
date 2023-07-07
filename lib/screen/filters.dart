import 'package:flutter/material.dart';
// import 'package:meals/screen/tabs.dart';
// import 'package:meals/widget/main_drawer.dart';


enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}


class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key,required this.currentFilter}) ;

  final Map<Filter,bool> currentFilter;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterSet=false;
  var _lactoseFreeFilterSet=false;
  var _vegetarianFilterSet=false;
  var _veganFilterSet=false;

@override
  void initState() {
    super.initState();
    _glutenFreeFilterSet=widget.currentFilter[Filter.glutenFree]!;
    _lactoseFreeFilterSet=widget.currentFilter[Filter.lactoseFree]!;
    _vegetarianFilterSet=widget.currentFilter[Filter.vegetarian]!;
    _veganFilterSet=widget.currentFilter[Filter.vegan]!;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawer(
      //   onSelectScreen: (identier){
      //     Navigator.of(context).pop();
      //     if(identier=='Meals'){
      //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TabsScreen()));
      //     }
      //   }
      // ),
      appBar: AppBar(
        title: Text(
          'Your Filters',
        ),
      ),
      body: WillPopScope(
        onWillPop: ()async{
           Navigator.of(context).pop({
             Filter.glutenFree: _glutenFreeFilterSet,
             Filter.lactoseFree: _lactoseFreeFilterSet,
             Filter.vegetarian: _vegetarianFilterSet,
             Filter.vegan: _veganFilterSet,
           });
           return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _glutenFreeFilterSet=isChecked;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include gluten free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _lactoseFreeFilterSet=isChecked;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include Lactose free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _vegetarianFilterSet=isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include Vegerarian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _veganFilterSet=isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34,right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
