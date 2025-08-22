# lingdong_server.model.ExaminationRecordResponse

## Load the model package
```dart
import 'package:lingdong_server/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**petId** | **int** | Pet Id，宠物ID | 
**testType** | **String** | Test Type，检测类型 | 
**testDate** | [**Date**](Date.md) | Test Date，检测日期 | 
**testInstitution** | **String** | Test Institution，检测机构 | 
**attendingVet** | **String** |  | [optional] 
**testItems** | **BuiltList&lt;String&gt;** | Test Items，检测项目 | 
**testResults** | **BuiltMap&lt;String, String&gt;** | Test Results，检测结果 | 
**referenceRange** | **String** |  | [optional] 
**doctorComments** | **String** |  | [optional] 
**recommendations** | **String** |  | [optional] 
**followUpRequired** | **bool** |  | [optional] 
**nextCheckupDate** | [**Date**](Date.md) |  | [optional] 
**id** | **int** | Id，记录ID | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


