import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../model/comment.dart';
import 'package:http/http.dart' as http;


List<Comment> parseComment(String responseBody){
  var list = jsonDecode(responseBody) as List<dynamic>;
  List<Comment> comments = list.map((model){
    return Comment.fromJson(model);
  }).toList();
  return comments;
}

Future<List<Comment>>  fetchComment() async{
  var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
  if(response.statusCode == 200){
    return compute(parseComment, response.body);
  }else{
    throw Exception("không thể call API");
  }
}