import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class api{
  var url = 'http://10.0.2.2:5000/api/backend';
  register(name,email,password)async{
    try{
      var response = await http.post('$url/register', body: {
        'name':name, 'email':email, 'password':password
      });
      var jsonData = convert.jsonDecode(response.body);
      return jsonData;
    } catch(e){
      print(e);
    }
  }

  login(email, password)async{
    try{
      var response = await http.post('$url/login', body: {
        'email':email, 'password':password
      });
      return response;
    } catch(e){
      print(e);
    }
  }

}