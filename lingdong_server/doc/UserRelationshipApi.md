# lingdong_server.api.UserRelationshipApi

## Load the API package
```dart
import 'package:lingdong_server/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkFollowStatusApiUserRelationshipStatusUserIdGet**](UserRelationshipApi.md#checkfollowstatusapiuserrelationshipstatususeridget) | **GET** /api/user/relationship/status/{user_id} | 检查关注状态
[**checkFollowStatusApiUserRelationshipStatusUserIdGet_0**](UserRelationshipApi.md#checkfollowstatusapiuserrelationshipstatususeridget_0) | **GET** /api/user/relationship/status/{user_id} | 检查关注状态
[**followApiUserRelationshipFollowPost**](UserRelationshipApi.md#followapiuserrelationshipfollowpost) | **POST** /api/user/relationship/follow | 关注用户
[**followApiUserRelationshipFollowPost_0**](UserRelationshipApi.md#followapiuserrelationshipfollowpost_0) | **POST** /api/user/relationship/follow | 关注用户
[**getFollowCountsApiUserRelationshipCountUserIdGet**](UserRelationshipApi.md#getfollowcountsapiuserrelationshipcountuseridget) | **GET** /api/user/relationship/count/{user_id} | 获取关注/粉丝数量
[**getFollowCountsApiUserRelationshipCountUserIdGet_0**](UserRelationshipApi.md#getfollowcountsapiuserrelationshipcountuseridget_0) | **GET** /api/user/relationship/count/{user_id} | 获取关注/粉丝数量
[**getFollowersListApiUserRelationshipFollowersUserIdGet**](UserRelationshipApi.md#getfollowerslistapiuserrelationshipfollowersuseridget) | **GET** /api/user/relationship/followers/{user_id} | 获取用户粉丝列表
[**getFollowersListApiUserRelationshipFollowersUserIdGet_0**](UserRelationshipApi.md#getfollowerslistapiuserrelationshipfollowersuseridget_0) | **GET** /api/user/relationship/followers/{user_id} | 获取用户粉丝列表
[**getFollowingListApiUserRelationshipFollowingUserIdGet**](UserRelationshipApi.md#getfollowinglistapiuserrelationshipfollowinguseridget) | **GET** /api/user/relationship/following/{user_id} | 获取用户关注列表
[**getFollowingListApiUserRelationshipFollowingUserIdGet_0**](UserRelationshipApi.md#getfollowinglistapiuserrelationshipfollowinguseridget_0) | **GET** /api/user/relationship/following/{user_id} | 获取用户关注列表
[**getMyFollowersApiUserRelationshipMyFollowersGet**](UserRelationshipApi.md#getmyfollowersapiuserrelationshipmyfollowersget) | **GET** /api/user/relationship/my/followers | 获取当前用户粉丝列表
[**getMyFollowersApiUserRelationshipMyFollowersGet_0**](UserRelationshipApi.md#getmyfollowersapiuserrelationshipmyfollowersget_0) | **GET** /api/user/relationship/my/followers | 获取当前用户粉丝列表
[**getMyFollowingApiUserRelationshipMyFollowingGet**](UserRelationshipApi.md#getmyfollowingapiuserrelationshipmyfollowingget) | **GET** /api/user/relationship/my/following | 获取当前用户关注列表
[**getMyFollowingApiUserRelationshipMyFollowingGet_0**](UserRelationshipApi.md#getmyfollowingapiuserrelationshipmyfollowingget_0) | **GET** /api/user/relationship/my/following | 获取当前用户关注列表
[**unfollowApiUserRelationshipUnfollowPost**](UserRelationshipApi.md#unfollowapiuserrelationshipunfollowpost) | **POST** /api/user/relationship/unfollow | 取消关注用户
[**unfollowApiUserRelationshipUnfollowPost_0**](UserRelationshipApi.md#unfollowapiuserrelationshipunfollowpost_0) | **POST** /api/user/relationship/unfollow | 取消关注用户


# **checkFollowStatusApiUserRelationshipStatusUserIdGet**
> GenericResponseFollowStatusResponse checkFollowStatusApiUserRelationshipStatusUserIdGet(userId)

检查关注状态

检查当前用户是否关注了指定用户 - **user_id**: 要检查的目标用户ID

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserRelationshipApi();
final int userId = 0; // int | 

try {
    final response = api.checkFollowStatusApiUserRelationshipStatusUserIdGet(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserRelationshipApi->checkFollowStatusApiUserRelationshipStatusUserIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 

### Return type

[**GenericResponseFollowStatusResponse**](GenericResponseFollowStatusResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkFollowStatusApiUserRelationshipStatusUserIdGet_0**
> GenericResponseFollowStatusResponse checkFollowStatusApiUserRelationshipStatusUserIdGet_0(userId)

检查关注状态

检查当前用户是否关注了指定用户 - **user_id**: 要检查的目标用户ID

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserRelationshipApi();
final int userId = 0; // int | 

try {
    final response = api.checkFollowStatusApiUserRelationshipStatusUserIdGet_0(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserRelationshipApi->checkFollowStatusApiUserRelationshipStatusUserIdGet_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 

### Return type

[**GenericResponseFollowStatusResponse**](GenericResponseFollowStatusResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **followApiUserRelationshipFollowPost**
> GenericResponseDict followApiUserRelationshipFollowPost(followRequest)

关注用户

关注指定用户 - **following_id**: 要关注的用户ID

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserRelationshipApi();
final FollowRequest followRequest = ; // FollowRequest | 

try {
    final response = api.followApiUserRelationshipFollowPost(followRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserRelationshipApi->followApiUserRelationshipFollowPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **followRequest** | [**FollowRequest**](FollowRequest.md)|  | [optional] 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **followApiUserRelationshipFollowPost_0**
> GenericResponseDict followApiUserRelationshipFollowPost_0(followRequest)

关注用户

关注指定用户 - **following_id**: 要关注的用户ID

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserRelationshipApi();
final FollowRequest followRequest = ; // FollowRequest | 

try {
    final response = api.followApiUserRelationshipFollowPost_0(followRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserRelationshipApi->followApiUserRelationshipFollowPost_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **followRequest** | [**FollowRequest**](FollowRequest.md)|  | [optional] 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFollowCountsApiUserRelationshipCountUserIdGet**
> GenericResponseFollowCountResponse getFollowCountsApiUserRelationshipCountUserIdGet(userId)

获取关注/粉丝数量

获取指定用户的关注数和粉丝数 - **user_id**: 要查询的用户ID

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserRelationshipApi();
final int userId = 0; // int | 

try {
    final response = api.getFollowCountsApiUserRelationshipCountUserIdGet(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserRelationshipApi->getFollowCountsApiUserRelationshipCountUserIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 

### Return type

[**GenericResponseFollowCountResponse**](GenericResponseFollowCountResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFollowCountsApiUserRelationshipCountUserIdGet_0**
> GenericResponseFollowCountResponse getFollowCountsApiUserRelationshipCountUserIdGet_0(userId)

获取关注/粉丝数量

获取指定用户的关注数和粉丝数 - **user_id**: 要查询的用户ID

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserRelationshipApi();
final int userId = 0; // int | 

try {
    final response = api.getFollowCountsApiUserRelationshipCountUserIdGet_0(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserRelationshipApi->getFollowCountsApiUserRelationshipCountUserIdGet_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 

### Return type

[**GenericResponseFollowCountResponse**](GenericResponseFollowCountResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFollowersListApiUserRelationshipFollowersUserIdGet**
> GenericResponseUserFollowListResponse getFollowersListApiUserRelationshipFollowersUserIdGet(userId, skip, limit)

获取用户粉丝列表

获取指定用户的粉丝列表 - **user_id**: 要查询的用户ID - **skip**: 跳过的记录数，默认为0 - **limit**: 获取的记录数限制，默认为20

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserRelationshipApi();
final int userId = 0; // int | 
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.getFollowersListApiUserRelationshipFollowersUserIdGet(userId, skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserRelationshipApi->getFollowersListApiUserRelationshipFollowersUserIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**GenericResponseUserFollowListResponse**](GenericResponseUserFollowListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFollowersListApiUserRelationshipFollowersUserIdGet_0**
> GenericResponseUserFollowListResponse getFollowersListApiUserRelationshipFollowersUserIdGet_0(userId, skip, limit)

获取用户粉丝列表

获取指定用户的粉丝列表 - **user_id**: 要查询的用户ID - **skip**: 跳过的记录数，默认为0 - **limit**: 获取的记录数限制，默认为20

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserRelationshipApi();
final int userId = 0; // int | 
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.getFollowersListApiUserRelationshipFollowersUserIdGet_0(userId, skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserRelationshipApi->getFollowersListApiUserRelationshipFollowersUserIdGet_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**GenericResponseUserFollowListResponse**](GenericResponseUserFollowListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFollowingListApiUserRelationshipFollowingUserIdGet**
> GenericResponseUserFollowListResponse getFollowingListApiUserRelationshipFollowingUserIdGet(userId, skip, limit)

获取用户关注列表

获取指定用户的关注列表 - **user_id**: 要查询的用户ID - **skip**: 跳过的记录数，默认为0 - **limit**: 获取的记录数限制，默认为20

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserRelationshipApi();
final int userId = 0; // int | 
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.getFollowingListApiUserRelationshipFollowingUserIdGet(userId, skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserRelationshipApi->getFollowingListApiUserRelationshipFollowingUserIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**GenericResponseUserFollowListResponse**](GenericResponseUserFollowListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFollowingListApiUserRelationshipFollowingUserIdGet_0**
> GenericResponseUserFollowListResponse getFollowingListApiUserRelationshipFollowingUserIdGet_0(userId, skip, limit)

获取用户关注列表

获取指定用户的关注列表 - **user_id**: 要查询的用户ID - **skip**: 跳过的记录数，默认为0 - **limit**: 获取的记录数限制，默认为20

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserRelationshipApi();
final int userId = 0; // int | 
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.getFollowingListApiUserRelationshipFollowingUserIdGet_0(userId, skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserRelationshipApi->getFollowingListApiUserRelationshipFollowingUserIdGet_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**GenericResponseUserFollowListResponse**](GenericResponseUserFollowListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyFollowersApiUserRelationshipMyFollowersGet**
> GenericResponseUserFollowListResponse getMyFollowersApiUserRelationshipMyFollowersGet(skip, limit)

获取当前用户粉丝列表

获取当前用户的粉丝列表 - **skip**: 跳过的记录数，默认为0 - **limit**: 获取的记录数限制，默认为20

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserRelationshipApi();
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.getMyFollowersApiUserRelationshipMyFollowersGet(skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserRelationshipApi->getMyFollowersApiUserRelationshipMyFollowersGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**GenericResponseUserFollowListResponse**](GenericResponseUserFollowListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyFollowersApiUserRelationshipMyFollowersGet_0**
> GenericResponseUserFollowListResponse getMyFollowersApiUserRelationshipMyFollowersGet_0(skip, limit)

获取当前用户粉丝列表

获取当前用户的粉丝列表 - **skip**: 跳过的记录数，默认为0 - **limit**: 获取的记录数限制，默认为20

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserRelationshipApi();
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.getMyFollowersApiUserRelationshipMyFollowersGet_0(skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserRelationshipApi->getMyFollowersApiUserRelationshipMyFollowersGet_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**GenericResponseUserFollowListResponse**](GenericResponseUserFollowListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyFollowingApiUserRelationshipMyFollowingGet**
> GenericResponseUserFollowListResponse getMyFollowingApiUserRelationshipMyFollowingGet(skip, limit)

获取当前用户关注列表

获取当前用户的关注列表 - **skip**: 跳过的记录数，默认为0 - **limit**: 获取的记录数限制，默认为20

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserRelationshipApi();
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.getMyFollowingApiUserRelationshipMyFollowingGet(skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserRelationshipApi->getMyFollowingApiUserRelationshipMyFollowingGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**GenericResponseUserFollowListResponse**](GenericResponseUserFollowListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyFollowingApiUserRelationshipMyFollowingGet_0**
> GenericResponseUserFollowListResponse getMyFollowingApiUserRelationshipMyFollowingGet_0(skip, limit)

获取当前用户关注列表

获取当前用户的关注列表 - **skip**: 跳过的记录数，默认为0 - **limit**: 获取的记录数限制，默认为20

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserRelationshipApi();
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.getMyFollowingApiUserRelationshipMyFollowingGet_0(skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserRelationshipApi->getMyFollowingApiUserRelationshipMyFollowingGet_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**GenericResponseUserFollowListResponse**](GenericResponseUserFollowListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unfollowApiUserRelationshipUnfollowPost**
> GenericResponseDict unfollowApiUserRelationshipUnfollowPost(unfollowRequest)

取消关注用户

取消关注指定用户 - **following_id**: 要取消关注的用户ID

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserRelationshipApi();
final UnfollowRequest unfollowRequest = ; // UnfollowRequest | 

try {
    final response = api.unfollowApiUserRelationshipUnfollowPost(unfollowRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserRelationshipApi->unfollowApiUserRelationshipUnfollowPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **unfollowRequest** | [**UnfollowRequest**](UnfollowRequest.md)|  | [optional] 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unfollowApiUserRelationshipUnfollowPost_0**
> GenericResponseDict unfollowApiUserRelationshipUnfollowPost_0(unfollowRequest)

取消关注用户

取消关注指定用户 - **following_id**: 要取消关注的用户ID

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserRelationshipApi();
final UnfollowRequest unfollowRequest = ; // UnfollowRequest | 

try {
    final response = api.unfollowApiUserRelationshipUnfollowPost_0(unfollowRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserRelationshipApi->unfollowApiUserRelationshipUnfollowPost_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **unfollowRequest** | [**UnfollowRequest**](UnfollowRequest.md)|  | [optional] 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

