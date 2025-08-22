# lingdong_server.model.PostResponse

## Load the model package
```dart
import 'package:lingdong_server/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Id | 
**userId** | **int** | User Id | 
**username** | **String** | Username，发布者用户名 | 
**userAvatar** | **String** |  | [optional] 
**communityId** | **int** |  | 
**communityName** | **String** |  | [optional] 
**content** | **String** | Content | 
**createdAt** | [**DateTime**](DateTime.md) |  | [optional] 
**updatedAt** | [**DateTime**](DateTime.md) |  | [optional] 
**medias** | [**BuiltList&lt;MediaResponse&gt;**](MediaResponse.md) | Medias，媒体文件列表 | [optional] [default to ListBuilder()]
**likeCount** | **int** | Like Count，点赞数 | [optional] [default to 0]
**commentCount** | **int** | Comment Count，评论数 | [optional] [default to 0]
**favoriteCount** | **int** | Favorite Count，收藏数 | [optional] [default to 0]
**shareCount** | **int** | Share Count，分享数 | [optional] [default to 0]
**isLiked** | **bool** | Is Liked，当前用户是否已点赞 | [optional] [default to false]
**isFavorited** | **bool** | Is Favorited，当前用户是否已收藏 | [optional] [default to false]
**tags** | **String** |  | [optional] 
**visibility** | **int** | Visibility，可见性 | [optional] [default to 2]
**location** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


