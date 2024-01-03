import 'package:flutter/cupertino.dart';
import 'package:image_search_app_mvvm/data/model/image_item.dart';
import 'package:image_search_app_mvvm/data/repository/image_item_repository_impl.dart';

import '../data/repository/interface/image_item_repository.dart';
import '../ui/state/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _repository;

   MainState _state = MainState(
    imageItems: List.unmodifiable([]),
    isLoading: false,
  );

  MainState get state => _state;


  MainViewModel({
    required ImageItemRepository repository,
  }) : _repository = repository;

  ImageItem? itemId({required num id}) {
    if (_state.imageItems.isNotEmpty) {
      return _state.정imageItems.firstWhere((image) => image.id == id);
    }
    return null;
  }

  searchImage(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    // 화면갱신
    _state = state.copyWith(
      isLoading: false,
      imageItems: List.unmodifiable(
          (await _repository.getImageItems(query)).take(3).toList()),
    );
    notifyListeners();
  }
}
