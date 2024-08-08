import 'package:flutter/material.dart';

class ShowDialog{
static Future showCalories(Map<String,dynamic>item,BuildContext context)async{
  int fat=item['FAT']['quantity'].toInt();
  int sfat=item['FASAT']['quantity'].toInt();
  int cholesterol=item['CHOLE']['quantity'].toInt();
  int na=item['NA']['quantity'].toInt();
  int carbohydrate=item['CHOCDF.net']['quantity'].toInt();
  int sugar=item['SUGAR']['quantity'].toInt();
  int protein=item['PROCNT']['quantity'].toInt();

  return showDialog(
    context:context,builder:(context){
  return AlertDialog(
    contentPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),


    ),
    backgroundColor: Colors.redAccent,
    title:const Center(
      child: Padding(padding: EdgeInsets.only(bottom: 18),
      child: Text('nuturitional fact',style: TextStyle(
        color: Colors.white,fontWeight: FontWeight.w400
      ),),
      ),
    ),
    content: Container(
      height: 300,
      decoration:const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10)
        )
      ),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('total fat'),
              Text(fat.toString())

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('structered fat'),
              Text(sfat.toString())

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('cholestrol'),
              Text(cholesterol.toString())

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('sodium'),
              Text(na.toString())

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('carbohydrates'),
              Text(carbohydrate.toString())

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('suger'),
              Text(sugar.toString())

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('protein'),
              Text(protein.toString())

            ],
          ),
        ],

      ),
      ),
    ),

  );
}

  );
}

}