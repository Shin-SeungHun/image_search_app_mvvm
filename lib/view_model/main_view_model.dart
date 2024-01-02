import 'package:flutter/cupertino.dart';
import 'package:image_search_app_mvvm/data/model/image_item.dart';
import 'package:image_search_app_mvvm/data/repository/pixabay_image_item_repository.dart';

class MainViewModel extends ChangeNotifier {
  final PixabayImageItemRepository repository = PixabayImageItemRepository();

  List<ImageItem> imageItems = [];

  bool isLoading = false;

  searchImage(String query) async {
    isLoading = true;
    notifyListeners();

    imageItems = await repository.getImageItems(query);
    isLoading = false;
    notifyListeners();
  }
}
