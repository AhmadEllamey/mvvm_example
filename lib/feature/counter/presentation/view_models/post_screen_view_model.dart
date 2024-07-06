import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_example/feature/counter/data/models/post_model.dart';
import 'package:mvvm_example/feature/counter/data/repositories/remote_repo.dart';
import 'package:mvvm_example/feature/counter/presentation/states/post_screen_state.dart';

class PostScreenViewModel extends StateNotifier<PostScreenState> {
  PostScreenViewModel(super.state, {
    required this.remoteDataRepository,
  });

  RemoteDataRepository remoteDataRepository;


  Future<Post> fetchPostInfo() async {
    Post post = await remoteDataRepository.fetchPost();
    state = state.copyWith(mainPost: post);
    return post;
  }

  Future<List<Post>> fetchPostsList() async {
    state = state.copyWith(isLoading: true);
    List<Post> posts = await remoteDataRepository.fetchPosts();
    state = state.copyWith(listOfPosts: posts);
    state = state.copyWith(isLoading: false);
    return posts;
  }


}
