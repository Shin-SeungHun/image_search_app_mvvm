import 'package:flutter/cupertino.dart';
import 'package:image_search_app_mvvm/data/model/image_item.dart';
import 'package:image_search_app_mvvm/data/repository/image_item_repository_impl.dart';

import '../data/repository/interface/image_item_repository.dart';

class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _repository;

  MainViewModel({
    required ImageItemRepository repository,
  }) : _repository = repository;

  List<ImageItem> _imageItems = [];


  List<ImageItem> get imageItems => List.unmodifiable(_imageItems);
  bool _isLoading = false;


  bool get isLoading => _isLoading;

  ImageItem? itemId({required num id}) {
    if (imageItems.isNotEmpty) {
      return imageItems.firstWhere((image) => image.id == id);
    }
    return null;
  }

  searchImage(String query) async {
    _isLoading = true;
    notifyListeners();

    _imageItems = await _repository.getImageItems(query);

    _isLoading = false;
    notifyListeners();
  }
}
