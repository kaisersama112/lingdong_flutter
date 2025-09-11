# lingdong_server.api.DynamicsApi

## Load the API package
```dart
import 'package:lingdong_server/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createDynamicApiDynamicsCreateDynamicPost**](DynamicsApi.md#createdynamicapidynamicscreatedynamicpost) | **POST** /api/dynamics/create_dynamic | 创建广场动态
[**createParentCommentApiDynamicsPostsParentCommentsPost**](DynamicsApi.md#createparentcommentapidynamicspostsparentcommentspost) | **POST** /api/dynamics/posts/parent_comments | 创建顶级评论
[**createReplyApiDynamicsCommentsRepliesPost**](DynamicsApi.md#createreplyapidynamicscommentsrepliespost) | **POST** /api/dynamics/comments/replies | 创建回复
[**deleteDynamicApiDynamicsPostIdDeleteDynamicPost**](DynamicsApi.md#deletedynamicapidynamicspostiddeletedynamicpost) | **POST** /api/dynamics/{post_id}/delete_dynamic | 删除动态
[**deleteParentCommentApiDynamicsParentCommentsCommentIdDelete**](DynamicsApi.md#deleteparentcommentapidynamicsparentcommentscommentiddelete) | **DELETE** /api/dynamics/parent_comments/{comment_id} | 删除顶级评论
[**deleteReplyApiDynamicsRepliesReplyIdDeletePost**](DynamicsApi.md#deletereplyapidynamicsrepliesreplyiddeletepost) | **POST** /api/dynamics/replies/{reply_id}/delete | 删除回复
[**getCommentRepliesApiDynamicsCommentsParentCommentIdRepliesGet**](DynamicsApi.md#getcommentrepliesapidynamicscommentsparentcommentidrepliesget) | **GET** /api/dynamics/comments/{parent_comment_id}/replies | 获取顶级评论下的回复
[**getPostCommentsCountApiDynamicsPostsPostIdCommentsCountGet**](DynamicsApi.md#getpostcommentscountapidynamicspostspostidcommentscountget) | **GET** /api/dynamics/posts/{post_id}/comments/count | 获取帖子总评论数
[**getPostParentCommentsApiDynamicsPostsPostIdParentCommentsGet**](DynamicsApi.md#getpostparentcommentsapidynamicspostspostidparentcommentsget) | **GET** /api/dynamics/posts/{post_id}/parent_comments | 获取动态下的顶级评论
[**getPublicDynamicsApiDynamicsGetPublicDynamicsGet**](DynamicsApi.md#getpublicdynamicsapidynamicsgetpublicdynamicsget) | **GET** /api/dynamics/get_public_dynamics | 获取广场动态
[**getPublicDynamicsApiDynamicsGetPublicDynamicsPost**](DynamicsApi.md#getpublicdynamicsapidynamicsgetpublicdynamicspost) | **POST** /api/dynamics/get_public_dynamics | 获取广场动态
[**getRecommendedDynamicsApiDynamicsRecommendedPost**](DynamicsApi.md#getrecommendeddynamicsapidynamicsrecommendedpost) | **POST** /api/dynamics/recommended | 获取推荐动态
[**getUserFavoriteDynamicsApiDynamicsGetUserFavoriteDynamicsPost**](DynamicsApi.md#getuserfavoritedynamicsapidynamicsgetuserfavoritedynamicspost) | **POST** /api/dynamics/get_user_favorite_dynamics | 获取用户收藏的动态
[**getUserPostsApiDynamicsUsersUserIdPostsGet**](DynamicsApi.md#getuserpostsapidynamicsusersuseridpostsget) | **GET** /api/dynamics/users/{user_id}/posts | 获取指定用户的动态列表
[**likeDynamicApiDynamicsPostIdLikeDynamicPost**](DynamicsApi.md#likedynamicapidynamicspostidlikedynamicpost) | **POST** /api/dynamics/{post_id}/like_dynamic | 点赞动态
[**likeReplyApiDynamicsCommentsReplyIdLikePost**](DynamicsApi.md#likereplyapidynamicscommentsreplyidlikepost) | **POST** /api/dynamics/comments/{reply_id}/like | 回复点赞状态切换
[**shareDynamicApiDynamicsPostIdSharePost**](DynamicsApi.md#sharedynamicapidynamicspostidsharepost) | **POST** /api/dynamics/{post_id}/share | 分享动态
[**toggleDynamicFavoriteApiDynamicsPostIdFavoritePost**](DynamicsApi.md#toggledynamicfavoriteapidynamicspostidfavoritepost) | **POST** /api/dynamics/{post_id}/favorite | 切换动态收藏状态
[**toggleLikeApiDynamicsCommentsLikePost**](DynamicsApi.md#togglelikeapidynamicscommentslikepost) | **POST** /api/dynamics/comments/like | 统一评论/回复点赞状态切换
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

# **createParentCommentApiDynamicsPostsParentCommentsPost**
> GenericResponseParentComment createParentCommentApiDynamicsPostsParentCommentsPost(parentCommentCreate)

创建顶级评论

创建对指定动态的顶级评论

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final ParentCommentCreate parentCommentCreate = ; // ParentCommentCreate | 

try {
    final response = api.createParentCommentApiDynamicsPostsParentCommentsPost(parentCommentCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->createParentCommentApiDynamicsPostsParentCommentsPost: $e\n');
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

# **createReplyApiDynamicsCommentsRepliesPost**
> GenericResponseReply createReplyApiDynamicsCommentsRepliesPost(replyCreate)

创建回复

创建对指定评论的回复或回复其他回复

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final ReplyCreate replyCreate = {"content":"string","medias":[{"related_type":1,"related_id":0,"media_type":0,"url":"string","thumbnail_url":"string","description":"string","sort_order":0,"user_id":0}],"parent_comment_id":0,"reply_to_reply_id":0}; // ReplyCreate | 

try {
    final response = api.createReplyApiDynamicsCommentsRepliesPost(replyCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->createReplyApiDynamicsCommentsRepliesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
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

# **deleteReplyApiDynamicsRepliesReplyIdDeletePost**
> GenericResponseBool deleteReplyApiDynamicsRepliesReplyIdDeletePost(replyId)

删除回复

删除指定的回复

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int replyId = 0; // int | 

try {
    final response = api.deleteReplyApiDynamicsRepliesReplyIdDeletePost(replyId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->deleteReplyApiDynamicsRepliesReplyIdDeletePost: $e\n');
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

# **getCommentRepliesApiDynamicsCommentsParentCommentIdRepliesGet**
> GenericResponseDict getCommentRepliesApiDynamicsCommentsParentCommentIdRepliesGet(parentCommentId, skip, limit)

获取顶级评论下的回复

获取指定顶级评论下的回复，支持分页，返回平铺形式的回复数据（包含回复人和被回复人信息）

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int parentCommentId = 0; // int | 
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.getCommentRepliesApiDynamicsCommentsParentCommentIdRepliesGet(parentCommentId, skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->getCommentRepliesApiDynamicsCommentsParentCommentIdRepliesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **parentCommentId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 10]

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPostCommentsCountApiDynamicsPostsPostIdCommentsCountGet**
> GenericResponseDict getPostCommentsCountApiDynamicsPostsPostIdCommentsCountGet(postId)

获取帖子总评论数

获取指定帖子的总评论数，包括顶级评论和回复

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int postId = 0; // int | 

try {
    final response = api.getPostCommentsCountApiDynamicsPostsPostIdCommentsCountGet(postId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->getPostCommentsCountApiDynamicsPostsPostIdCommentsCountGet: $e\n');
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

# **getPostParentCommentsApiDynamicsPostsPostIdParentCommentsGet**
> GenericResponseDict getPostParentCommentsApiDynamicsPostsPostIdParentCommentsGet(postId, skip, limit, includeReplies)

获取动态下的顶级评论

获取指定动态下的顶级评论，默认不包含完整回复树以提高性能，返回回复数量

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int postId = 0; // int | 
final int skip = 56; // int | 
final int limit = 56; // int | 
final bool includeReplies = true; // bool | 

try {
    final response = api.getPostParentCommentsApiDynamicsPostsPostIdParentCommentsGet(postId, skip, limit, includeReplies);
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
 **includeReplies** | **bool**|  | [optional] [default to false]

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

# **getPublicDynamicsApiDynamicsGetPublicDynamicsPost**
> GenericResponsePostListResponse getPublicDynamicsApiDynamicsGetPublicDynamicsPost(tag, paginationParams)

获取广场动态



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final String tag = tag_example; // String | 
final PaginationParams paginationParams = ; // PaginationParams | 

try {
    final response = api.getPublicDynamicsApiDynamicsGetPublicDynamicsPost(tag, paginationParams);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->getPublicDynamicsApiDynamicsGetPublicDynamicsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tag** | **String**|  | [optional] 
 **paginationParams** | [**PaginationParams**](PaginationParams.md)|  | [optional] 

### Return type

[**GenericResponsePostListResponse**](GenericResponsePostListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRecommendedDynamicsApiDynamicsRecommendedPost**
> GenericResponsePostListResponse getRecommendedDynamicsApiDynamicsRecommendedPost(paginationParams)

获取推荐动态



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final PaginationParams paginationParams = {"skip":0,"limit":20}; // PaginationParams | 

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

# **getUserPostsApiDynamicsUsersUserIdPostsGet**
> GenericResponsePostListResponse getUserPostsApiDynamicsUsersUserIdPostsGet(userId, page, limit)

获取指定用户的动态列表

获取指定用户发布的动态列表（分页） :param user_id: 目标用户ID :param page: 页码，从0开始 :param limit: 每页数量，最大100 :param db: 数据库会话 :param current_user: 当前登录用户（可选） :return: 动态列表和总数

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int userId = 0; // int | 
final int page = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.getUserPostsApiDynamicsUsersUserIdPostsGet(userId, page, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->getUserPostsApiDynamicsUsersUserIdPostsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **page** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**GenericResponsePostListResponse**](GenericResponsePostListResponse.md)

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

# **likeReplyApiDynamicsCommentsReplyIdLikePost**
> GenericResponseDict likeReplyApiDynamicsCommentsReplyIdLikePost(replyId)

回复点赞状态切换

对指定回复进行点赞或取消点赞操作

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int replyId = 0; // int | 

try {
    final response = api.likeReplyApiDynamicsCommentsReplyIdLikePost(replyId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->likeReplyApiDynamicsCommentsReplyIdLikePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **replyId** | **int**|  | 

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

# **toggleLikeApiDynamicsCommentsLikePost**
> GenericResponseDict toggleLikeApiDynamicsCommentsLikePost(targetId, targetType)

统一评论/回复点赞状态切换

统一接口，支持对顶级评论或回复进行点赞或取消点赞操作

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDynamicsApi();
final int targetId = 56; // int | 
final String targetType = targetType_example; // String | 

try {
    final response = api.toggleLikeApiDynamicsCommentsLikePost(targetId, targetType);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DynamicsApi->toggleLikeApiDynamicsCommentsLikePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **targetId** | **int**|  | 
 **targetType** | **String**|  | [optional] 

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

