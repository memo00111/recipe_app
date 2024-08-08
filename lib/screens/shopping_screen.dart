import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipe_app/components/custom_app_bar.dart';
import 'package:recipe_app/constants/share.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;

    var mybox=Hive.box('shopping');
    return Scaffold(
      appBar: CustomAppBar(title: 'shopping', back: false),
      body: ValueListenableBuilder(
        
        valueListenable: mybox.listenable(),
         builder:(context,box,_){
          var data=box.values.toList();
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context,index){
              return ListTile(
                title: Container(
                  height: h*.085,
                  color: Colors.grey[100],
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,

                        child: Text(data[index])),
                        PopupMenuButton(itemBuilder: (context){
                          return const [
                            PopupMenuItem(value: 'share',child: Text('share')),
                            PopupMenuItem(value: 'delete',child: Text('delete')) 
                                        ];
                           
                        },
                        onSelected: (String value)async{
                          if(value=='delete'){
                            deleteItem(index);
                          }
                          else if(value=='share'){
                            ShareRecipe.share(data[index]);
                          }

                        },
                        )
                    ],
                  ),


                ),
              );
            },
          );
         }),
    );

  }
  Future <void> deleteItem(int index)async{
    var mybox=Hive.box('shopping');
    await mybox.deleteAt(index);
  }
}