# lingdong_server.api.SocialApi

## Load the API package
```dart
import 'package:lingdong_server/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**approveMemberApiCommunityCommunitiesCommunityIdMembersApprovePost**](SocialApi.md#approvememberapicommunitycommunitiescommunityidmembersapprovepost) | **POST** /api/community/communities/{community_id}/members/approve | 审核成员加入申请
[**banMemberApiCommunityCommunitiesCommunityIdMembersMemberIdBanPost**](SocialApi.md#banmemberapicommunitycommunitiescommunityidmembersmemberidbanpost) | **POST** /api/community/communities/{community_id}/members/{member_id}/ban | 封禁成员
[**createCommunityApiCommunityCommunitiesPost**](SocialApi.md#createcommunityapicommunitycommunitiespost) | **POST** /api/community/communities | 创建社群
[**createCommunityPostApiCommunityCommunitiesCommunityIdPostsPost**](SocialApi.md#createcommunitypostapicommunitycommunitiescommunityidpostspost) | **POST** /api/community/communities/{community_id}/posts | 发布社群动态
[**getCommunitiesApiCommunityCommunitiesGet**](SocialApi.md#getcommunitiesapicommunitycommunitiesget) | **GET** /api/community/communities | 获取社群列表
[**getCommunityDetailApiCommunityCommunitiesCommunityIdGet**](SocialApi.md#getcommunitydetailapicommunitycommunitiescommunityidget) | **GET** /api/community/communities/{community_id} | 获取社群详情
[**getCommunityMembersApiCommunityCommunitiesCommunityIdMembersGet**](SocialApi.md#getcommunitymembersapicommunitycommunitiescommunityidmembersget) | **GET** /api/community/communities/{community_id}/members | 获取社群成员列表
[**getCommunityPostsApiCommunityCommunitiesCommunityIdPostsGet**](SocialApi.md#getcommunitypostsapicommunitycommunitiescommunityidpostsget) | **GET** /api/community/communities/{community_id}/posts | 获取社群动态
[**getPendingMembersApiCommunityCommunitiesCommunityIdMembersPendingGet**](SocialApi.md#getpendingmembersapicommunitycommunitiescommunityidmemberspendingget) | **GET** /api/community/communities/{community_id}/members/pending | 获取待审核成员列表
[**joinCommunityApiCommunityCommunitiesCommunityIdJoinPost**](SocialApi.md#joincommunityapicommunitycommunitiescommunityidjoinpost) | **POST** /api/community/communities/{community_id}/join | 加入社群
[**updateMemberRoleApiCommunityCommunitiesCommunityIdMembersRolePost**](SocialApi.md#updatememberroleapicommunitycommunitiescommunityidmembersrolepost) | **POST** /api/community/communities/{community_id}/members/role | 更新成员角色


# **approveMemberApiCommunityCommunitiesCommunityIdMembersApprovePost**
> GenericResponseDict approveMemberApiCommunityCommunitiesCommunityIdMembersApprovePost(communityId, membershipApproval)

审核成员加入申请



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getSocialApi();
final int communityId = 0; // int | 
final MembershipApproval membershipApproval = ; // MembershipApproval | 

try {
    final response = api.approveMemberApiCommunityCommunitiesCommunityIdMembersApprovePost(communityId, membershipApproval);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SocialApi->approveMemberApiCommunityCommunitiesCommunityIdMembersApprovePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **communityId** | **int**|  | 
 **membershipApproval** | [**MembershipApproval**](MembershipApproval.md)|  | [optional] 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **banMemberApiCommunityCommunitiesCommunityIdMembersMemberIdBanPost**
> GenericResponseDict banMemberApiCommunityCommunitiesCommunityIdMembersMemberIdBanPost(communityId, memberId, comment)

封禁成员



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getSocialApi();
final int communityId = 0; // int | 
final int memberId = 0; // int | 
final String comment = comment_example; // String | 封禁原因

try {
    final response = api.banMemberApiCommunityCommunitiesCommunityIdMembersMemberIdBanPost(communityId, memberId, comment);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SocialApi->banMemberApiCommunityCommunitiesCommunityIdMembersMemberIdBanPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **communityId** | **int**|  | 
 **memberId** | **int**|  | 
 **comment** | **String**| 封禁原因 | [optional] 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createCommunityApiCommunityCommunitiesPost**
> GenericResponseCommunityResponse createCommunityApiCommunityCommunitiesPost(communityCreate)

创建社群

创建一个新的社群。 Args:     community (CommunityCreate): 包含社群信息的请求模型。     db (Session, optional): 数据库会话对象。     current_user (User, optional): 当前登录用户。  Returns:     GenericResponse[CommunityResponse]: 包含新创建社群信息的响应模型。

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getSocialApi();
final CommunityCreate communityCreate = ; // CommunityCreate | 

try {
    final response = api.createCommunityApiCommunityCommunitiesPost(communityCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SocialApi->createCommunityApiCommunityCommunitiesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **communityCreate** | [**CommunityCreate**](CommunityCreate.md)|  | [optional] 

### Return type

[**GenericResponseCommunityResponse**](GenericResponseCommunityResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createCommunityPostApiCommunityCommunitiesCommunityIdPostsPost**
> GenericResponsePostResponse createCommunityPostApiCommunityCommunitiesCommunityIdPostsPost(communityId, postCreate)

发布社群动态



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getSocialApi();
final int communityId = 0; // int | 
final PostCreate postCreate = ; // PostCreate | 

try {
    final response = api.createCommunityPostApiCommunityCommunitiesCommunityIdPostsPost(communityId, postCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SocialApi->createCommunityPostApiCommunityCommunitiesCommunityIdPostsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **communityId** | **int**|  | 
 **postCreate** | [**PostCreate**](PostCreate.md)|  | [optional] 

### Return type

[**GenericResponsePostResponse**](GenericResponsePostResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCommunitiesApiCommunityCommunitiesGet**
> GenericResponseCommunityListResponse getCommunitiesApiCommunityCommunitiesGet(skip, limit, search)

获取社群列表



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getSocialApi();
final int skip = 56; // int | 
final int limit = 56; // int | 
final String search = search_example; // String | 搜索关键词

try {
    final response = api.getCommunitiesApiCommunityCommunitiesGet(skip, limit, search);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SocialApi->getCommunitiesApiCommunityCommunitiesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]
 **search** | **String**| 搜索关键词 | [optional] 

### Return type

[**GenericResponseCommunityListResponse**](GenericResponseCommunityListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCommunityDetailApiCommunityCommunitiesCommunityIdGet**
> GenericResponseCommunityDetailResponse getCommunityDetailApiCommunityCommunitiesCommunityIdGet(communityId)

获取社群详情



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getSocialApi();
final int communityId = 0; // int | 

try {
    final response = api.getCommunityDetailApiCommunityCommunitiesCommunityIdGet(communityId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SocialApi->getCommunityDetailApiCommunityCommunitiesCommunityIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **communityId** | **int**|  | 

### Return type

[**GenericResponseCommunityDetailResponse**](GenericResponseCommunityDetailResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCommunityMembersApiCommunityCommunitiesCommunityIdMembersGet**
> GenericResponseCommunityMemberListResponse getCommunityMembersApiCommunityCommunitiesCommunityIdMembersGet(communityId, skip, limit, role, status)

获取社群成员列表



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getSocialApi();
final int communityId = 0; // int | 
final int skip = 56; // int | 
final int limit = 56; // int | 
final String role = role_example; // String | 角色过滤
final String status = status_example; // String | 状态过滤

try {
    final response = api.getCommunityMembersApiCommunityCommunitiesCommunityIdMembersGet(communityId, skip, limit, role, status);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SocialApi->getCommunityMembersApiCommunityCommunitiesCommunityIdMembersGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **communityId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]
 **role** | **String**| 角色过滤 | [optional] 
 **status** | **String**| 状态过滤 | [optional] 

### Return type

[**GenericResponseCommunityMemberListResponse**](GenericResponseCommunityMemberListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCommunityPostsApiCommunityCommunitiesCommunityIdPostsGet**
> GenericResponsePostListResponse getCommunityPostsApiCommunityCommunitiesCommunityIdPostsGet(communityId, page, limit)

获取社群动态



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getSocialApi();
final int communityId = 0; // int | 
final int page = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.getCommunityPostsApiCommunityCommunitiesCommunityIdPostsGet(communityId, page, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SocialApi->getCommunityPostsApiCommunityCommunitiesCommunityIdPostsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **communityId** | **int**|  | 
 **page** | **int**|  | [optional] [default to 1]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**GenericResponsePostListResponse**](GenericResponsePostListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPendingMembersApiCommunityCommunitiesCommunityIdMembersPendingGet**
> GenericResponseCommunityMemberListResponse getPendingMembersApiCommunityCommunitiesCommunityIdMembersPendingGet(communityId, skip, limit)

获取待审核成员列表



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getSocialApi();
final int communityId = 0; // int | 
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.getPendingMembersApiCommunityCommunitiesCommunityIdMembersPendingGet(communityId, skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SocialApi->getPendingMembersApiCommunityCommunitiesCommunityIdMembersPendingGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **communityId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**GenericResponseCommunityMemberListResponse**](GenericResponseCommunityMemberListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **joinCommunityApiCommunityCommunitiesCommunityIdJoinPost**
> GenericResponseDict joinCommunityApiCommunityCommunitiesCommunityIdJoinPost(communityId)

加入社群



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getSocialApi();
final int communityId = 0; // int | 

try {
    final response = api.joinCommunityApiCommunityCommunitiesCommunityIdJoinPost(communityId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SocialApi->joinCommunityApiCommunityCommunitiesCommunityIdJoinPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **communityId** | **int**|  | 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMemberRoleApiCommunityCommunitiesCommunityIdMembersRolePost**
> GenericResponseDict updateMemberRoleApiCommunityCommunitiesCommunityIdMembersRolePost(communityId, roleUpdate)

更新成员角色



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getSocialApi();
final int communityId = 0; // int | 
final RoleUpdate roleUpdate = ; // RoleUpdate | 

try {
    final response = api.updateMemberRoleApiCommunityCommunitiesCommunityIdMembersRolePost(communityId, roleUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SocialApi->updateMemberRoleApiCommunityCommunitiesCommunityIdMembersRolePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **communityId** | **int**|  | 
 **roleUpdate** | [**RoleUpdate**](RoleUpdate.md)|  | [optional] 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

