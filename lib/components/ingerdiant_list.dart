import 'package:flutter/material.dart';
import 'package:recipe_app/components/ingrediant_item.dart';

class IngerdiantList extends StatelessWidget {
  final List<dynamic> ingerdients;
  const IngerdiantList({super.key,required this.ingerdients});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:const  ScrollPhysics(
        parent: NeverScrollableScrollPhysics()
      ),
      itemCount: ingerdients.length,
      itemBuilder: (context,index){
        int quantity=ingerdients[index]['quantity'].toInt()??1;
        return IngredientItem(
          quantity:quantity.toString(),
          imageUrl: ingerdients[index]['image']??'',
          measure: ingerdients[index]['measure']??'',
          food: ingerdients[index]['food']??'',
        );
      },
    );
  }
}