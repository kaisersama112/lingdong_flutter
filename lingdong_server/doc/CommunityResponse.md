# lingdong_server.model.CommunityResponse

## Load the model package
```dart
import 'package:lingdong_server/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | [optional] 
**name** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**avatar** | **String** |  | [optional] 
**creatorId** | **int** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) |  | [optional] 
**status** | **int** | Status，状态(0:未激活,1:活跃,2:已归档) | [optional] [default to 1]
**coverImage** | **String** |  | [optional] 
**memberCount** | **int** |  | [optional] 
**isMember** | **bool** | Is Member，当前用户是否已加入 | [optional] [default to false]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


