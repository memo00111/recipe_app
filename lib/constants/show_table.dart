import 'package:flutter/material.dart';

class ShowTable{
  static Future showTable(BuildContext context){
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;

    return showDialog(context: context, 
    builder: (context){
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white,width: 3),

        ),
        backgroundColor: Colors.redAccent,
        title: Center(
          child: Padding(padding: EdgeInsets.only(bottom: h*.02),
          child: Text('unit conversion chart',style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: w*.05,

          ),
          ),

          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Table(
              border: TableBorder.all(color: Colors.white,style: BorderStyle.solid,width: 2),
              children:const [
                TableRow(
                  children: [
                    BuildTableCell(text1: 'CUP', text2: '(cup)'),
                    BuildTableCell(text1: 'OUNCE', text2: '(oz)'),
                    BuildTableCell(text1: 'TABLE', text2: 'SPOON',text3: '(tbsp)',),
                    BuildTableCell(text1: 'TEA', text2: 'SPOON',text3:'(tbsp)'),
                    BuildTableCell(text1: 'MILLI', text2: 'LITRE',text3: '(ml)',),


                  ]
                ),
              ],
            )
          ],

        ),
      );
    }
    );
  }
}
class BuildTableCell extends StatelessWidget {
  final String text1,text2;
  final String? text3 ;

  
  const BuildTableCell({super.key,required this.text1,required this.text2,this.text3});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return TableCell(child: Container(
      color: Colors.redAccent,
      width: w*.4,
      height: h*.1,
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text1,style: TextStyle(fontSize: 10,color: Colors.white),),
          Text(text2,style: TextStyle(fontSize: 10,color: Colors.white),),
          if(text3!=null)
          Text(text1,style: TextStyle(fontSize: 10,color: Colors.white),),
        ],
      ),


    ));
  }
}