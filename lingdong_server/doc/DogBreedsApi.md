# lingdong_server.api.DogBreedsApi

## Load the API package
```dart
import 'package:lingdong_server/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createBreedApiBreedReedsCreateBreedPost**](DogBreedsApi.md#createbreedapibreedreedscreatebreedpost) | **POST** /api/breed/reeds/create_breed | 创建种类
[**createGuideApiBreedBehaviorGuidesCreateBehaviorGuidePost**](DogBreedsApi.md#createguideapibreedbehaviorguidescreatebehaviorguidepost) | **POST** /api/breed/behavior_guides/create_behavior_guide | 创建行为指南
[**createGuideApiBreedCareGuidesCreateDogCareGuidePost**](DogBreedsApi.md#createguideapibreedcareguidescreatedogcareguidepost) | **POST** /api/breed/care_guides/create_dog_care_guide | 创建护理指南
[**createGuideApiBreedTrainingGuidesCreateTrainingGuidePost**](DogBreedsApi.md#createguideapibreedtrainingguidescreatetrainingguidepost) | **POST** /api/breed/training_guides/create_training_guide | 创建训练指南
[**createStageApiBreedAgeStagesPost**](DogBreedsApi.md#createstageapibreedagestagespost) | **POST** /api/breed/age_stages/ | 创建年龄阶段
[**deleteBreedApiBreedReedsDeleteBreedPost**](DogBreedsApi.md#deletebreedapibreedreedsdeletebreedpost) | **POST** /api/breed/reeds/delete_breed | 删除种类
[**deleteGuideApiBreedBehaviorGuidesDeleteBehaviorGuidePost**](DogBreedsApi.md#deleteguideapibreedbehaviorguidesdeletebehaviorguidepost) | **POST** /api/breed/behavior_guides/delete_behavior_guide | 删除行为指南
[**deleteGuideApiBreedCareGuidesDeleteCareGuidePost**](DogBreedsApi.md#deleteguideapibreedcareguidesdeletecareguidepost) | **POST** /api/breed/care_guides/delete_care_guide | 删除护理指南
[**deleteGuideApiBreedTrainingGuidesDeleteTrainingGuideGuideIdPost**](DogBreedsApi.md#deleteguideapibreedtrainingguidesdeletetrainingguideguideidpost) | **POST** /api/breed/training_guides/delete_training_guide/{guide_id} | 删除训练指南
[**deleteStageApiBreedAgeStagesDeleteAgeStagePost**](DogBreedsApi.md#deletestageapibreedagestagesdeleteagestagepost) | **POST** /api/breed/age_stages/delete_age_stage | 删除年龄阶段
[**readBreedApiBreedReedsGetBreedDetailGet**](DogBreedsApi.md#readbreedapibreedreedsgetbreeddetailget) | **GET** /api/breed/reeds/get_breed_detail | 获取种类详情
[**readBreedsApiBreedReedsGetBreedsGet**](DogBreedsApi.md#readbreedsapibreedreedsgetbreedsget) | **GET** /api/breed/reeds/get_breeds | 获取种类列表
[**readBreedsCountApiBreedReedsGetBreedsCountGet**](DogBreedsApi.md#readbreedscountapibreedreedsgetbreedscountget) | **GET** /api/breed/reeds/get_breeds_count | 获取种类数量
[**readGuideApiBreedBehaviorGuidesGetBehaviorGuideDetailGet**](DogBreedsApi.md#readguideapibreedbehaviorguidesgetbehaviorguidedetailget) | **GET** /api/breed/behavior_guides/get_behavior_guide_detail | 获取行为指南详情
[**readGuideApiBreedCareGuidesGetCareGuideGet**](DogBreedsApi.md#readguideapibreedcareguidesgetcareguideget) | **GET** /api/breed/care_guides/get_care_guide | 获取护理指南详情
[**readGuideApiBreedTrainingGuidesGetTrainingGuideGuideIdGet**](DogBreedsApi.md#readguideapibreedtrainingguidesgettrainingguideguideidget) | **GET** /api/breed/training_guides/get_training_guide/{guide_id} | 获取训练指南详情
[**readGuidesApiBreedBehaviorGuidesGetBehaviorGuidesGet**](DogBreedsApi.md#readguidesapibreedbehaviorguidesgetbehaviorguidesget) | **GET** /api/breed/behavior_guides/get_behavior_guides | 获取行为指南列表
[**readGuidesApiBreedCareGuidesGetDogCareGuidesGet**](DogBreedsApi.md#readguidesapibreedcareguidesgetdogcareguidesget) | **GET** /api/breed/care_guides/get_dog_care_guides | 获取护理指南列表(分页)
[**readGuidesApiBreedTrainingGuidesGet**](DogBreedsApi.md#readguidesapibreedtrainingguidesget) | **GET** /api/breed/training_guides/ | Read Guides
[**readGuidesCountApiBreedTrainingGuidesGetTrainingGuidesCountGet**](DogBreedsApi.md#readguidescountapibreedtrainingguidesgettrainingguidescountget) | **GET** /api/breed/training_guides/get_training_guides_count/ | 获取训练指南数量
[**readStageApiBreedAgeStagesGetAgeStageGet**](DogBreedsApi.md#readstageapibreedagestagesgetagestageget) | **GET** /api/breed/age_stages/get_age_stage | 获取年龄阶段详情
[**readStagesApiBreedAgeStagesGetAgeStagesGet**](DogBreedsApi.md#readstagesapibreedagestagesgetagestagesget) | **GET** /api/breed/age_stages/get_age_stages | 获取年龄阶段列表
[**readStagesCountApiBreedAgeStagesAgeStagesCountGet**](DogBreedsApi.md#readstagescountapibreedagestagesagestagescountget) | **GET** /api/breed/age_stages/age_stages_count | 获取年龄阶段总数
[**updateBreedApiBreedReedsUpdateBreedPost**](DogBreedsApi.md#updatebreedapibreedreedsupdatebreedpost) | **POST** /api/breed/reeds/update_breed | 更新种类
[**updateGuideApiBreedBehaviorGuidesUpdateBehaviorGuidePost**](DogBreedsApi.md#updateguideapibreedbehaviorguidesupdatebehaviorguidepost) | **POST** /api/breed/behavior_guides/update_behavior_guide | 更新行为指南
[**updateGuideApiBreedCareGuidesUpdateCareGuidePost**](DogBreedsApi.md#updateguideapibreedcareguidesupdatecareguidepost) | **POST** /api/breed/care_guides/update_care_guide | 更新护理指南
[**updateGuideApiBreedTrainingGuidesUpdateTrainingGuideGuideIdPost**](DogBreedsApi.md#updateguideapibreedtrainingguidesupdatetrainingguideguideidpost) | **POST** /api/breed/training_guides/update_training_guide/{guide_id} | 更新训练指南
[**updateStageApiBreedAgeStagesUpdateAgeStagePost**](DogBreedsApi.md#updatestageapibreedagestagesupdateagestagepost) | **POST** /api/breed/age_stages/update_age_stage | 更新年龄阶段


# **createBreedApiBreedReedsCreateBreedPost**
> GenericResponseDogBreedOut createBreedApiBreedReedsCreateBreedPost(dogBreedCreate)

创建种类

创建种类  - **name**: 品种名称 - **english_name**: 品种英文名称 - **origin**: 品种产地(可选) - **group**: 犬种分组(可选) - **size**: 体型(可选) - **lifespan**: 寿命(可选) - **temperament**: 性格特征(可选) - **appearance**: 外貌特征(可选) - **care_level**: 饲养难度(1-5，可选) - **activity_level**: 活动量(1-5，可选) - **popularity**: 受欢迎程度(可选) - **is_popular**: 是否热门品种(可选) - **media**: 媒体资源ID列表(可选)

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final DogBreedCreate dogBreedCreate = ; // DogBreedCreate | 

try {
    final response = api.createBreedApiBreedReedsCreateBreedPost(dogBreedCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->createBreedApiBreedReedsCreateBreedPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dogBreedCreate** | [**DogBreedCreate**](DogBreedCreate.md)|  | [optional] 

### Return type

[**GenericResponseDogBreedOut**](GenericResponseDogBreedOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createGuideApiBreedBehaviorGuidesCreateBehaviorGuidePost**
> GenericResponseDogBehaviorGuideOut createGuideApiBreedBehaviorGuidesCreateBehaviorGuidePost(dogBehaviorGuideCreate)

创建行为指南



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final DogBehaviorGuideCreate dogBehaviorGuideCreate = ; // DogBehaviorGuideCreate | 

try {
    final response = api.createGuideApiBreedBehaviorGuidesCreateBehaviorGuidePost(dogBehaviorGuideCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->createGuideApiBreedBehaviorGuidesCreateBehaviorGuidePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dogBehaviorGuideCreate** | [**DogBehaviorGuideCreate**](DogBehaviorGuideCreate.md)|  | [optional] 

### Return type

[**GenericResponseDogBehaviorGuideOut**](GenericResponseDogBehaviorGuideOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createGuideApiBreedCareGuidesCreateDogCareGuidePost**
> GenericResponseDogCareGuideOut createGuideApiBreedCareGuidesCreateDogCareGuidePost(dogCareGuideCreate)

创建护理指南



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final DogCareGuideCreate dogCareGuideCreate = ; // DogCareGuideCreate | 

try {
    final response = api.createGuideApiBreedCareGuidesCreateDogCareGuidePost(dogCareGuideCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->createGuideApiBreedCareGuidesCreateDogCareGuidePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dogCareGuideCreate** | [**DogCareGuideCreate**](DogCareGuideCreate.md)|  | [optional] 

### Return type

[**GenericResponseDogCareGuideOut**](GenericResponseDogCareGuideOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createGuideApiBreedTrainingGuidesCreateTrainingGuidePost**
> DogTrainingGuideOut createGuideApiBreedTrainingGuidesCreateTrainingGuidePost(dogTrainingGuideCreate)

创建训练指南



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final DogTrainingGuideCreate dogTrainingGuideCreate = ; // DogTrainingGuideCreate | 

try {
    final response = api.createGuideApiBreedTrainingGuidesCreateTrainingGuidePost(dogTrainingGuideCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->createGuideApiBreedTrainingGuidesCreateTrainingGuidePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dogTrainingGuideCreate** | [**DogTrainingGuideCreate**](DogTrainingGuideCreate.md)|  | [optional] 

### Return type

[**DogTrainingGuideOut**](DogTrainingGuideOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createStageApiBreedAgeStagesPost**
> GenericResponseDogAgeStageOut createStageApiBreedAgeStagesPost(dogAgeStageCreate)

创建年龄阶段



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final DogAgeStageCreate dogAgeStageCreate = ; // DogAgeStageCreate | 

try {
    final response = api.createStageApiBreedAgeStagesPost(dogAgeStageCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->createStageApiBreedAgeStagesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dogAgeStageCreate** | [**DogAgeStageCreate**](DogAgeStageCreate.md)|  | [optional] 

### Return type

[**GenericResponseDogAgeStageOut**](GenericResponseDogAgeStageOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteBreedApiBreedReedsDeleteBreedPost**
> GenericResponseDogBreedOut deleteBreedApiBreedReedsDeleteBreedPost(dogBreedDelete)

删除种类



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final DogBreedDelete dogBreedDelete = ; // DogBreedDelete | 

try {
    final response = api.deleteBreedApiBreedReedsDeleteBreedPost(dogBreedDelete);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->deleteBreedApiBreedReedsDeleteBreedPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dogBreedDelete** | [**DogBreedDelete**](DogBreedDelete.md)|  | [optional] 

### Return type

[**GenericResponseDogBreedOut**](GenericResponseDogBreedOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteGuideApiBreedBehaviorGuidesDeleteBehaviorGuidePost**
> GenericResponseDogBehaviorGuideOut deleteGuideApiBreedBehaviorGuidesDeleteBehaviorGuidePost(dogBehaviorGuideBase)

删除行为指南



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final DogBehaviorGuideBase dogBehaviorGuideBase = ; // DogBehaviorGuideBase | 

try {
    final response = api.deleteGuideApiBreedBehaviorGuidesDeleteBehaviorGuidePost(dogBehaviorGuideBase);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->deleteGuideApiBreedBehaviorGuidesDeleteBehaviorGuidePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dogBehaviorGuideBase** | [**DogBehaviorGuideBase**](DogBehaviorGuideBase.md)|  | [optional] 

### Return type

[**GenericResponseDogBehaviorGuideOut**](GenericResponseDogBehaviorGuideOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteGuideApiBreedCareGuidesDeleteCareGuidePost**
> GenericResponseDogCareGuideOut deleteGuideApiBreedCareGuidesDeleteCareGuidePost(dogCareGuideBase)

删除护理指南



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final DogCareGuideBase dogCareGuideBase = ; // DogCareGuideBase | 

try {
    final response = api.deleteGuideApiBreedCareGuidesDeleteCareGuidePost(dogCareGuideBase);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->deleteGuideApiBreedCareGuidesDeleteCareGuidePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dogCareGuideBase** | [**DogCareGuideBase**](DogCareGuideBase.md)|  | [optional] 

### Return type

[**GenericResponseDogCareGuideOut**](GenericResponseDogCareGuideOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteGuideApiBreedTrainingGuidesDeleteTrainingGuideGuideIdPost**
> DogTrainingGuideOut deleteGuideApiBreedTrainingGuidesDeleteTrainingGuideGuideIdPost(guideId)

删除训练指南



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final int guideId = 0; // int | 

try {
    final response = api.deleteGuideApiBreedTrainingGuidesDeleteTrainingGuideGuideIdPost(guideId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->deleteGuideApiBreedTrainingGuidesDeleteTrainingGuideGuideIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guideId** | **int**|  | 

### Return type

[**DogTrainingGuideOut**](DogTrainingGuideOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteStageApiBreedAgeStagesDeleteAgeStagePost**
> GenericResponseDogAgeStageOut deleteStageApiBreedAgeStagesDeleteAgeStagePost(dogAgeStageBase)

删除年龄阶段



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final DogAgeStageBase dogAgeStageBase = ; // DogAgeStageBase | 

try {
    final response = api.deleteStageApiBreedAgeStagesDeleteAgeStagePost(dogAgeStageBase);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->deleteStageApiBreedAgeStagesDeleteAgeStagePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dogAgeStageBase** | [**DogAgeStageBase**](DogAgeStageBase.md)|  | [optional] 

### Return type

[**GenericResponseDogAgeStageOut**](GenericResponseDogAgeStageOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readBreedApiBreedReedsGetBreedDetailGet**
> GenericResponseDogBreedOut readBreedApiBreedReedsGetBreedDetailGet(breedDetail)

获取种类详情



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final BreedDetail breedDetail = ; // BreedDetail | 

try {
    final response = api.readBreedApiBreedReedsGetBreedDetailGet(breedDetail);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->readBreedApiBreedReedsGetBreedDetailGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **breedDetail** | [**BreedDetail**](BreedDetail.md)|  | [optional] 

### Return type

[**GenericResponseDogBreedOut**](GenericResponseDogBreedOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readBreedsApiBreedReedsGetBreedsGet**
> GenericResponseDogBreedListResponse readBreedsApiBreedReedsGetBreedsGet(skip, limit, isPopular)

获取种类列表



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final int skip = 56; // int | 
final int limit = 56; // int | 
final bool isPopular = true; // bool | 

try {
    final response = api.readBreedsApiBreedReedsGetBreedsGet(skip, limit, isPopular);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->readBreedsApiBreedReedsGetBreedsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 100]
 **isPopular** | **bool**|  | [optional] 

### Return type

[**GenericResponseDogBreedListResponse**](GenericResponseDogBreedListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readBreedsCountApiBreedReedsGetBreedsCountGet**
> GenericResponseDict readBreedsCountApiBreedReedsGetBreedsCountGet(isPopular)

获取种类数量



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final bool isPopular = true; // bool | 

try {
    final response = api.readBreedsCountApiBreedReedsGetBreedsCountGet(isPopular);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->readBreedsCountApiBreedReedsGetBreedsCountGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **isPopular** | **bool**|  | [optional] 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readGuideApiBreedBehaviorGuidesGetBehaviorGuideDetailGet**
> GenericResponseDogBehaviorGuideOut readGuideApiBreedBehaviorGuidesGetBehaviorGuideDetailGet(dogBehaviorGuideBase)

获取行为指南详情



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final DogBehaviorGuideBase dogBehaviorGuideBase = ; // DogBehaviorGuideBase | 

try {
    final response = api.readGuideApiBreedBehaviorGuidesGetBehaviorGuideDetailGet(dogBehaviorGuideBase);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->readGuideApiBreedBehaviorGuidesGetBehaviorGuideDetailGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dogBehaviorGuideBase** | [**DogBehaviorGuideBase**](DogBehaviorGuideBase.md)|  | [optional] 

### Return type

[**GenericResponseDogBehaviorGuideOut**](GenericResponseDogBehaviorGuideOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readGuideApiBreedCareGuidesGetCareGuideGet**
> GenericResponseDogCareGuideOut readGuideApiBreedCareGuidesGetCareGuideGet(dogCareGuideBase)

获取护理指南详情



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final DogCareGuideBase dogCareGuideBase = ; // DogCareGuideBase | 

try {
    final response = api.readGuideApiBreedCareGuidesGetCareGuideGet(dogCareGuideBase);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->readGuideApiBreedCareGuidesGetCareGuideGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dogCareGuideBase** | [**DogCareGuideBase**](DogCareGuideBase.md)|  | [optional] 

### Return type

[**GenericResponseDogCareGuideOut**](GenericResponseDogCareGuideOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readGuideApiBreedTrainingGuidesGetTrainingGuideGuideIdGet**
> DogTrainingGuideOut readGuideApiBreedTrainingGuidesGetTrainingGuideGuideIdGet(guideId)

获取训练指南详情



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final int guideId = 0; // int | 

try {
    final response = api.readGuideApiBreedTrainingGuidesGetTrainingGuideGuideIdGet(guideId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->readGuideApiBreedTrainingGuidesGetTrainingGuideGuideIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guideId** | **int**|  | 

### Return type

[**DogTrainingGuideOut**](DogTrainingGuideOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readGuidesApiBreedBehaviorGuidesGetBehaviorGuidesGet**
> GenericResponsePagedResponseDogBehaviorGuideOut readGuidesApiBreedBehaviorGuidesGetBehaviorGuidesGet(skip, limit, breedId, ageStageId)

获取行为指南列表



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final int skip = 56; // int | 
final int limit = 56; // int | 
final int breedId = 56; // int | 
final int ageStageId = 56; // int | 

try {
    final response = api.readGuidesApiBreedBehaviorGuidesGetBehaviorGuidesGet(skip, limit, breedId, ageStageId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->readGuidesApiBreedBehaviorGuidesGetBehaviorGuidesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 100]
 **breedId** | **int**|  | [optional] 
 **ageStageId** | **int**|  | [optional] 

### Return type

[**GenericResponsePagedResponseDogBehaviorGuideOut**](GenericResponsePagedResponseDogBehaviorGuideOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readGuidesApiBreedCareGuidesGetDogCareGuidesGet**
> GenericResponsePagedResponseDogCareGuideOut readGuidesApiBreedCareGuidesGetDogCareGuidesGet(page, size, breedId, ageStageId)

获取护理指南列表(分页)



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final int page = 56; // int | 
final int size = 56; // int | 
final int breedId = 56; // int | 
final int ageStageId = 56; // int | 

try {
    final response = api.readGuidesApiBreedCareGuidesGetDogCareGuidesGet(page, size, breedId, ageStageId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->readGuidesApiBreedCareGuidesGetDogCareGuidesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **size** | **int**|  | [optional] [default to 10]
 **breedId** | **int**|  | [optional] 
 **ageStageId** | **int**|  | [optional] 

### Return type

[**GenericResponsePagedResponseDogCareGuideOut**](GenericResponsePagedResponseDogCareGuideOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readGuidesApiBreedTrainingGuidesGet**
> BuiltList<DogTrainingGuideOut> readGuidesApiBreedTrainingGuidesGet(skip, limit, breedId, ageStageId)

Read Guides



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final int skip = 56; // int | 
final int limit = 56; // int | 
final int breedId = 56; // int | 
final int ageStageId = 56; // int | 

try {
    final response = api.readGuidesApiBreedTrainingGuidesGet(skip, limit, breedId, ageStageId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->readGuidesApiBreedTrainingGuidesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 100]
 **breedId** | **int**|  | [optional] 
 **ageStageId** | **int**|  | [optional] 

### Return type

[**BuiltList&lt;DogTrainingGuideOut&gt;**](DogTrainingGuideOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readGuidesCountApiBreedTrainingGuidesGetTrainingGuidesCountGet**
> BuiltMap<String, JsonObject> readGuidesCountApiBreedTrainingGuidesGetTrainingGuidesCountGet(breedId, ageStageId)

获取训练指南数量



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final int breedId = 56; // int | 
final int ageStageId = 56; // int | 

try {
    final response = api.readGuidesCountApiBreedTrainingGuidesGetTrainingGuidesCountGet(breedId, ageStageId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->readGuidesCountApiBreedTrainingGuidesGetTrainingGuidesCountGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **breedId** | **int**|  | [optional] 
 **ageStageId** | **int**|  | [optional] 

### Return type

[**BuiltMap&lt;String, JsonObject&gt;**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readStageApiBreedAgeStagesGetAgeStageGet**
> GenericResponseDogAgeStageOut readStageApiBreedAgeStagesGetAgeStageGet(dogAgeStageBase)

获取年龄阶段详情



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final DogAgeStageBase dogAgeStageBase = ; // DogAgeStageBase | 

try {
    final response = api.readStageApiBreedAgeStagesGetAgeStageGet(dogAgeStageBase);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->readStageApiBreedAgeStagesGetAgeStageGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dogAgeStageBase** | [**DogAgeStageBase**](DogAgeStageBase.md)|  | [optional] 

### Return type

[**GenericResponseDogAgeStageOut**](GenericResponseDogAgeStageOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readStagesApiBreedAgeStagesGetAgeStagesGet**
> GenericResponseListDogAgeStageOut readStagesApiBreedAgeStagesGetAgeStagesGet(skip, limit)

获取年龄阶段列表



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final int skip = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.readStagesApiBreedAgeStagesGetAgeStagesGet(skip, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->readStagesApiBreedAgeStagesGetAgeStagesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **skip** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 100]

### Return type

[**GenericResponseListDogAgeStageOut**](GenericResponseListDogAgeStageOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readStagesCountApiBreedAgeStagesAgeStagesCountGet**
> GenericResponseInt readStagesCountApiBreedAgeStagesAgeStagesCountGet()

获取年龄阶段总数



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();

try {
    final response = api.readStagesCountApiBreedAgeStagesAgeStagesCountGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->readStagesCountApiBreedAgeStagesAgeStagesCountGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GenericResponseInt**](GenericResponseInt.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateBreedApiBreedReedsUpdateBreedPost**
> GenericResponseDogBreedOut updateBreedApiBreedReedsUpdateBreedPost(dogBreedUpdate)

更新种类

更新种类  - **name**: 品种名称(可选) - **english_name**: 品种英文名称(可选) - **origin**: 品种产地(可选) - **group**: 犬种分组(可选) - **size**: 体型(可选) - **lifespan**: 寿命(可选) - **temperament**: 性格特征(可选) - **appearance**: 外貌特征(可选) - **care_level**: 饲养难度(1-5，可选) - **activity_level**: 活动量(1-5，可选) - **is_popular**: 是否热门品种(可选) - **media_ids**: 媒体资源ID列表(可选)

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final DogBreedUpdate dogBreedUpdate = ; // DogBreedUpdate | 

try {
    final response = api.updateBreedApiBreedReedsUpdateBreedPost(dogBreedUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->updateBreedApiBreedReedsUpdateBreedPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dogBreedUpdate** | [**DogBreedUpdate**](DogBreedUpdate.md)|  | [optional] 

### Return type

[**GenericResponseDogBreedOut**](GenericResponseDogBreedOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateGuideApiBreedBehaviorGuidesUpdateBehaviorGuidePost**
> GenericResponseDogBehaviorGuideOut updateGuideApiBreedBehaviorGuidesUpdateBehaviorGuidePost(dogBehaviorGuideUpdate)

更新行为指南



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final DogBehaviorGuideUpdate dogBehaviorGuideUpdate = ; // DogBehaviorGuideUpdate | 

try {
    final response = api.updateGuideApiBreedBehaviorGuidesUpdateBehaviorGuidePost(dogBehaviorGuideUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->updateGuideApiBreedBehaviorGuidesUpdateBehaviorGuidePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dogBehaviorGuideUpdate** | [**DogBehaviorGuideUpdate**](DogBehaviorGuideUpdate.md)|  | [optional] 

### Return type

[**GenericResponseDogBehaviorGuideOut**](GenericResponseDogBehaviorGuideOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateGuideApiBreedCareGuidesUpdateCareGuidePost**
> GenericResponseDogCareGuideOut updateGuideApiBreedCareGuidesUpdateCareGuidePost(dogCareGuideUpdate)

更新护理指南



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final DogCareGuideUpdate dogCareGuideUpdate = ; // DogCareGuideUpdate | 

try {
    final response = api.updateGuideApiBreedCareGuidesUpdateCareGuidePost(dogCareGuideUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->updateGuideApiBreedCareGuidesUpdateCareGuidePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dogCareGuideUpdate** | [**DogCareGuideUpdate**](DogCareGuideUpdate.md)|  | [optional] 

### Return type

[**GenericResponseDogCareGuideOut**](GenericResponseDogCareGuideOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateGuideApiBreedTrainingGuidesUpdateTrainingGuideGuideIdPost**
> DogTrainingGuideOut updateGuideApiBreedTrainingGuidesUpdateTrainingGuideGuideIdPost(guideId, dogTrainingGuideUpdate)

更新训练指南



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final int guideId = 0; // int | 
final DogTrainingGuideUpdate dogTrainingGuideUpdate = ; // DogTrainingGuideUpdate | 

try {
    final response = api.updateGuideApiBreedTrainingGuidesUpdateTrainingGuideGuideIdPost(guideId, dogTrainingGuideUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->updateGuideApiBreedTrainingGuidesUpdateTrainingGuideGuideIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guideId** | **int**|  | 
 **dogTrainingGuideUpdate** | [**DogTrainingGuideUpdate**](DogTrainingGuideUpdate.md)|  | [optional] 

### Return type

[**DogTrainingGuideOut**](DogTrainingGuideOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateStageApiBreedAgeStagesUpdateAgeStagePost**
> GenericResponseDogAgeStageOut updateStageApiBreedAgeStagesUpdateAgeStagePost(dogAgeStageUpdate)

更新年龄阶段



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getDogBreedsApi();
final DogAgeStageUpdate dogAgeStageUpdate = ; // DogAgeStageUpdate | 

try {
    final response = api.updateStageApiBreedAgeStagesUpdateAgeStagePost(dogAgeStageUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DogBreedsApi->updateStageApiBreedAgeStagesUpdateAgeStagePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dogAgeStageUpdate** | [**DogAgeStageUpdate**](DogAgeStageUpdate.md)|  | [optional] 

### Return type

[**GenericResponseDogAgeStageOut**](GenericResponseDogAgeStageOut.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

