import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app_mvvm/data/data_source/pixabay_api.dart';
import 'package:image_search_app_mvvm/data/dto/pixabay_dto.dart';

void main() {
  test('pixabay_api의 데이터가 dto에 전달되는지 테스트', () async {
    final PixabayApi api = PixabayApi();
    PixabayDto dto = await api.getImagesResult('apple');

    expect(dto, isNotNull);
  });
}