import 'package:flutter/material.dart';
import 'package:recipe_app/components/recipe_category_view.dart';
import 'package:recipe_app/constants/category_list.dart';

class RecipeCategory extends StatelessWidget {
  const RecipeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.1),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: w*.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: h*.06,),
          Text('for you',style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: w*.06,
          ),),
          SizedBox(height: h*.01,),
          SizedBox(
            height: h*.106,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RecipeCategoryView(image: images[0], name: name[0]),
                RecipeCategoryView(image: images[1], name: name[1]),
                RecipeCategoryView(image: images[2], name: name[2]),
                RecipeCategoryView(image: images[3], name: name[3]),
              ],
            ),
          ),
          SizedBox(height: h*.01,),
                    Text('for you',style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: w*.055,
          ),),
          SizedBox(height: h*.45,
          child: GridView.builder(
            itemCount: categoryimage.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: h*.01,mainAxisSpacing: w*.021),
            itemBuilder: (context, index) {
              return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                
            
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: h*.043,width: w*.08,
                      child: Image.asset(categoryimage[index]),
                    ),
                    SizedBox(height: h*.003,),
                    Text(categoris[index],style: const TextStyle(
                      fontWeight: FontWeight.bold,color: Colors.black45
                    ),)
                  ],
                ),
              ),
            );
              
            },
            
          ),
          ),
          // SizedBox(height: h*.02,),
          Text('Your prefrences',style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: w*.055
          ),),
          SizedBox(height: h*.13,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RecipeCategoryView(image: images[0], name:'easy'),
               RecipeCategoryView(image: images[1], name:'quick'),
                RecipeCategoryView(image: images[2], name:'beef'),
                 RecipeCategoryView(image: images[3], name:'low fat'),


            ],
          ),)

        ],
      ),
      ),
    );
  }
}