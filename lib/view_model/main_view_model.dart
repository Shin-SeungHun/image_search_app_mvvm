import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app_mvvm/core/result.dart';
import 'package:image_search_app_mvvm/data/model/image_item.dart';
import 'package:image_search_app_mvvm/data/repository/image_item_repository_impl.dart';
import 'package:image_search_app_mvvm/ui/event/main_event.dart';

import '../data/repository/interface/image_item_repository.dart';
import '../ui/state/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _repository;

  MainState _state = const MainState();

  MainState get state => _state;

  final _eventController = StreamController<MainEvent>();

  Stream<MainEvent> get eventStream => _eventController.stream;

  MainViewModel({
    required ImageItemRepository repository,
  }) : _repository = repository;

  ImageItem? itemId({required num id}) {
    if (_state.imageItems.isNotEmpty) {
      return _state.imageItems.firstWhere((image) => image.id == id);
    }
    return null;
  }

  Future<void> searchImage(String query) async {
    if (query.isEmpty) {
      // 검색어가 비어 있을 때 스낵바 표시
      _eventController.add(const MainEvent.showSnackBar('검색어를 입력하세요.'));
      return;
    }
    // 화면갱신
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final results = (await _repository.getImageItems(query));

    // 화면갱신
    switch (results) {
      case Success<List<ImageItem>>():
        _state = state.copyWith(
          isLoading: false,
          imageItems: results.data,
        );
        if (kDebugMode) {
          print('성공');
        }
        notifyListeners();
        _eventController.add(const MainEvent.showSnackBar('성공'));
        break;
      case Error<List<ImageItem>>():
        _state = state.copyWith(
          isLoading: false,
        );
        notifyListeners();
        // CircularProgressIndicator();
        //_eventController.add(MainEvent.showSnackBar(results.e.toString()));
        //_eventController.add(MainEvent.dialog(results.e.toString()));
        _eventController.add(const MainEvent.dialog('네트워크 에러'));
        if (kDebugMode) {
          print('실패 ${results.e.toString()}');
        }
        break;
      case Loading<List<ImageItem>>():
        // TODO: 로딩
        if (kDebugMode) {
          print('loading');
        }
        const CircularProgressIndicator();
        break;
    }
  }
}
