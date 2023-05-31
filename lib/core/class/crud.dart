import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:memoire/core/class/statusrequest.dart';
//class Crud {
  //Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    //try {
        //var response = await http.post(Uri.parse(linkurl), body: data);
        //if (response.statusCode == 200 || response.statusCode == 201) {
          //Map responsebody = jsonDecode(response.body);
          //return Right(responsebody);
        //} else {
          //return const Left(StatusRequest.serverfailure);
        //}
    //} catch (_) {
      //return const Left(StatusRequest.serverfailure);
    //}
  //}
//}
class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {


      var response = await http.post(Uri.parse(linkurl), body: data);
      print(response.statusCode) ;
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody) ;

        return Right(responsebody);
      } else  {
        return const Left(StatusRequest.serverfailure);
      }
    }

  }
