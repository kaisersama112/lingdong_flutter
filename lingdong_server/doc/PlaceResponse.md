# lingdong_server.model.PlaceResponse

## Load the model package
```dart
import 'package:lingdong_server/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Name，场所名称 | 
**type** | **String** | Type，场所类型 | 
**longitude** | **num** | Longitude，经度 | 
**latitude** | **num** | Latitude，纬度 | 
**medias** | [**BuiltList&lt;MediaResponse&gt;**](MediaResponse.md) | Medias，媒体信息列表 | [optional] [default to ListBuilder()]
**address** | **String** |  | [optional] 
**rating** | **num** |  | [optional] 
**description** | **String** |  | [optional] 
**id** | **int** | Id，场所ID | 
**createdAt** | [**Date**](Date.md) | Created At，创建时间 | 
**updatedAt** | [**Date**](Date.md) | Updated At，更新时间 | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


