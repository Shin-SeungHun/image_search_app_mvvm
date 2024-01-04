import 'package:image_search_app_mvvm/core/result.dart';
import 'package:image_search_app_mvvm/data/model/image_item.dart';

abstract interface class ImageItemRepository {
  Future<Result<List<ImageItem>>> getImageItems(String query);
}
