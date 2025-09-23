# lingdong_server.model.ConversationMessageResponse

## Load the model package
```dart
import 'package:lingdong_server/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Id，消息ID | 
**conversationId** | **int** | Conversation Id，会话ID | 
**senderId** | **int** | Sender Id，发送者ID | 
**receiverId** | **int** | Receiver Id，接收者ID | 
**content** | **String** | Content，消息内容 | 
**messageType** | **int** | Message Type，消息类型 | 
**status** | **int** | Status，消息状态 | 
**createdAt** | [**DateTime**](DateTime.md) | Created At，发送时间 | 
**mediaUrl** | **String** |  | [optional] 
**isRead** | **bool** | Is Read，是否已读 | [optional] [default to false]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


