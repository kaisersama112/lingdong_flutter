# lingdong_server.api.MediaApi

## Load the API package
```dart
import 'package:lingdong_server/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteMediaApiMediaDeleteMediaPost**](MediaApi.md#deletemediaapimediadeletemediapost) | **POST** /api/media/delete_media | 删除媒体资源
[**deleteMediaApiMediaDeleteMediaPost_0**](MediaApi.md#deletemediaapimediadeletemediapost_0) | **POST** /api/media/delete_media | 删除媒体资源
[**uploadMediaApiMediaUploadMediaPost**](MediaApi.md#uploadmediaapimediauploadmediapost) | **POST** /api/media/upload_media | 上传媒体资源到指定对象
[**uploadMediaApiMediaUploadMediaPost_0**](MediaApi.md#uploadmediaapimediauploadmediapost_0) | **POST** /api/media/upload_media | 上传媒体资源到指定对象


# **deleteMediaApiMediaDeleteMediaPost**
> GenericResponseMediaOut deleteMediaApiMediaDeleteMediaPost(mediaId)

删除媒体资源

删除指定的媒体资源

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getMediaApi();
final int mediaId = 56; // int | 

try {
    final response = api.deleteMediaApiMediaDeleteMediaPost(mediaId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaApi->deleteMediaApiMediaDeleteMediaPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mediaId** | **int**|  | 

### Return type

[**GenericResponseMediaOut**](GenericResponseMediaOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMediaApiMediaDeleteMediaPost_0**
> GenericResponseMediaOut deleteMediaApiMediaDeleteMediaPost_0(mediaId)

删除媒体资源

删除指定的媒体资源

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getMediaApi();
final int mediaId = 56; // int | 

try {
    final response = api.deleteMediaApiMediaDeleteMediaPost_0(mediaId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaApi->deleteMediaApiMediaDeleteMediaPost_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mediaId** | **int**|  | 

### Return type

[**GenericResponseMediaOut**](GenericResponseMediaOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadMediaApiMediaUploadMediaPost**
> GenericResponseMediaOut uploadMediaApiMediaUploadMediaPost(relatedType, relatedId, file, sortOrder, mediaType, description)

上传媒体资源到指定对象

上传媒体资源并关联到指定类型的对象  - **related_type**: 关联对象类型 - **related_id**: 关联对象ID - **file**: 上传的文件 - **media_type**: 媒体类型(默认:image) - **description**: 媒体描述(可选) - **sort_order**: 排序序号(可选)

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getMediaApi();
final RelatedTypeEnum relatedType = ; // RelatedTypeEnum | 
final int relatedId = 56; // int | 
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 
final int sortOrder = 56; // int | 
final MediaType mediaType = ; // MediaType | 
final String description = description_example; // String | 

try {
    final response = api.uploadMediaApiMediaUploadMediaPost(relatedType, relatedId, file, sortOrder, mediaType, description);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaApi->uploadMediaApiMediaUploadMediaPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **relatedType** | [**RelatedTypeEnum**](RelatedTypeEnum.md)|  | 
 **relatedId** | **int**|  | 
 **file** | **MultipartFile**|  | 
 **sortOrder** | **int**|  | [optional] [default to 0]
 **mediaType** | [**MediaType**](MediaType.md)|  | [optional] 
 **description** | **String**|  | [optional] 

### Return type

[**GenericResponseMediaOut**](GenericResponseMediaOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadMediaApiMediaUploadMediaPost_0**
> GenericResponseMediaOut uploadMediaApiMediaUploadMediaPost_0(relatedType, relatedId, file, sortOrder, mediaType, description)

上传媒体资源到指定对象

上传媒体资源并关联到指定类型的对象  - **related_type**: 关联对象类型 - **related_id**: 关联对象ID - **file**: 上传的文件 - **media_type**: 媒体类型(默认:image) - **description**: 媒体描述(可选) - **sort_order**: 排序序号(可选)

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getMediaApi();
final RelatedTypeEnum relatedType = ; // RelatedTypeEnum | 
final int relatedId = 56; // int | 
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 
final int sortOrder = 56; // int | 
final MediaType mediaType = ; // MediaType | 
final String description = description_example; // String | 

try {
    final response = api.uploadMediaApiMediaUploadMediaPost_0(relatedType, relatedId, file, sortOrder, mediaType, description);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaApi->uploadMediaApiMediaUploadMediaPost_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **relatedType** | [**RelatedTypeEnum**](RelatedTypeEnum.md)|  | 
 **relatedId** | **int**|  | 
 **file** | **MultipartFile**|  | 
 **sortOrder** | **int**|  | [optional] [default to 0]
 **mediaType** | [**MediaType**](MediaType.md)|  | [optional] 
 **description** | **String**|  | [optional] 

### Return type

[**GenericResponseMediaOut**](GenericResponseMediaOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

