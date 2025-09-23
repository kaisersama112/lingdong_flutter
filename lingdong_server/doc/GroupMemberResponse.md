# lingdong_server.model.GroupMemberResponse

## Load the model package
```dart
import 'package:lingdong_server/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Id，成员ID | 
**userId** | **int** | User Id，用户ID | 
**nickname** | **String** |  | [optional] 
**username** | **String** | Username，用户名 | 
**avatar** | **String** |  | [optional] 
**joinedAt** | [**DateTime**](DateTime.md) | Joined At，加入时间 | 
**isAdmin** | **bool** | Is Admin，是否管理员 | [optional] [default to false]
**isOwner** | **bool** | Is Owner，是否群主 | [optional] [default to false]
**muted** | **bool** | Muted，是否被禁言 | [optional] [default to false]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


