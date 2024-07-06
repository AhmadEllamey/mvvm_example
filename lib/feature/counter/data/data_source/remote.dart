import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class RemoteDataSource {
  Future<Post> fetchPost() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return Post.fromJson((json.decode(response.body)));
    } else {
      throw Exception('FAILED TO LOAD POST');
    }
  }


  Future<List<Post>> fetchPosts() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return List<Post>.from(
        (json.decode(response.body) as List).map(
          (e) => Post.fromJson(
            (e),
          ),
        ),
      ).toList();
    } else {
      throw Exception('FAILED TO LOAD POSTS');
    }
  }
}
