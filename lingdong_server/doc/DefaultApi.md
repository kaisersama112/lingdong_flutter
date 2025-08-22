# lingdong_server.api.DefaultApi

## Load the API package
```dart
import 'package:lingdong_server/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**readRootGet**](DefaultApi.md#readrootget) | **GET** / | 获取根路由


# **readRootGet**
> String readRootGet()

获取根路由

根路由 :return: 根路由响应

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDefaultApi();

try {
    final response = api.readRootGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->readRootGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

