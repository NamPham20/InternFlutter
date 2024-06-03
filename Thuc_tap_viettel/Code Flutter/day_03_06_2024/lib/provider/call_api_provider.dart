

import 'package:day_03_06_2024/model/comment.dart';
import 'package:day_03_06_2024/network/request_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

 final callApiProvider = FutureProvider<List<Comment>>
(
(ref) async {
return fetchComment();
});