import 'dart:convert';

import 'package:http/http.dart'as http;
class ConstantFunction{

  static Future<List<Map<String,dynamic>>>getResponse(String FindRecipe)async{
    String id='428ad45e';
    String key='c1f0ba4d6b6acaaa5087a3762f534414';
    String api='https://api.edamam.com/search?q=$FindRecipe&app_id=$id&app_key=$key&from=0&to=20&calories=591-722&health=alcohol-free';

    final response =await http.get(Uri.parse(api));
    List<Map<String,dynamic>>recipe=[];
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      if(data['hits']!=null){
        for(var hit in data['hits']){
          recipe.add(hit['recipe']);
        }

      }
      return recipe ;

    }
    return recipe ;
  }

}