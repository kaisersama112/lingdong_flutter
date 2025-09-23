# lingdong_server.model.ConversationResponse

## Load the model package
```dart
import 'package:lingdong_server/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Id，会话ID | 
**sessionId** | **String** | Session Id，会话唯一标识 | 
**userId** | **int** | User Id，用户ID | 
**targetUserId** | **int** | Target User Id，目标用户ID | 
**targetUsername** | **String** | Target Username，目标用户名 | 
**targetAvatar** | **String** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) | Created At，创建时间 | 
**updatedAt** | [**DateTime**](DateTime.md) | Updated At，更新时间 | 
**lastMessage** | [**ConversationMessageResponse**](ConversationMessageResponse.md) |  | [optional] 
**unreadCount** | **int** | Unread Count，未读消息数 | [optional] [default to 0]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


