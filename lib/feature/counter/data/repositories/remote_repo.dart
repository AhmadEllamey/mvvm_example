import 'package:mvvm_example/feature/counter/data/data_source/remote.dart';
import '../models/post_model.dart';

class RemoteDataRepository {
  RemoteDataRepository({required this.remoteDataSource});

  final RemoteDataSource remoteDataSource;

  Future<Post> fetchPost() async {
    return remoteDataSource.fetchPost();
  }

  Future<List<Post>> fetchPosts() async {
    return remoteDataSource.fetchPosts();
  }
}
