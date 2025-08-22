# lingdong_server.api.TagsApi

## Load the API package
```dart
import 'package:lingdong_server/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createTagApiTagsCreateTagPost**](TagsApi.md#createtagapitagscreatetagpost) | **POST** /api/tags/create_tag | 创建标签
[**deleteTagApiTagsDeleteTagTagIdPost**](TagsApi.md#deletetagapitagsdeletetagtagidpost) | **POST** /api/tags/delete_tag/{tag_id} | 删除标签
[**readTagApiTagsGetTagTagIdGet**](TagsApi.md#readtagapitagsgettagtagidget) | **GET** /api/tags/get_tag/{tag_id} | 获取单个标签
[**readTagsApiTagsGetTagListGet**](TagsApi.md#readtagsapitagsgettaglistget) | **GET** /api/tags/get_tag_list | 获取标签列表
[**updateTagApiTagsUpdateTagPost**](TagsApi.md#updatetagapitagsupdatetagpost) | **POST** /api/tags/update_tag | 更新标签


# **createTagApiTagsCreateTagPost**
> GenericResponseTagResponse createTagApiTagsCreateTagPost(tagCreate)

创建标签



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getTagsApi();
final TagCreate tagCreate = ; // TagCreate | 

try {
    final response = api.createTagApiTagsCreateTagPost(tagCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TagsApi->createTagApiTagsCreateTagPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tagCreate** | [**TagCreate**](TagCreate.md)|  | [optional] 

### Return type

[**GenericResponseTagResponse**](GenericResponseTagResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteTagApiTagsDeleteTagTagIdPost**
> GenericResponseDict deleteTagApiTagsDeleteTagTagIdPost(tagId)

删除标签



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getTagsApi();
final int tagId = 0; // int | 

try {
    final response = api.deleteTagApiTagsDeleteTagTagIdPost(tagId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TagsApi->deleteTagApiTagsDeleteTagTagIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tagId** | **int**|  | 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readTagApiTagsGetTagTagIdGet**
> GenericResponseTagResponse readTagApiTagsGetTagTagIdGet(tagId)

获取单个标签



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getTagsApi();
final int tagId = 0; // int | 

try {
    final response = api.readTagApiTagsGetTagTagIdGet(tagId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TagsApi->readTagApiTagsGetTagTagIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tagId** | **int**|  | 

### Return type

[**GenericResponseTagResponse**](GenericResponseTagResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readTagsApiTagsGetTagListGet**
> GenericResponseTagListResponse readTagsApiTagsGetTagListGet(skip, limit)

获取标签列表



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getTagsApi();
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.readTagsApiTagsGetTagListGet(skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TagsApi->readTagsApiTagsGetTagListGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**GenericResponseTagListResponse**](GenericResponseTagListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateTagApiTagsUpdateTagPost**
> GenericResponseTagResponse updateTagApiTagsUpdateTagPost(tagId, tagUpdate)

更新标签



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getTagsApi();
final int tagId = 56; // int | 
final TagUpdate tagUpdate = ; // TagUpdate | 

try {
    final response = api.updateTagApiTagsUpdateTagPost(tagId, tagUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TagsApi->updateTagApiTagsUpdateTagPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tagId** | **int**|  | 
 **tagUpdate** | [**TagUpdate**](TagUpdate.md)|  | [optional] 

### Return type

[**GenericResponseTagResponse**](GenericResponseTagResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

