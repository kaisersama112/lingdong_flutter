# lingdong_server.model.Reply

## Load the model package
```dart
import 'package:lingdong_server/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**content** | **String** | Content，回复内容 | 
**medias** | [**BuiltList&lt;MediaResponse&gt;**](MediaResponse.md) |  | [optional] 
**id** | **int** | Id，回复ID | 
**parentCommentId** | **int** | Parent Comment Id，顶级评论ID | 
**replyToReplyId** | **int** |  | [optional] 
**replier** | [**BuiltMap&lt;String, JsonObject&gt;**](JsonObject.md) | Replier，回复人信息 | 
**replyTo** | [**BuiltMap&lt;String, JsonObject&gt;**](JsonObject.md) |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) | Created At，创建时间 | 
**updatedAt** | [**DateTime**](DateTime.md) |  | [optional] 
**replies** | [**BuiltList&lt;Reply&gt;**](Reply.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


