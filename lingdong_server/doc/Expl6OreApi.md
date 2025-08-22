# lingdong_server.api.Expl6OreApi

## Load the API package
```dart
import 'package:lingdong_server/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPlaceApiExplorePlacesPost**](Expl6OreApi.md#createplaceapiexploreplacespost) | **POST** /api/explore/places | 创建宠物友好场所
[**getPlaceApiExplorePlacesPlaceIdGet**](Expl6OreApi.md#getplaceapiexploreplacesplaceidget) | **GET** /api/explore/places/{place_id} | 获取单个场所信息
[**getPlacesApiExplorePlacesGet**](Expl6OreApi.md#getplacesapiexploreplacesget) | **GET** /api/explore/places | 获取宠物友好场所列表


# **createPlaceApiExplorePlacesPost**
> GenericResponsePlaceResponse createPlaceApiExplorePlacesPost(placeCreate)

创建宠物友好场所

创建新的宠物友好场所

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getExpl6OreApi();
final PlaceCreate placeCreate = ; // PlaceCreate | 

try {
    final response = api.createPlaceApiExplorePlacesPost(placeCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling Expl6OreApi->createPlaceApiExplorePlacesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeCreate** | [**PlaceCreate**](PlaceCreate.md)|  | [optional] 

### Return type

[**GenericResponsePlaceResponse**](GenericResponsePlaceResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlaceApiExplorePlacesPlaceIdGet**
> GenericResponsePlaceResponse getPlaceApiExplorePlacesPlaceIdGet(placeId)

获取单个场所信息

根据ID获取场所详细信息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getExpl6OreApi();
final int placeId = 0; // int | 

try {
    final response = api.getPlaceApiExplorePlacesPlaceIdGet(placeId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling Expl6OreApi->getPlaceApiExplorePlacesPlaceIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **int**|  | 

### Return type

[**GenericResponsePlaceResponse**](GenericResponsePlaceResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlacesApiExplorePlacesGet**
> GenericResponseListPlaceResponse getPlacesApiExplorePlacesGet(skip, limit)

获取宠物友好场所列表

分页获取所有宠物友好场所

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getExpl6OreApi();
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.getPlacesApiExplorePlacesGet(skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling Expl6OreApi->getPlacesApiExplorePlacesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 100]

### Return type

[**GenericResponseListPlaceResponse**](GenericResponseListPlaceResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

