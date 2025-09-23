# lingdong_server.model.GroupConversationResponse

## Load the model package
```dart
import 'package:lingdong_server/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Id，群聊ID | 
**name** | **String** | Name，群聊名称 | 
**avatar** | **String** |  | [optional] 
**creatorId** | **int** | Creator Id，创建者ID | 
**createdAt** | [**DateTime**](DateTime.md) | Created At，创建时间 | 
**memberCount** | **int** | Member Count，成员数量 | 
**lastMessage** | [**GroupMessageResponse**](GroupMessageResponse.md) |  | [optional] 
**unreadCount** | **int** | Unread Count，未读消息数 | [optional] [default to 0]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


