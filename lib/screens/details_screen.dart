import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipe_app/components/circle_button.dart';
import 'package:recipe_app/components/custom_clip_path.dart';
import 'package:recipe_app/components/ingerdiant_list.dart';
import 'package:recipe_app/constants/share.dart';
import 'package:recipe_app/constants/show_detail_dialog.dart';
import 'package:recipe_app/constants/show_table.dart';
import 'package:recipe_app/constants/start_cooking.dart';

class DetailScreen extends StatefulWidget {
  final Map<String,dynamic> item;
  const DetailScreen({super.key,required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var mybox=Hive.box('saved');
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    String time=widget.item['totalTime'].toString();
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h*.44,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(widget.item['image']),fit: BoxFit.cover),
        
                  ),
        
                ),
                Positioned(top: h*.04,left: w*.05,
                  child:const CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: BackButton(color: Colors.white,),
                  ) ),
        
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: w*.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const SizedBox(height: 20,),
                Text(widget.item['label'],
                style: TextStyle(fontSize: w*.05,fontWeight: FontWeight.w700,color: Colors.black),
                ),
                const SizedBox(height: 1,),
                Text("$time min"),
                SizedBox(height: .01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        ShareRecipe.share(widget.item['url']);
                      },
                      child:const CircleButton(
                        icon: Icons.share,label: 'share',
                      ),
                    ),
                    ValueListenableBuilder(valueListenable: mybox.listenable(), builder: (context,box,_){
                      String key=widget.item['label'];
                      bool saved=mybox.containsKey(key);
                      if(saved){
                        return GestureDetector(
                          onTap: (){
                            mybox.delete(key);
                            ScaffoldMessenger.of(context).showSnackBar(
                             const SnackBar(duration: Duration(seconds: 1),content: Text('recipe deleted')));
                          },

                          child: CircleButton(
                          icon: Icons.bookmark,label: 'save',
                                              ),
                        );
                      }
                      else {
                        return GestureDetector(
                          onTap: (){
                            mybox.put(key, key);
                            ScaffoldMessenger.of(context).showSnackBar(
                            const  SnackBar(duration: Duration(seconds: 1),content: Text('recipe saved succefully')));
                          },

                          child: CircleButton(
                     icon: Icons.bookmark_border,label: 'save',
                                              ),
                        );
                      }
                      
                    }),
                    
                    GestureDetector(
                      onTap: (){
                        ShowDialog.showCalories(widget.item['totalNutrients'], context);
                      },
                      child: CircleButton(
                        icon: Icons.monitor_heart_outlined,label: 'calories',
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        ShowTable.showTable(context);
                      },
                      child: CircleButton(
                        icon: Icons.table_chart_outlined,label: 'unit chart',
                      ),
                    )
                  ],
                ),
                SizedBox(height: h*.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('direction',style: TextStyle(fontWeight: FontWeight.bold,fontSize: w*.06),),
                    SizedBox(width: w*.34,
                    child: ElevatedButton(onPressed: (){
                      StartCooking.startCooking(widget.item['url']);
                    }, child: Text('start')),
                    )
        
        
                  ],
                ),
                SizedBox(height: h*.02,),
                Container(
                  height: h*.07,
                  width: w,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
        
                        child: ClipPath(
                          clipper: CustomClipPath(),
                          child: Container(
                            color: Colors.redAccent,
                            child: Center(
                              child: Text('ingerdiants required',
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                              fontSize: w*.05,
                              ),
                              ),
                            ),
                          ),
        
                      ),),
                      Expanded(flex: 1,
        
                        child: Container
                        (
                          color: Colors.white,
                          child: Center(child: Text('  6\n items'),),
                        ))
                    ],
                  ),
        
                ),
                SizedBox(height: h*1.8,
                child: IngerdiantList(
                  ingerdients: widget.item['ingredients'],
                ),
                )
        
        
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}