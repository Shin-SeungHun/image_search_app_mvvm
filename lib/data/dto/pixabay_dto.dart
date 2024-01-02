import 'package:json_annotation/json_annotation.dart';

part 'pixabay_dto.g.dart';

@JsonSerializable()
class PixabayDto {
  num? total;
  num? totalHits;
  List<Hits>? hits;

  PixabayDto({
    this.total,
    this.totalHits,
    this.hits,
  });

  factory PixabayDto.fromJson(dynamic json) {
    return _$PixabayDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PixabayDtoToJson(this);
  }
}

@JsonSerializable()
class Hits {
  num? id;
  String? pageURL;
  String? type;
  String? tags;
  String? previewURL;
  num? previewWidth;
  num? previewHeight;
  String? webformatURL;
  num? webformatWidth;
  num? webformatHeight;
  String? largeImageURL;
  num? imageWidth;
  num? imageHeight;
  num? imageSize;
  num? views;
  num? downloads;
  num? collections;
  num? likes;
  num? comments;
  num? userId;
  String? user;
  String? userImageURL;

  Hits({
    this.id,
    this.pageURL,
    this.type,
    this.tags,
    this.previewURL,
    this.previewWidth,
    this.previewHeight,
    this.webformatURL,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageURL,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.collections,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageURL,
  });

  factory Hits.fromJson(dynamic json) {
    return _$HitsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HitsToJson(this);
  }
}
