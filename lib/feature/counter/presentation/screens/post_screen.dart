import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_example/feature/counter/data/data_source/remote.dart';
import 'package:mvvm_example/feature/counter/data/models/post_model.dart';
import 'package:mvvm_example/feature/counter/data/repositories/remote_repo.dart';
import 'package:mvvm_example/feature/counter/presentation/states/post_screen_state.dart';
import 'package:mvvm_example/feature/counter/presentation/view_models/post_screen_view_model.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  final provider = StateNotifierProvider<PostScreenViewModel, PostScreenState>(
    (ref) {
      return PostScreenViewModel(
        PostScreenState(),
        remoteDataRepository: RemoteDataRepository(
          remoteDataSource: RemoteDataSource(),
        ),
      );
    },
  );

  Future<List<Post>>? _futurePosts;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then(
      (value) {
        ref.read(provider.notifier).fetchPostInfo();
        ref.read(provider.notifier).fetchPostsList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(ref.watch(provider).isLoading)
              const Center(child: CircularProgressIndicator()),
            if(ref.watch(provider).listOfPosts?.isEmpty??false)
              const Center(child: Text('No items found')),
            if(ref.watch(provider).listOfPosts?.isNotEmpty??false)
              Expanded(
                child: ListView.builder(
                  itemCount: ref.watch(provider).listOfPosts?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = ref.watch(provider).listOfPosts?.elementAt(index);
                    return ListTile(
                      title: Text(item?.id.toString() ?? ""),
                    );
                  },
                ),
              ),
          ],
        )
        // FutureBuilder<List<Post>>(
        //   future: _futurePosts,
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(child: CircularProgressIndicator());
        //     } else if (snapshot.hasError) {
        //       return Center(child: Text('Error: ${snapshot.error}'));
        //     } else if (!snapshot.hasData || (snapshot.data?.isEmpty??false)) {
        //       return const Center(child: Text('No items found'));
        //     } else {
        //       return ListView.builder(
        //         itemCount: snapshot.data?.length??0,
        //         itemBuilder: (context, index) {
        //           final item = snapshot.data?[index];
        //           return ListTile(
        //             title: Text(item?.id.toString()??""),
        //           );
        //         },
        //       );
        //     }
        //   },
        // ),
      ),
    );
  }
}
