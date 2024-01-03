import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_app_mvvm/data/model/image_item.dart';
import 'package:image_search_app_mvvm/ui/state/main_state.dart';
import 'package:image_search_app_mvvm/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController searchTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MainViewModel viewModel = context.watch<MainViewModel>();
    final MainState state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        leading: const FlutterLogo(),
        title: const Text('image searching app'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: searchTextEditingController,
                onChanged: (query) {
                  viewModel.searchImage(query);
                },
                decoration: InputDecoration(
                  labelText: '검색',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.green,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.green,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.cyan,
                    ),
                    onPressed: () {
                      viewModel.searchImage(searchTextEditingController.text);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: GridView.builder(
                          itemCount: state.imageItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 32,
                                  mainAxisSpacing: 32),
                          itemBuilder: (context, index) {
                            final ImageItem imageItem = state.imageItems[index];
                            String id =
                                state.imageItems[index].id?.toString() ??
                                    'fallback_value';
                            print('id :$id');
                            return GestureDetector(
                              onTap: () async {
                                print('id :${Uri(
                                  path: '/detailScreen',
                                  queryParameters: {'id': id},
                                ).toString()}');
                                await context.push(
                                  Uri(
                                      path: '/detailScreen',
                                      queryParameters: {'id': id}).toString(),
                                );
                              },
                              child: Hero(
                                tag: 'image_${state.imageItems[index]}',
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.network(
                                    imageItem.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
