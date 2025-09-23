# lingdong_server.api.ChatApi

## Load the API package
```dart
import 'package:lingdong_server/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addConversationMessageApiChatConversationMessageAddPost**](ChatApi.md#addconversationmessageapichatconversationmessageaddpost) | **POST** /api/chat/conversation/message/add | 向会话中添加消息
[**addConversationMessageApiChatConversationMessageAddPost_0**](ChatApi.md#addconversationmessageapichatconversationmessageaddpost_0) | **POST** /api/chat/conversation/message/add | 向会话中添加消息
[**createConversationApiChatConversationCreatePost**](ChatApi.md#createconversationapichatconversationcreatepost) | **POST** /api/chat/conversation/create | 创建新会话
[**createConversationApiChatConversationCreatePost_0**](ChatApi.md#createconversationapichatconversationcreatepost_0) | **POST** /api/chat/conversation/create | 创建新会话
[**createGroupConversationApiChatGroupCreatePost**](ChatApi.md#creategroupconversationapichatgroupcreatepost) | **POST** /api/chat/group/create | 创建群聊
[**createGroupConversationApiChatGroupCreatePost_0**](ChatApi.md#creategroupconversationapichatgroupcreatepost_0) | **POST** /api/chat/group/create | 创建群聊
[**getConversationBySessionIdApiChatConversationSessionIdGet**](ChatApi.md#getconversationbysessionidapichatconversationsessionidget) | **GET** /api/chat/conversation/{session_id} | 根据会话ID获取会话信息
[**getConversationBySessionIdApiChatConversationSessionIdGet_0**](ChatApi.md#getconversationbysessionidapichatconversationsessionidget_0) | **GET** /api/chat/conversation/{session_id} | 根据会话ID获取会话信息
[**getConversationMessagesApiChatConversationMessagesSessionIdGet**](ChatApi.md#getconversationmessagesapichatconversationmessagessessionidget) | **GET** /api/chat/conversation/messages/{session_id} | 获取会话中的所有消息
[**getConversationMessagesApiChatConversationMessagesSessionIdGet_0**](ChatApi.md#getconversationmessagesapichatconversationmessagessessionidget_0) | **GET** /api/chat/conversation/messages/{session_id} | 获取会话中的所有消息
[**getGroupMembersApiChatGroupMembersGroupIdGet**](ChatApi.md#getgroupmembersapichatgroupmembersgroupidget) | **GET** /api/chat/group/members/{group_id} | 获取群成员列表
[**getGroupMembersApiChatGroupMembersGroupIdGet_0**](ChatApi.md#getgroupmembersapichatgroupmembersgroupidget_0) | **GET** /api/chat/group/members/{group_id} | 获取群成员列表
[**getGroupMessagesApiChatGroupMessagesGroupIdGet**](ChatApi.md#getgroupmessagesapichatgroupmessagesgroupidget) | **GET** /api/chat/group/messages/{group_id} | 获取群消息记录
[**getGroupMessagesApiChatGroupMessagesGroupIdGet_0**](ChatApi.md#getgroupmessagesapichatgroupmessagesgroupidget_0) | **GET** /api/chat/group/messages/{group_id} | 获取群消息记录
[**getUserConversationsApiChatConversationsGet**](ChatApi.md#getuserconversationsapichatconversationsget) | **GET** /api/chat/conversations | 获取用户的所有会话列表
[**getUserConversationsApiChatConversationsGet_0**](ChatApi.md#getuserconversationsapichatconversationsget_0) | **GET** /api/chat/conversations | 获取用户的所有会话列表
[**sendGroupMessageApiChatGroupSendPost**](ChatApi.md#sendgroupmessageapichatgroupsendpost) | **POST** /api/chat/group/send | 发送群消息
[**sendGroupMessageApiChatGroupSendPost_0**](ChatApi.md#sendgroupmessageapichatgroupsendpost_0) | **POST** /api/chat/group/send | 发送群消息


# **addConversationMessageApiChatConversationMessageAddPost**
> GenericResponseConversationMessageResponse addConversationMessageApiChatConversationMessageAddPost(addMessageToConversation)

向会话中添加消息

向会话中添加消息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();
final AddMessageToConversation addMessageToConversation = ; // AddMessageToConversation | 

try {
    final response = api.addConversationMessageApiChatConversationMessageAddPost(addMessageToConversation);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->addConversationMessageApiChatConversationMessageAddPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addMessageToConversation** | [**AddMessageToConversation**](AddMessageToConversation.md)|  | [optional] 

### Return type

[**GenericResponseConversationMessageResponse**](GenericResponseConversationMessageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **addConversationMessageApiChatConversationMessageAddPost_0**
> GenericResponseConversationMessageResponse addConversationMessageApiChatConversationMessageAddPost_0(addMessageToConversation)

向会话中添加消息

向会话中添加消息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();
final AddMessageToConversation addMessageToConversation = ; // AddMessageToConversation | 

try {
    final response = api.addConversationMessageApiChatConversationMessageAddPost_0(addMessageToConversation);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->addConversationMessageApiChatConversationMessageAddPost_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addMessageToConversation** | [**AddMessageToConversation**](AddMessageToConversation.md)|  | [optional] 

### Return type

[**GenericResponseConversationMessageResponse**](GenericResponseConversationMessageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createConversationApiChatConversationCreatePost**
> GenericResponseConversationResponse createConversationApiChatConversationCreatePost(conversationCreate)

创建新会话

创建新会话

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();
final ConversationCreate conversationCreate = ; // ConversationCreate | 

try {
    final response = api.createConversationApiChatConversationCreatePost(conversationCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->createConversationApiChatConversationCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **conversationCreate** | [**ConversationCreate**](ConversationCreate.md)|  | [optional] 

### Return type

[**GenericResponseConversationResponse**](GenericResponseConversationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createConversationApiChatConversationCreatePost_0**
> GenericResponseConversationResponse createConversationApiChatConversationCreatePost_0(conversationCreate)

创建新会话

创建新会话

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();
final ConversationCreate conversationCreate = ; // ConversationCreate | 

try {
    final response = api.createConversationApiChatConversationCreatePost_0(conversationCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->createConversationApiChatConversationCreatePost_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **conversationCreate** | [**ConversationCreate**](ConversationCreate.md)|  | [optional] 

### Return type

[**GenericResponseConversationResponse**](GenericResponseConversationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createGroupConversationApiChatGroupCreatePost**
> GenericResponseGroupConversationResponse createGroupConversationApiChatGroupCreatePost(groupConversationCreate)

创建群聊

创建群聊

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();
final GroupConversationCreate groupConversationCreate = ; // GroupConversationCreate | 

try {
    final response = api.createGroupConversationApiChatGroupCreatePost(groupConversationCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->createGroupConversationApiChatGroupCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **groupConversationCreate** | [**GroupConversationCreate**](GroupConversationCreate.md)|  | [optional] 

### Return type

[**GenericResponseGroupConversationResponse**](GenericResponseGroupConversationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createGroupConversationApiChatGroupCreatePost_0**
> GenericResponseGroupConversationResponse createGroupConversationApiChatGroupCreatePost_0(groupConversationCreate)

创建群聊

创建群聊

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();
final GroupConversationCreate groupConversationCreate = ; // GroupConversationCreate | 

try {
    final response = api.createGroupConversationApiChatGroupCreatePost_0(groupConversationCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->createGroupConversationApiChatGroupCreatePost_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **groupConversationCreate** | [**GroupConversationCreate**](GroupConversationCreate.md)|  | [optional] 

### Return type

[**GenericResponseGroupConversationResponse**](GenericResponseGroupConversationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getConversationBySessionIdApiChatConversationSessionIdGet**
> GenericResponseConversationResponse getConversationBySessionIdApiChatConversationSessionIdGet(sessionId)

根据会话ID获取会话信息

根据会话ID获取会话信息 - session_id: 会话唯一标识

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();
final String sessionId = ; // String | 

try {
    final response = api.getConversationBySessionIdApiChatConversationSessionIdGet(sessionId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->getConversationBySessionIdApiChatConversationSessionIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**|  | 

### Return type

[**GenericResponseConversationResponse**](GenericResponseConversationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getConversationBySessionIdApiChatConversationSessionIdGet_0**
> GenericResponseConversationResponse getConversationBySessionIdApiChatConversationSessionIdGet_0(sessionId)

根据会话ID获取会话信息

根据会话ID获取会话信息 - session_id: 会话唯一标识

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();
final String sessionId = ; // String | 

try {
    final response = api.getConversationBySessionIdApiChatConversationSessionIdGet_0(sessionId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->getConversationBySessionIdApiChatConversationSessionIdGet_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**|  | 

### Return type

[**GenericResponseConversationResponse**](GenericResponseConversationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getConversationMessagesApiChatConversationMessagesSessionIdGet**
> GenericResponseListConversationMessageResponse getConversationMessagesApiChatConversationMessagesSessionIdGet(sessionId)

获取会话中的所有消息

获取会话中的所有消息 - session_id: 会话唯一标识

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();
final String sessionId = ; // String | 

try {
    final response = api.getConversationMessagesApiChatConversationMessagesSessionIdGet(sessionId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->getConversationMessagesApiChatConversationMessagesSessionIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**|  | 

### Return type

[**GenericResponseListConversationMessageResponse**](GenericResponseListConversationMessageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getConversationMessagesApiChatConversationMessagesSessionIdGet_0**
> GenericResponseListConversationMessageResponse getConversationMessagesApiChatConversationMessagesSessionIdGet_0(sessionId)

获取会话中的所有消息

获取会话中的所有消息 - session_id: 会话唯一标识

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();
final String sessionId = ; // String | 

try {
    final response = api.getConversationMessagesApiChatConversationMessagesSessionIdGet_0(sessionId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->getConversationMessagesApiChatConversationMessagesSessionIdGet_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**|  | 

### Return type

[**GenericResponseListConversationMessageResponse**](GenericResponseListConversationMessageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGroupMembersApiChatGroupMembersGroupIdGet**
> GenericResponseListGroupMemberResponse getGroupMembersApiChatGroupMembersGroupIdGet(groupId)

获取群成员列表

获取群成员列表 - group_id: 群聊ID

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();
final int groupId = 0; // int | 

try {
    final response = api.getGroupMembersApiChatGroupMembersGroupIdGet(groupId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->getGroupMembersApiChatGroupMembersGroupIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **groupId** | **int**|  | 

### Return type

[**GenericResponseListGroupMemberResponse**](GenericResponseListGroupMemberResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGroupMembersApiChatGroupMembersGroupIdGet_0**
> GenericResponseListGroupMemberResponse getGroupMembersApiChatGroupMembersGroupIdGet_0(groupId)

获取群成员列表

获取群成员列表 - group_id: 群聊ID

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();
final int groupId = 0; // int | 

try {
    final response = api.getGroupMembersApiChatGroupMembersGroupIdGet_0(groupId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->getGroupMembersApiChatGroupMembersGroupIdGet_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **groupId** | **int**|  | 

### Return type

[**GenericResponseListGroupMemberResponse**](GenericResponseListGroupMemberResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGroupMessagesApiChatGroupMessagesGroupIdGet**
> GenericResponseListGroupMessageResponse getGroupMessagesApiChatGroupMessagesGroupIdGet(groupId, skip, limit)

获取群消息记录

获取群消息记录 - group_id: 群聊ID - skip: 跳过的记录数，默认为0 - limit: 返回的记录数，默认为50

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();
final int groupId = 0; // int | 
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.getGroupMessagesApiChatGroupMessagesGroupIdGet(groupId, skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->getGroupMessagesApiChatGroupMessagesGroupIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **groupId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 50]

### Return type

[**GenericResponseListGroupMessageResponse**](GenericResponseListGroupMessageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGroupMessagesApiChatGroupMessagesGroupIdGet_0**
> GenericResponseListGroupMessageResponse getGroupMessagesApiChatGroupMessagesGroupIdGet_0(groupId, skip, limit)

获取群消息记录

获取群消息记录 - group_id: 群聊ID - skip: 跳过的记录数，默认为0 - limit: 返回的记录数，默认为50

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();
final int groupId = 0; // int | 
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.getGroupMessagesApiChatGroupMessagesGroupIdGet_0(groupId, skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->getGroupMessagesApiChatGroupMessagesGroupIdGet_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **groupId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 50]

### Return type

[**GenericResponseListGroupMessageResponse**](GenericResponseListGroupMessageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserConversationsApiChatConversationsGet**
> GenericResponseListConversationListItem getUserConversationsApiChatConversationsGet()

获取用户的所有会话列表

获取用户的所有会话列表（包括单聊和群聊）

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();

try {
    final response = api.getUserConversationsApiChatConversationsGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->getUserConversationsApiChatConversationsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GenericResponseListConversationListItem**](GenericResponseListConversationListItem.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserConversationsApiChatConversationsGet_0**
> GenericResponseListConversationListItem getUserConversationsApiChatConversationsGet_0()

获取用户的所有会话列表

获取用户的所有会话列表（包括单聊和群聊）

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();

try {
    final response = api.getUserConversationsApiChatConversationsGet_0();
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->getUserConversationsApiChatConversationsGet_0: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GenericResponseListConversationListItem**](GenericResponseListConversationListItem.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendGroupMessageApiChatGroupSendPost**
> GenericResponseGroupMessageResponse sendGroupMessageApiChatGroupSendPost(groupMessageCreate)

发送群消息

发送群消息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();
final GroupMessageCreate groupMessageCreate = ; // GroupMessageCreate | 

try {
    final response = api.sendGroupMessageApiChatGroupSendPost(groupMessageCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->sendGroupMessageApiChatGroupSendPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **groupMessageCreate** | [**GroupMessageCreate**](GroupMessageCreate.md)|  | [optional] 

### Return type

[**GenericResponseGroupMessageResponse**](GenericResponseGroupMessageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendGroupMessageApiChatGroupSendPost_0**
> GenericResponseGroupMessageResponse sendGroupMessageApiChatGroupSendPost_0(groupMessageCreate)

发送群消息

发送群消息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getChatApi();
final GroupMessageCreate groupMessageCreate = ; // GroupMessageCreate | 

try {
    final response = api.sendGroupMessageApiChatGroupSendPost_0(groupMessageCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->sendGroupMessageApiChatGroupSendPost_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **groupMessageCreate** | [**GroupMessageCreate**](GroupMessageCreate.md)|  | [optional] 

### Return type

[**GenericResponseGroupMessageResponse**](GenericResponseGroupMessageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

