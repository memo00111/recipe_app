import 'package:flutter/material.dart';
import 'package:recipe_app/components/home_app_bar.dart';
import 'package:recipe_app/components/tab_bar_widget.dart';
import 'package:recipe_app/components/tetxt_feild_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
        final h=MediaQuery.of(context).size.height;
         final w=MediaQuery.of(context).size.width;

    return  Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              SizedBox(
                height:h*.022 ,
              ),
              TextFeildWidget(),
              SizedBox(
                height: h*.022,
              ),

              Container(
                height: h*.25,
                width: w,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('images/chef.jpg',),fit: BoxFit.fill),
                  borderRadius:BorderRadius.circular(20) ,
                ),

              ),
              SizedBox(height: h*.023,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('categoris',style: TextStyle(
                    fontSize: w*.045,fontWeight: FontWeight.bold
                  ),),
                  const Text('see all'),
                  // SizedBox(width: w*.022,)

                ],

              ),
              SizedBox(height: h*.022,),
              const TabBarWidget()
            ],
          ),
          ),
      )),
    );
  }
}