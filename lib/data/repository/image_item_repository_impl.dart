import 'package:image_search_app_mvvm/core/result.dart';
import 'package:image_search_app_mvvm/data/data_source/pixabay_api.dart';
import 'package:image_search_app_mvvm/data/dto/pixabay_dto.dart';
import 'package:image_search_app_mvvm/data/mapper/image_mapper.dart';
import 'package:image_search_app_mvvm/data/model/image_item.dart';
import 'package:image_search_app_mvvm/data/repository/interface/image_item_repository.dart';

class ImageItemRepositoryImpl implements ImageItemRepository {
  final PixabayApi _api = PixabayApi();

  @override
  Future<Result<List<ImageItem>>> getImageItems(String query) async {
    try {
      final PixabayDto dto = await _api.getImagesResult(query);

      if (dto.hits == null) {
        return const Result.success([]);
      }

      return Result.success(dto.hits!.map((e) => e.toImageItem()).toList());
    } on Exception catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
