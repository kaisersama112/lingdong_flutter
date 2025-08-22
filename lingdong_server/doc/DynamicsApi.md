# lingdong_server.api.DynamicsApi

## Load the API package
```dart
import 'package:lingdong_server/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createDynamicApiDynamicsCreateDynamicPost**](DynamicsApi.md#createdynamicapidynamicscreatedynamicpost) | **POST** /api/dynamics/create_dynamic | 创建广场动态
[**createParentCommentApiDynamicsPostsRepliesPost**](DynamicsApi.md#createparentcommentapidynamicspostsrepliespost) | **POST** /api/dynamics/posts/replies | 创建顶级评论
[**createReplyApiDynamicsCommentsParentIdRepliesPost**](DynamicsApi.md#createreplyapidynamicscommentsparentidrepliespost) | **POST** /api/dynamics/comments/{parent_id}/replies | 创建回复
[**deleteDynamicApiDynamicsPostIdDeleteDynamicPost**](DynamicsApi.md#deletedynamicapidynamicspostiddeletedynamicpost) | **POST** /api/dynamics/{post_id}/delete_dynamic | 删除动态
[**deleteParentCommentApiDynamicsParentCommentsCommentIdDelete**](DynamicsApi.md#deleteparentcommentapidynamicsparentcommentscommentiddelete) | **DELETE** /api/dynamics/parent_comments/{comment_id} | 删除顶级评论
[**deleteReplyApiDynamicsRepliesReplyIdDelete**](DynamicsApi.md#deletereplyapidynamicsrepliesreplyiddelete) | **DELETE** /api/dynamics/replies/{reply_id} | 删除回复
[**getDynamicDetailApiDynamicsPostIdGet**](DynamicsApi.md#getdynamicdetailapidynamicspostidget) | **GET** /api/dynamics/{post_id} | 获取动态详情
[**getPostParentCommentsApiDynamicsPostsPostIdParentCommentsGet**](DynamicsApi.md#getpostparentcommentsapidynamicspostspostidparentcommentsget) | **GET** /api/dynamics/posts/{post_id}/parent_comments | 获取动态下的顶级评论
[**getPublicDynamicsApiDynamicsGetPublicDynamicsGet**](DynamicsApi.md#getpublicdynamicsapidynamicsgetpublicdynamicsget) | **GET** /api/dynamics/get_public_dynamics | 获取广场动态
[**getRecommendedDynamicsApiDynamicsRecommendedPost**](DynamicsApi.md#getrecommendeddynamicsapidynamicsrecommendedpost) | **POST** /api/dynamics/recommended | 获取推荐动态
[**getUserFavoriteDynamicsApiDynamicsGetUserFavoriteDynamicsPost**](DynamicsApi.md#getuserfavoritedynamicsapidynamicsgetuserfavoritedynamicspost) | **POST** /api/dynamics/get_user_favorite_dynamics | 获取用户收藏的动态
[**likeCommentApiDynamicsCommentsCommentIdLikePost**](DynamicsApi.md#likecommentapidynamicscommentscommentidlikepost) | **POST** /api/dynamics/comments/{comment_id}/like | 回复点赞
[**likeDynamicApiDynamicsPostIdLikeDynamicPost**](DynamicsApi.md#likedynamicapidynamicspostidlikedynamicpost) | **POST** /api/dynamics/{post_id}/like_dynamic | 点赞动态
[**shareDynamicApiDynamicsPostIdSharePost**](DynamicsApi.md#sharedynamicapidynamicspostidsharepost) | **POST** /api/dynamics/{post_id}/share | 分享动态
[**toggleDynamicFavoriteApiDynamicsPostIdFavoritePost**](DynamicsApi.md#toggledynamicfavoriteapidynamicspostidfavoritepost) | **POST** /api/dynamics/{post_id}/favorite | 切换动态收藏状态
[**toggleLikeApiDynamicsPostIdToggleLikePost**](DynamicsApi.md#togglelikeapidynamicspostidtogglelikepost) | **POST** /api/dynamics/{post_id}/toggle_like | 切换点赞状态
[**unlikeDynamicApiDynamicsPostIdUnlikeDynamicPost**](DynamicsApi.md#unlikedynamicapidynamicspostidunlikedynamicpost) | **POST** /api/dynamics/{post_id}/unlike_dynamic | 取消点赞
[**updateDynamicApiDynamicsPostIdUpdateDynamicPost**](DynamicsApi.md#updatedynamicapidynamicspostidupdatedynamicpost) | **POST** /api/dynamics/{post_id}/update_dynamic | 更新动态


# **createDynamicApiDynamicsCreateDynamicPost**
> GenericResponsePostResponse createDynamicApiDynamicsCreateDynamicPost(postCreate)

创建广场动态



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final PostCreate postCreate = ; // PostCreate | 

try {
    final response = api.createDynamicApiDynamicsCreateDynamicPost(postCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->createDynamicApiDynamicsCreateDynamicPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postCreate** | [**PostCreate**](PostCreate.md)|  | [optional] 

### Return type

[**GenericResponsePostResponse**](GenericResponsePostResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createParentCommentApiDynamicsPostsRepliesPost**
> GenericResponseParentComment createParentCommentApiDynamicsPostsRepliesPost(parentCommentCreate)

创建顶级评论

创建对指定动态的顶级评论

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final ParentCommentCreate parentCommentCreate = ; // ParentCommentCreate | 

try {
    final response = api.createParentCommentApiDynamicsPostsRepliesPost(parentCommentCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->createParentCommentApiDynamicsPostsRepliesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **parentCommentCreate** | [**ParentCommentCreate**](ParentCommentCreate.md)|  | [optional] 

### Return type

[**GenericResponseParentComment**](GenericResponseParentComment.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createReplyApiDynamicsCommentsParentIdRepliesPost**
> GenericResponseReply createReplyApiDynamicsCommentsParentIdRepliesPost(parentId, replyCreate)

创建回复

创建对指定评论的回复

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int parentId = 0; // int | 
final ReplyCreate replyCreate = ; // ReplyCreate | 

try {
    final response = api.createReplyApiDynamicsCommentsParentIdRepliesPost(parentId, replyCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->createReplyApiDynamicsCommentsParentIdRepliesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **parentId** | **int**|  | 
 **replyCreate** | [**ReplyCreate**](ReplyCreate.md)|  | [optional] 

### Return type

[**GenericResponseReply**](GenericResponseReply.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteDynamicApiDynamicsPostIdDeleteDynamicPost**
> GenericResponseDict deleteDynamicApiDynamicsPostIdDeleteDynamicPost(postId)

删除动态



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int postId = 0; // int | 

try {
    final response = api.deleteDynamicApiDynamicsPostIdDeleteDynamicPost(postId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->deleteDynamicApiDynamicsPostIdDeleteDynamicPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteParentCommentApiDynamicsParentCommentsCommentIdDelete**
> GenericResponseBool deleteParentCommentApiDynamicsParentCommentsCommentIdDelete(commentId)

删除顶级评论

删除指定的顶级评论，包括评论的所有回复

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int commentId = 0; // int | 

try {
    final response = api.deleteParentCommentApiDynamicsParentCommentsCommentIdDelete(commentId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->deleteParentCommentApiDynamicsParentCommentsCommentIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **commentId** | **int**|  | 

### Return type

[**GenericResponseBool**](GenericResponseBool.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteReplyApiDynamicsRepliesReplyIdDelete**
> GenericResponseBool deleteReplyApiDynamicsRepliesReplyIdDelete(replyId)

删除回复

删除指定的回复

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int replyId = 0; // int | 

try {
    final response = api.deleteReplyApiDynamicsRepliesReplyIdDelete(replyId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->deleteReplyApiDynamicsRepliesReplyIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **replyId** | **int**|  | 

### Return type

[**GenericResponseBool**](GenericResponseBool.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDynamicDetailApiDynamicsPostIdGet**
> GenericResponsePostResponse getDynamicDetailApiDynamicsPostIdGet(postId)

获取动态详情



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int postId = 0; // int | 

try {
    final response = api.getDynamicDetailApiDynamicsPostIdGet(postId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->getDynamicDetailApiDynamicsPostIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 

### Return type

[**GenericResponsePostResponse**](GenericResponsePostResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPostParentCommentsApiDynamicsPostsPostIdParentCommentsGet**
> GenericResponseDict getPostParentCommentsApiDynamicsPostsPostIdParentCommentsGet(postId, skip, limit)

获取动态下的顶级评论

获取指定动态下的所有顶级评论，包括点赞数量、分页信息和当前用户是否点赞

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int postId = 0; // int | 
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.getPostParentCommentsApiDynamicsPostsPostIdParentCommentsGet(postId, skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->getPostParentCommentsApiDynamicsPostsPostIdParentCommentsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 5]

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPublicDynamicsApiDynamicsGetPublicDynamicsGet**
> GenericResponsePostListResponse getPublicDynamicsApiDynamicsGetPublicDynamicsGet(page, limit, tag)

获取广场动态



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int page = 56; // int | 
final int limit = 56; // int | 
final String tag = tag_example; // String | 

try {
    final response = api.getPublicDynamicsApiDynamicsGetPublicDynamicsGet(page, limit, tag);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->getPublicDynamicsApiDynamicsGetPublicDynamicsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]
 **tag** | **String**|  | [optional] 

### Return type

[**GenericResponsePostListResponse**](GenericResponsePostListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRecommendedDynamicsApiDynamicsRecommendedPost**
> GenericResponsePostListResponse getRecommendedDynamicsApiDynamicsRecommendedPost(paginationParams)

获取推荐动态



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final PaginationParams paginationParams = ; // PaginationParams | 

try {
    final response = api.getRecommendedDynamicsApiDynamicsRecommendedPost(paginationParams);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->getRecommendedDynamicsApiDynamicsRecommendedPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paginationParams** | [**PaginationParams**](PaginationParams.md)|  | [optional] 

### Return type

[**GenericResponsePostListResponse**](GenericResponsePostListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserFavoriteDynamicsApiDynamicsGetUserFavoriteDynamicsPost**
> GenericResponsePostListResponse getUserFavoriteDynamicsApiDynamicsGetUserFavoriteDynamicsPost(paginationParams)

获取用户收藏的动态

获取当前用户收藏的动态列表，支持分页

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final PaginationParams paginationParams = ; // PaginationParams | 

try {
    final response = api.getUserFavoriteDynamicsApiDynamicsGetUserFavoriteDynamicsPost(paginationParams);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->getUserFavoriteDynamicsApiDynamicsGetUserFavoriteDynamicsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paginationParams** | [**PaginationParams**](PaginationParams.md)|  | [optional] 

### Return type

[**GenericResponsePostListResponse**](GenericResponsePostListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **likeCommentApiDynamicsCommentsCommentIdLikePost**
> GenericResponseDict likeCommentApiDynamicsCommentsCommentIdLikePost(commentId)

回复点赞

对指定回复进行点赞操作

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int commentId = 0; // int | 

try {
    final response = api.likeCommentApiDynamicsCommentsCommentIdLikePost(commentId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->likeCommentApiDynamicsCommentsCommentIdLikePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **commentId** | **int**|  | 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **likeDynamicApiDynamicsPostIdLikeDynamicPost**
> GenericResponseDict likeDynamicApiDynamicsPostIdLikeDynamicPost(postId)

点赞动态



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int postId = 0; // int | 

try {
    final response = api.likeDynamicApiDynamicsPostIdLikeDynamicPost(postId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->likeDynamicApiDynamicsPostIdLikeDynamicPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **shareDynamicApiDynamicsPostIdSharePost**
> GenericResponseDict shareDynamicApiDynamicsPostIdSharePost(postId, platform, content, shareUrl, isPublic)

分享动态



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int postId = 0; // int | 
final String platform = platform_example; // String | 
final String content = content_example; // String | 
final String shareUrl = shareUrl_example; // String | 
final bool isPublic = true; // bool | 

try {
    final response = api.shareDynamicApiDynamicsPostIdSharePost(postId, platform, content, shareUrl, isPublic);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->shareDynamicApiDynamicsPostIdSharePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 
 **platform** | **String**|  | 
 **content** | **String**|  | [optional] 
 **shareUrl** | **String**|  | [optional] 
 **isPublic** | **bool**|  | [optional] [default to true]

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **toggleDynamicFavoriteApiDynamicsPostIdFavoritePost**
> GenericResponseDict toggleDynamicFavoriteApiDynamicsPostIdFavoritePost(postId, source_)

切换动态收藏状态



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int postId = 0; // int | 
final String source_ = source__example; // String | 

try {
    final response = api.toggleDynamicFavoriteApiDynamicsPostIdFavoritePost(postId, source_);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->toggleDynamicFavoriteApiDynamicsPostIdFavoritePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 
 **source_** | **String**|  | [optional] 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **toggleLikeApiDynamicsPostIdToggleLikePost**
> GenericResponseDict toggleLikeApiDynamicsPostIdToggleLikePost(postId)

切换点赞状态



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int postId = 0; // int | 

try {
    final response = api.toggleLikeApiDynamicsPostIdToggleLikePost(postId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->toggleLikeApiDynamicsPostIdToggleLikePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unlikeDynamicApiDynamicsPostIdUnlikeDynamicPost**
> GenericResponseDict unlikeDynamicApiDynamicsPostIdUnlikeDynamicPost(postId)

取消点赞



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int postId = 0; // int | 

try {
    final response = api.unlikeDynamicApiDynamicsPostIdUnlikeDynamicPost(postId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->unlikeDynamicApiDynamicsPostIdUnlikeDynamicPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateDynamicApiDynamicsPostIdUpdateDynamicPost**
> GenericResponsePostResponse updateDynamicApiDynamicsPostIdUpdateDynamicPost(postId, postCreate)

更新动态



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int postId = 0; // int | 
final PostCreate postCreate = ; // PostCreate | 

try {
    final response = api.updateDynamicApiDynamicsPostIdUpdateDynamicPost(postId, postCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->updateDynamicApiDynamicsPostIdUpdateDynamicPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **int**|  | 
 **postCreate** | [**PostCreate**](PostCreate.md)|  | [optional] 

### Return type

[**GenericResponsePostResponse**](GenericResponsePostResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

