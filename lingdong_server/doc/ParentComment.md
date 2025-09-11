# lingdong_server.model.ParentComment

## Load the model package
```dart
import 'package:lingdong_server/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Id，评论ID | 
**content** | **String** | Content，评论内容 | 
**postId** | **int** | Post Id，动态ID | 
**userId** | **int** | User Id，用户ID | 
**username** | **String** | Username，用户名 | 
**userAvatar** | **String** |  | [optional] 
**replyToUserId** | **int** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) | Created At，创建时间 | 
**updatedAt** | [**DateTime**](DateTime.md) |  | [optional] 
**medias** | [**BuiltList&lt;MediaResponse&gt;**](MediaResponse.md) |  | [optional] 
**likeCount** | **int** | Like Count，点赞数量 | [optional] [default to 0]
**isLiked** | **bool** | Is Liked，当前用户是否点赞 | [optional] [default to false]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


