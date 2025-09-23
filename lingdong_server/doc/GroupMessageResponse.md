# lingdong_server.model.GroupMessageResponse

## Load the model package
```dart
import 'package:lingdong_server/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Id，消息ID | 
**groupId** | **int** | Group Id，群聊ID | 
**senderId** | **int** | Sender Id，发送者ID | 
**senderNickname** | **String** | Sender Nickname，发送者昵称 | 
**content** | **String** | Content，消息内容 | 
**messageType** | **int** | Message Type，消息类型 | 
**createdAt** | [**DateTime**](DateTime.md) | Created At，发送时间 | 
**mediaUrl** | **String** |  | [optional] 
**isRead** | **bool** | Is Read，是否已读 | [optional] [default to false]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


