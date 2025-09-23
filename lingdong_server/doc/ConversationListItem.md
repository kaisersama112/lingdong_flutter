# lingdong_server.model.ConversationListItem

## Load the model package
```dart
import 'package:lingdong_server/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Id，会话ID | 
**sessionId** | **String** | Session Id，会话唯一标识 | 
**targetUserId** | **int** |  | [optional] 
**targetUsername** | **String** |  | [optional] 
**targetAvatar** | **String** |  | [optional] 
**groupId** | **int** |  | [optional] 
**groupName** | **String** |  | [optional] 
**groupAvatar** | **String** |  | [optional] 
**lastMessage** | **String** | Last Message，最后一条消息 | 
**lastMessageTime** | [**DateTime**](DateTime.md) | Last Message Time，最后一条消息时间 | 
**unreadCount** | **int** | Unread Count，未读消息数 | [optional] [default to 0]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


