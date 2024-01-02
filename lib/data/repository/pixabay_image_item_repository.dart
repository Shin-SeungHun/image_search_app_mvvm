import 'package:image_search_app_mvvm/data/data_source/pixabay_api.dart';
import 'package:image_search_app_mvvm/data/dto/pixabay_dto.dart';
import 'package:image_search_app_mvvm/data/mapper/image_mapper.dart';
import 'package:image_search_app_mvvm/data/model/image_item.dart';
import 'package:image_search_app_mvvm/data/repository/interface/image_item_repository_impl.dart';

class PixabayImageItemRepository implements ImageItemRepository {
  final _api = PixabayApi();

  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    final PixabayDto dto = await _api.getImagesResult(query);

    if (dto.hits == null) {
      return [];
    }
    
    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}
