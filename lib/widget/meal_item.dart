import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/meal_details.dart';
import 'package:meals/widget/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key,required this.meal,required this.onSelectMeal});

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;
  String get complexityText{
    return meal.complexity.name[0].toUpperCase()+meal.complexity.name.substring(1);
  }
  String get affordabilityText{
    return  meal.affordability.name[0].toUpperCase()+meal.affordability.name.substring(1);
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        // onTap: (){
        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>MealDetailScreen(meal: meal)));
        // },
        onTap: (){
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(meal.title,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                            MealItemTrait(icon: Icons.schedule, lable: '${meal.duration}min'),
                        SizedBox(width: 12,),
                        MealItemTrait(icon: Icons.work, lable: complexityText),
                        SizedBox(width: 12,),
                        MealItemTrait(icon: Icons.attach_money, lable: affordabilityText),
                      ],
                    ),
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
