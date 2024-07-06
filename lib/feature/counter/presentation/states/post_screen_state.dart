import '../../data/models/post_model.dart';

class PostScreenState {
  Post? mainPost;
  List<Post?>? listOfPosts;
  bool isLoading;

  PostScreenState({this.mainPost, this.listOfPosts,this.isLoading = false});

  PostScreenState copyWith({
    Post? mainPost,
    List<Post?>? listOfPosts,
    bool? isLoading,
  }) {
    return PostScreenState(
      mainPost: mainPost ?? this.mainPost,
      listOfPosts: listOfPosts ?? this.listOfPosts,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
