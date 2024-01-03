import 'package:flutter/material.dart';
import 'package:image_search_app_mvvm/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/model/image_item.dart';

class DetailScreen extends StatelessWidget {
  final String id;

  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final MainViewModel viewModel = context.read<MainViewModel>();
    final ImageItem? item = viewModel.itemId(id: num.tryParse(id) ?? 0);
    print('DetailScreen - id: $id');
    print('DetailScreen - item: $item');

    if (item == null) {
      // Handle the case when the item is null
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Item not found'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(item.tags),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: DefaultImageWidget(
              networkUrl: item.imageUrl,
            ),
          )
        ],
      ),
    );
  }
}

class DefaultImageWidget extends StatelessWidget {
  final String networkUrl;

  const DefaultImageWidget({super.key, required this.networkUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      networkUrl,
      fit: BoxFit.fitWidth,
    );
  }
}
