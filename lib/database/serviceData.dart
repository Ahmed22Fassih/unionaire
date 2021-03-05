import 'dart:convert';

import 'package:http/http.dart' as http;

class ServiceData {
  List<String> months = [];

  Future<bool> auth (String userId, String password) async{

    final url = 'http://41.38.123.212:7001/test/resources/customers/credCRM?p_userId=$userId&p_pass=$password';

    try {
      final response = await http.get(url);
      if (response.statusCode == 200 && response.body != 'no') {
        return true ;
      } else {
        return false ;
      }
    }catch (error){
      print(error);
      return false ;
    }
  }

  Future<void> fetchMonthsNames () async {
    var url = 'http://41.38.123.212:7001/test/resources/customers/Mnth';
    try {

      var response = await http.get(url);
      if (response.statusCode == 200) {
        var monthsList = jsonDecode(response.body)['mnthList'];
        for(int i=0 ; i< monthsList.length ;i++){
          months.add(monthsList[i]['Mnth']);
        }
      } else {
        print(response.statusCode);
      }
    } catch (ex) {
      print(ex);
    }
  }

}