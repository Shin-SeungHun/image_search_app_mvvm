// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixabay_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixabayDto _$PixabayDtoFromJson(Map<String, dynamic> json) => PixabayDto(
      total: json['total'] as num?,
      totalHits: json['totalHits'] as num?,
      hits: (json['hits'] as List<dynamic>?)?.map(Hits.fromJson).toList(),
    );

Map<String, dynamic> _$PixabayDtoToJson(PixabayDto instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalHits': instance.totalHits,
      'hits': instance.hits,
    };

Hits _$HitsFromJson(Map<String, dynamic> json) => Hits(
      id: json['id'] as num?,
      pageURL: json['pageURL'] as String?,
      type: json['type'] as String?,
      tags: json['tags'] as String?,
      previewURL: json['previewURL'] as String?,
      previewWidth: json['previewWidth'] as num?,
      previewHeight: json['previewHeight'] as num?,
      webformatURL: json['webformatURL'] as String?,
      webformatWidth: json['webformatWidth'] as num?,
      webformatHeight: json['webformatHeight'] as num?,
      largeImageURL: json['largeImageURL'] as String?,
      imageWidth: json['imageWidth'] as num?,
      imageHeight: json['imageHeight'] as num?,
      imageSize: json['imageSize'] as num?,
      views: json['views'] as num?,
      downloads: json['downloads'] as num?,
      collections: json['collections'] as num?,
      likes: json['likes'] as num?,
      comments: json['comments'] as num?,
      userId: json['userId'] as num?,
      user: json['user'] as String?,
      userImageURL: json['userImageURL'] as String?,
    );

Map<String, dynamic> _$HitsToJson(Hits instance) => <String, dynamic>{
      'id': instance.id,
      'pageURL': instance.pageURL,
      'type': instance.type,
      'tags': instance.tags,
      'previewURL': instance.previewURL,
      'previewWidth': instance.previewWidth,
      'previewHeight': instance.previewHeight,
      'webformatURL': instance.webformatURL,
      'webformatWidth': instance.webformatWidth,
      'webformatHeight': instance.webformatHeight,
      'largeImageURL': instance.largeImageURL,
      'imageWidth': instance.imageWidth,
      'imageHeight': instance.imageHeight,
      'imageSize': instance.imageSize,
      'views': instance.views,
      'downloads': instance.downloads,
      'collections': instance.collections,
      'likes': instance.likes,
      'comments': instance.comments,
      'userId': instance.userId,
      'user': instance.user,
      'userImageURL': instance.userImageURL,
    };
