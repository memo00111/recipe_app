import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/screens/home.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Scaffold(

body: SizedBox(
  height: h,
  width: w,
  child: Stack(
    children: [
      Positioned(top: 0,
      child: Container(
        height:h*.79,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/white.jpg'),
          fit:BoxFit.cover),
        ),
      ),),
      Center(child: Image.asset('images/food.jpg'),),
      Positioned(bottom: 0,
      child: Container(
        height: h*.243,
        width: w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40)
          ),

        ),
        child: Padding(padding: EdgeInsets.only(top: h*.032),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('lets cook food',style: TextStyle(
                fontSize: w*.06,fontWeight: FontWeight.w600
              ),),
              SizedBox(height: h*.01,),
              Text('check out the app and start cook delicious meals',
              style:TextStyle(
                fontSize: 14,fontWeight: FontWeight.w300

              ),),
              SizedBox(height: h*.032,),
              SizedBox(
                width: w*.8,
                child: ElevatedButton(onPressed:(){
                  Navigator.push(context,
                  MaterialPageRoute(builder:
                   (context)=>const Home())
                  );
                },
                 child: Text('get started',style: TextStyle(
                  color: Colors.black,fontWeight:FontWeight.bold
                 ),),),
              )




          ],),
        ),
        ),
      ))
    ],
    ),
  

  ),
    );
  }
}