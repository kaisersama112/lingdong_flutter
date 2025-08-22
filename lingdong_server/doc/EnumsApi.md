# lingdong_server.api.EnumsApi

## Load the API package
```dart
import 'package:lingdong_server/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createNewBehaviorStyleApiEnumsBehaviorStylesPost**](EnumsApi.md#createnewbehaviorstyleapienumsbehaviorstylespost) | **POST** /api/enums/behavior_styles | 创建行为风格
[**createNewPersonalityApiEnumsPersonalitiesPost**](EnumsApi.md#createnewpersonalityapienumspersonalitiespost) | **POST** /api/enums/personalities | 创建性格特征
[**createNewTaskTypeApiEnumsTaskTypesPost**](EnumsApi.md#createnewtasktypeapienumstasktypespost) | **POST** /api/enums/task_types | 创建任务类型
[**readBehaviorStyleApiEnumsBehaviorStylesBehaviorStyleIdGet**](EnumsApi.md#readbehaviorstyleapienumsbehaviorstylesbehaviorstyleidget) | **GET** /api/enums/behavior_styles/{behavior_style_id} | 获取单个行为风格
[**readBehaviorStylesApiEnumsBehaviorStylesGet**](EnumsApi.md#readbehaviorstylesapienumsbehaviorstylesget) | **GET** /api/enums/behavior_styles | 分页获取所有行为风格
[**readPersonalitiesApiEnumsPersonalitiesGet**](EnumsApi.md#readpersonalitiesapienumspersonalitiesget) | **GET** /api/enums/personalities | 分页获取所有性格特征
[**readPersonalityApiEnumsPersonalitiesPersonalityIdGet**](EnumsApi.md#readpersonalityapienumspersonalitiespersonalityidget) | **GET** /api/enums/personalities/{personality_id} | 获取单个性格特征
[**readTaskTypeApiEnumsTaskTypesTaskTypeIdGet**](EnumsApi.md#readtasktypeapienumstasktypestasktypeidget) | **GET** /api/enums/task_types/{task_type_id} | 获取单个任务类型
[**readTaskTypesApiEnumsTaskTypesGet**](EnumsApi.md#readtasktypesapienumstasktypesget) | **GET** /api/enums/task_types | 分页获取所有任务类型


# **createNewBehaviorStyleApiEnumsBehaviorStylesPost**
> GenericResponseBehaviorStyleResponse createNewBehaviorStyleApiEnumsBehaviorStylesPost(behaviorStyleCreate)

创建行为风格

创建新的行为风格 :param behavior_style: 行为风格创建模型 :param db: 数据库会话 :param user: 当前用户 :return: 行为风格信息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getEnumsApi();
final BehaviorStyleCreate behaviorStyleCreate = ; // BehaviorStyleCreate | 

try {
    final response = api.createNewBehaviorStyleApiEnumsBehaviorStylesPost(behaviorStyleCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EnumsApi->createNewBehaviorStyleApiEnumsBehaviorStylesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **behaviorStyleCreate** | [**BehaviorStyleCreate**](BehaviorStyleCreate.md)|  | [optional] 

### Return type

[**GenericResponseBehaviorStyleResponse**](GenericResponseBehaviorStyleResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createNewPersonalityApiEnumsPersonalitiesPost**
> GenericResponsePersonalityResponse createNewPersonalityApiEnumsPersonalitiesPost(personalityCreate)

创建性格特征

创建新的性格特征 :param personality: 性格特征创建模型 :param db: 数据库会话 :param user: 当前用户 :return: 性格特征信息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getEnumsApi();
final PersonalityCreate personalityCreate = ; // PersonalityCreate | 

try {
    final response = api.createNewPersonalityApiEnumsPersonalitiesPost(personalityCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EnumsApi->createNewPersonalityApiEnumsPersonalitiesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **personalityCreate** | [**PersonalityCreate**](PersonalityCreate.md)|  | [optional] 

### Return type

[**GenericResponsePersonalityResponse**](GenericResponsePersonalityResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createNewTaskTypeApiEnumsTaskTypesPost**
> GenericResponseTaskTypeResponse createNewTaskTypeApiEnumsTaskTypesPost(taskTypeCreate)

创建任务类型

创建新的任务类型 :param task_type: 任务类型创建模型 :param db: 数据库会话 :param user: 当前用户 :return: 任务类型信息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getEnumsApi();
final TaskTypeCreate taskTypeCreate = ; // TaskTypeCreate | 

try {
    final response = api.createNewTaskTypeApiEnumsTaskTypesPost(taskTypeCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EnumsApi->createNewTaskTypeApiEnumsTaskTypesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **taskTypeCreate** | [**TaskTypeCreate**](TaskTypeCreate.md)|  | [optional] 

### Return type

[**GenericResponseTaskTypeResponse**](GenericResponseTaskTypeResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readBehaviorStyleApiEnumsBehaviorStylesBehaviorStyleIdGet**
> GenericResponseBehaviorStyleResponse readBehaviorStyleApiEnumsBehaviorStylesBehaviorStyleIdGet(behaviorStyleId)

获取单个行为风格

根据 ID 获取行为风格 :param behavior_style_id: 行为风格ID :param db: 数据库会话 :return: 行为风格信息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getEnumsApi();
final int behaviorStyleId = 0; // int | 

try {
    final response = api.readBehaviorStyleApiEnumsBehaviorStylesBehaviorStyleIdGet(behaviorStyleId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EnumsApi->readBehaviorStyleApiEnumsBehaviorStylesBehaviorStyleIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **behaviorStyleId** | **int**|  | 

### Return type

[**GenericResponseBehaviorStyleResponse**](GenericResponseBehaviorStyleResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readBehaviorStylesApiEnumsBehaviorStylesGet**
> GenericResponseListBehaviorStyleResponse readBehaviorStylesApiEnumsBehaviorStylesGet(page, pageSize)

分页获取所有行为风格

分页获取所有行为风格 :param page: 页码 :param page_size: 每页数量 :param db: 数据库会话 :return: 行为风格列表

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getEnumsApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.readBehaviorStylesApiEnumsBehaviorStylesGet(page, pageSize);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EnumsApi->readBehaviorStylesApiEnumsBehaviorStylesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 10]

### Return type

[**GenericResponseListBehaviorStyleResponse**](GenericResponseListBehaviorStyleResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readPersonalitiesApiEnumsPersonalitiesGet**
> GenericResponseListPersonalityResponse readPersonalitiesApiEnumsPersonalitiesGet(page, pageSize)

分页获取所有性格特征

分页获取所有性格特征 :param page: 页码 :param page_size: 每页数量 :param db: 数据库会话 :return: 性格特征列表

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getEnumsApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.readPersonalitiesApiEnumsPersonalitiesGet(page, pageSize);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EnumsApi->readPersonalitiesApiEnumsPersonalitiesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 10]

### Return type

[**GenericResponseListPersonalityResponse**](GenericResponseListPersonalityResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readPersonalityApiEnumsPersonalitiesPersonalityIdGet**
> GenericResponsePersonalityResponse readPersonalityApiEnumsPersonalitiesPersonalityIdGet(personalityId)

获取单个性格特征

根据 ID 获取性格特征 :param personality_id: 性格特征ID :param db: 数据库会话 :return: 性格特征信息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getEnumsApi();
final int personalityId = 0; // int | 

try {
    final response = api.readPersonalityApiEnumsPersonalitiesPersonalityIdGet(personalityId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EnumsApi->readPersonalityApiEnumsPersonalitiesPersonalityIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **personalityId** | **int**|  | 

### Return type

[**GenericResponsePersonalityResponse**](GenericResponsePersonalityResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readTaskTypeApiEnumsTaskTypesTaskTypeIdGet**
> GenericResponseTaskTypeResponse readTaskTypeApiEnumsTaskTypesTaskTypeIdGet(taskTypeId)

获取单个任务类型

根据 ID 获取任务类型 :param task_type_id: 任务类型ID :param db: 数据库会话 :return: 任务类型信息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getEnumsApi();
final int taskTypeId = 0; // int | 

try {
    final response = api.readTaskTypeApiEnumsTaskTypesTaskTypeIdGet(taskTypeId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EnumsApi->readTaskTypeApiEnumsTaskTypesTaskTypeIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **taskTypeId** | **int**|  | 

### Return type

[**GenericResponseTaskTypeResponse**](GenericResponseTaskTypeResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readTaskTypesApiEnumsTaskTypesGet**
> GenericResponseListTaskTypeResponse readTaskTypesApiEnumsTaskTypesGet(page, pageSize)

分页获取所有任务类型

分页获取所有任务类型 :param page: 页码 :param page_size: 每页数量 :param db: 数据库会话 :return: 任务类型列表

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getEnumsApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.readTaskTypesApiEnumsTaskTypesGet(page, pageSize);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EnumsApi->readTaskTypesApiEnumsTaskTypesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 10]

### Return type

[**GenericResponseListTaskTypeResponse**](GenericResponseListTaskTypeResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

