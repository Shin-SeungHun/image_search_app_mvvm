import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app_mvvm/data/dto/pixabay_dto.dart';
import 'package:image_search_app_mvvm/data/mapper/image_mapper.dart';
import 'package:image_search_app_mvvm/data/model/image_item.dart';

void main() {
  test('image_mapper가 model에 데이터를 잘 전달하는지 테스트', () async {
    Hits hits = Hits(
      previewURL: 'https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg',
      tags: 'apple',

    );

    // extension을 사용하여 ImageItem으로 변환
    ImageItem imageItem = hits.toImageItem();

    // 예상된 결과와 비교하여 테스트
    expect(imageItem.imageUrl, 'https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg');
    expect(imageItem.tags, 'apple');
  });
}