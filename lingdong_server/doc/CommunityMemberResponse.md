# lingdong_server.model.CommunityMemberResponse

## Load the model package
```dart
import 'package:lingdong_server/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Id | 
**userId** | **int** | User Id | 
**role** | **int** | Role，角色(0:普通成员,1:管理员,2:超级管理员) | 
**status** | **int** | Status，状态(0:待审核,1:已批准,2:已拒绝,3:已封禁) | 
**joinedAt** | [**DateTime**](DateTime.md) | Joined At | 
**approvalAt** | [**DateTime**](DateTime.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


