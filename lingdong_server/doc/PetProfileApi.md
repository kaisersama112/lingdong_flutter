# lingdong_server.api.PetProfileApi

## Load the API package
```dart
import 'package:lingdong_server/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createConsultationRecordApiPetCreateConsultationRecordPost**](PetProfileApi.md#createconsultationrecordapipetcreateconsultationrecordpost) | **POST** /api/pet/create_consultation_record | 创建就诊记录
[**createDewormingRecordApiPetCreateDewormingRecordPost**](PetProfileApi.md#createdewormingrecordapipetcreatedewormingrecordpost) | **POST** /api/pet/create_deworming_record | 创建驱虫记录
[**createExaminationRecordApiPetCreateExaminationRecordPost**](PetProfileApi.md#createexaminationrecordapipetcreateexaminationrecordpost) | **POST** /api/pet/create_examination_record | 创建体检记录
[**createGroomingRecordApiPetCreateGroomingRecordPost**](PetProfileApi.md#creategroomingrecordapipetcreategroomingrecordpost) | **POST** /api/pet/create_grooming_record | 创建美容养护记录
[**createOtherHealthRecordApiPetCreateOtherHealthRecordPost**](PetProfileApi.md#createotherhealthrecordapipetcreateotherhealthrecordpost) | **POST** /api/pet/create_other_health_record | 创建其他健康记录
[**createPetApiPetProfilePost**](PetProfileApi.md#createpetapipetprofilepost) | **POST** /api/pet/profile | 创建宠物档案
[**createVaccinationRecordApiPetCreateVaccinationRecordPost**](PetProfileApi.md#createvaccinationrecordapipetcreatevaccinationrecordpost) | **POST** /api/pet/create_vaccination_record | 创建疫苗接种记录
[**createWeightRecordApiPetCreateWeightRecordPost**](PetProfileApi.md#createweightrecordapipetcreateweightrecordpost) | **POST** /api/pet/create_weight_record | 创建体重记录
[**deleteConsultationRecordApiPetDeleteConsultationRecordRecordIdPost**](PetProfileApi.md#deleteconsultationrecordapipetdeleteconsultationrecordrecordidpost) | **POST** /api/pet/delete_consultation_record/{record_id} | 删除就诊记录
[**deleteDewormingRecordApiPetDeleteDewormingRecordRecordIdPost**](PetProfileApi.md#deletedewormingrecordapipetdeletedewormingrecordrecordidpost) | **POST** /api/pet/delete_deworming_record/{record_id} | 删除驱虫记录
[**deleteExaminationRecordApiPetDeleteExaminationRecordRecordIdPost**](PetProfileApi.md#deleteexaminationrecordapipetdeleteexaminationrecordrecordidpost) | **POST** /api/pet/delete_examination_record/{record_id} | 删除体检记录
[**deleteGroomingRecordApiPetDeleteGroomingRecordRecordIdPost**](PetProfileApi.md#deletegroomingrecordapipetdeletegroomingrecordrecordidpost) | **POST** /api/pet/delete_grooming_record/{record_id} | 删除美容养护记录
[**deleteOtherHealthRecordApiPetDeleteOtherHealthRecordRecordIdPost**](PetProfileApi.md#deleteotherhealthrecordapipetdeleteotherhealthrecordrecordidpost) | **POST** /api/pet/delete_other_health_record/{record_id} | 删除其他健康记录
[**deleteVaccinationRecordApiPetDeleteVaccinationRecordRecordIdPost**](PetProfileApi.md#deletevaccinationrecordapipetdeletevaccinationrecordrecordidpost) | **POST** /api/pet/delete_vaccination_record/{record_id} | 删除疫苗接种记录
[**deleteWeightRecordApiPetDeleteWeightRecordRecordIdPost**](PetProfileApi.md#deleteweightrecordapipetdeleteweightrecordrecordidpost) | **POST** /api/pet/delete_weight_record/{record_id} | 删除体重记录
[**getConsultationRecordApiPetGetConsultationRecordRecordIdGet**](PetProfileApi.md#getconsultationrecordapipetgetconsultationrecordrecordidget) | **GET** /api/pet/get_consultation_record/{record_id} | 获取就诊记录
[**getConsultationRecordsByPetApiPetGetConsultationRecordsByPetPetIdGet**](PetProfileApi.md#getconsultationrecordsbypetapipetgetconsultationrecordsbypetpetidget) | **GET** /api/pet/get_consultation_records_by_pet/{pet_id} | 根据宠物ID获取就诊记录列表（分页）
[**getDewormingRecordApiPetGetDewormingRecordRecordIdGet**](PetProfileApi.md#getdewormingrecordapipetgetdewormingrecordrecordidget) | **GET** /api/pet/get_deworming_record/{record_id} | 获取驱虫记录
[**getDewormingRecordsByPetApiPetGetDewormingRecordsByPetPetIdGet**](PetProfileApi.md#getdewormingrecordsbypetapipetgetdewormingrecordsbypetpetidget) | **GET** /api/pet/get_deworming_records_by_pet/{pet_id} | 根据宠物ID获取驱虫记录列表（分页）
[**getExaminationRecordApiPetGetExaminationRecordRecordIdGet**](PetProfileApi.md#getexaminationrecordapipetgetexaminationrecordrecordidget) | **GET** /api/pet/get_examination_record/{record_id} | 获取体检记录
[**getExaminationRecordsByPetApiPetGetExaminationRecordsByPetPetIdGet**](PetProfileApi.md#getexaminationrecordsbypetapipetgetexaminationrecordsbypetpetidget) | **GET** /api/pet/get_examination_records_by_pet/{pet_id} | 根据宠物ID获取体检记录列表（分页）
[**getGroomingRecordApiPetGetGroomingRecordRecordIdGet**](PetProfileApi.md#getgroomingrecordapipetgetgroomingrecordrecordidget) | **GET** /api/pet/get_grooming_record/{record_id} | 获取美容养护记录
[**getGroomingRecordsByPetApiPetGetGroomingRecordsByPetPetIdGet**](PetProfileApi.md#getgroomingrecordsbypetapipetgetgroomingrecordsbypetpetidget) | **GET** /api/pet/get_grooming_records_by_pet/{pet_id} | 根据宠物ID获取美容养护记录列表（分页）
[**getOtherHealthRecordApiPetGetOtherHealthRecordRecordIdGet**](PetProfileApi.md#getotherhealthrecordapipetgetotherhealthrecordrecordidget) | **GET** /api/pet/get_other_health_record/{record_id} | 获取其他健康记录
[**getOtherHealthRecordsByPetApiPetGetOtherHealthRecordsByPetPetIdGet**](PetProfileApi.md#getotherhealthrecordsbypetapipetgetotherhealthrecordsbypetpetidget) | **GET** /api/pet/get_other_health_records_by_pet/{pet_id} | 根据宠物ID获取其他健康记录列表（分页）
[**getVaccinationRecordsByPetApiPetGetVaccinationRecordsByPetPetIdGet**](PetProfileApi.md#getvaccinationrecordsbypetapipetgetvaccinationrecordsbypetpetidget) | **GET** /api/pet/get_vaccination_records_by_pet/{pet_id} | 根据宠物ID获取疫苗接种记录列表（分页）
[**getWeightRecordApiPetGetWeightRecordRecordIdGet**](PetProfileApi.md#getweightrecordapipetgetweightrecordrecordidget) | **GET** /api/pet/get_weight_record/{record_id} | 获取体重记录
[**getWeightRecordsByPetApiPetGetWeightRecordsByPetPetIdGet**](PetProfileApi.md#getweightrecordsbypetapipetgetweightrecordsbypetpetidget) | **GET** /api/pet/get_weight_records_by_pet/{pet_id} | 根据宠物ID获取体重记录列表（分页）
[**readHealthRecordTypesApiPetHealthTypesGet**](PetProfileApi.md#readhealthrecordtypesapipethealthtypesget) | **GET** /api/pet/health/types | 获取健康记录类型列表
[**readPetApiPetProfilePetIdGet**](PetProfileApi.md#readpetapipetprofilepetidget) | **GET** /api/pet/profile/{pet_id} | 获取单个宠物档案
[**readPetsApiPetProfileGet**](PetProfileApi.md#readpetsapipetprofileget) | **GET** /api/pet/profile | 获取宠物档案列表
[**updateConsultationRecordApiPetUpdateConsultationRecordRecordIdPost**](PetProfileApi.md#updateconsultationrecordapipetupdateconsultationrecordrecordidpost) | **POST** /api/pet/update_consultation_record/{record_id} | 更新就诊记录
[**updateDewormingRecordApiPetUpdateDewormingRecordRecordIdPost**](PetProfileApi.md#updatedewormingrecordapipetupdatedewormingrecordrecordidpost) | **POST** /api/pet/update_deworming_record/{record_id} | 更新驱虫记录
[**updateExaminationRecordApiPetUpdateExaminationRecordRecordIdPost**](PetProfileApi.md#updateexaminationrecordapipetupdateexaminationrecordrecordidpost) | **POST** /api/pet/update_examination_record/{record_id} | 更新体检记录
[**updateGroomingRecordApiPetUpdateGroomingRecordRecordIdPost**](PetProfileApi.md#updategroomingrecordapipetupdategroomingrecordrecordidpost) | **POST** /api/pet/update_grooming_record/{record_id} | 更新美容养护记录
[**updateOtherHealthRecordApiPetUpdateOtherHealthRecordRecordIdPost**](PetProfileApi.md#updateotherhealthrecordapipetupdateotherhealthrecordrecordidpost) | **POST** /api/pet/update_other_health_record/{record_id} | 更新其他健康记录
[**updateVaccinationRecordApiPetUpdateVaccinationRecordRecordIdPost**](PetProfileApi.md#updatevaccinationrecordapipetupdatevaccinationrecordrecordidpost) | **POST** /api/pet/update_vaccination_record/{record_id} | 更新疫苗接种记录
[**updateWeightRecordApiPetUpdateWeightRecordRecordIdPost**](PetProfileApi.md#updateweightrecordapipetupdateweightrecordrecordidpost) | **POST** /api/pet/update_weight_record/{record_id} | 更新体重记录


# **createConsultationRecordApiPetCreateConsultationRecordPost**
> GenericResponseConsultationResponse createConsultationRecordApiPetCreateConsultationRecordPost(consultationCreate)

创建就诊记录

创建就诊记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final ConsultationCreate consultationCreate = ; // ConsultationCreate | 

try {
    final response = api.createConsultationRecordApiPetCreateConsultationRecordPost(consultationCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->createConsultationRecordApiPetCreateConsultationRecordPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **consultationCreate** | [**ConsultationCreate**](ConsultationCreate.md)|  | [optional] 

### Return type

[**GenericResponseConsultationResponse**](GenericResponseConsultationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createDewormingRecordApiPetCreateDewormingRecordPost**
> GenericResponseDewormingRecordResponse createDewormingRecordApiPetCreateDewormingRecordPost(dewormingRecordCreate)

创建驱虫记录

创建驱虫记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final DewormingRecordCreate dewormingRecordCreate = ; // DewormingRecordCreate | 

try {
    final response = api.createDewormingRecordApiPetCreateDewormingRecordPost(dewormingRecordCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->createDewormingRecordApiPetCreateDewormingRecordPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dewormingRecordCreate** | [**DewormingRecordCreate**](DewormingRecordCreate.md)|  | [optional] 

### Return type

[**GenericResponseDewormingRecordResponse**](GenericResponseDewormingRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createExaminationRecordApiPetCreateExaminationRecordPost**
> GenericResponseExaminationRecordResponse createExaminationRecordApiPetCreateExaminationRecordPost(examinationRecordCreate)

创建体检记录

创建体检记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final ExaminationRecordCreate examinationRecordCreate = ; // ExaminationRecordCreate | 

try {
    final response = api.createExaminationRecordApiPetCreateExaminationRecordPost(examinationRecordCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->createExaminationRecordApiPetCreateExaminationRecordPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **examinationRecordCreate** | [**ExaminationRecordCreate**](ExaminationRecordCreate.md)|  | [optional] 

### Return type

[**GenericResponseExaminationRecordResponse**](GenericResponseExaminationRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createGroomingRecordApiPetCreateGroomingRecordPost**
> GenericResponseBeautificationRecordResponse createGroomingRecordApiPetCreateGroomingRecordPost(beautificationRecordCreate)

创建美容养护记录

创建美容养护记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final BeautificationRecordCreate beautificationRecordCreate = ; // BeautificationRecordCreate | 

try {
    final response = api.createGroomingRecordApiPetCreateGroomingRecordPost(beautificationRecordCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->createGroomingRecordApiPetCreateGroomingRecordPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **beautificationRecordCreate** | [**BeautificationRecordCreate**](BeautificationRecordCreate.md)|  | [optional] 

### Return type

[**GenericResponseBeautificationRecordResponse**](GenericResponseBeautificationRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createOtherHealthRecordApiPetCreateOtherHealthRecordPost**
> GenericResponseOtherHealthRecordResponse createOtherHealthRecordApiPetCreateOtherHealthRecordPost(otherHealthRecordCreate)

创建其他健康记录

创建其他健康记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final OtherHealthRecordCreate otherHealthRecordCreate = ; // OtherHealthRecordCreate | 

try {
    final response = api.createOtherHealthRecordApiPetCreateOtherHealthRecordPost(otherHealthRecordCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->createOtherHealthRecordApiPetCreateOtherHealthRecordPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **otherHealthRecordCreate** | [**OtherHealthRecordCreate**](OtherHealthRecordCreate.md)|  | [optional] 

### Return type

[**GenericResponseOtherHealthRecordResponse**](GenericResponseOtherHealthRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createPetApiPetProfilePost**
> GenericResponsePetResponse createPetApiPetProfilePost(petCreate)

创建宠物档案



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final PetCreate petCreate = ; // PetCreate | 

try {
    final response = api.createPetApiPetProfilePost(petCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->createPetApiPetProfilePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **petCreate** | [**PetCreate**](PetCreate.md)|  | [optional] 

### Return type

[**GenericResponsePetResponse**](GenericResponsePetResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createVaccinationRecordApiPetCreateVaccinationRecordPost**
> GenericResponseVaccinationRecordResponse createVaccinationRecordApiPetCreateVaccinationRecordPost(vaccinationRecordCreate)

创建疫苗接种记录

创建疫苗接种记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final VaccinationRecordCreate vaccinationRecordCreate = ; // VaccinationRecordCreate | 

try {
    final response = api.createVaccinationRecordApiPetCreateVaccinationRecordPost(vaccinationRecordCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->createVaccinationRecordApiPetCreateVaccinationRecordPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **vaccinationRecordCreate** | [**VaccinationRecordCreate**](VaccinationRecordCreate.md)|  | [optional] 

### Return type

[**GenericResponseVaccinationRecordResponse**](GenericResponseVaccinationRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createWeightRecordApiPetCreateWeightRecordPost**
> GenericResponseWeightRecordResponse createWeightRecordApiPetCreateWeightRecordPost(weightRecordCreate)

创建体重记录

创建体重记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final WeightRecordCreate weightRecordCreate = ; // WeightRecordCreate | 

try {
    final response = api.createWeightRecordApiPetCreateWeightRecordPost(weightRecordCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->createWeightRecordApiPetCreateWeightRecordPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **weightRecordCreate** | [**WeightRecordCreate**](WeightRecordCreate.md)|  | [optional] 

### Return type

[**GenericResponseWeightRecordResponse**](GenericResponseWeightRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteConsultationRecordApiPetDeleteConsultationRecordRecordIdPost**
> GenericResponseDict deleteConsultationRecordApiPetDeleteConsultationRecordRecordIdPost(recordId)

删除就诊记录

删除就诊记录(逻辑删除)

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 

try {
    final response = api.deleteConsultationRecordApiPetDeleteConsultationRecordRecordIdPost(recordId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->deleteConsultationRecordApiPetDeleteConsultationRecordRecordIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteDewormingRecordApiPetDeleteDewormingRecordRecordIdPost**
> GenericResponseDict deleteDewormingRecordApiPetDeleteDewormingRecordRecordIdPost(recordId)

删除驱虫记录

删除驱虫记录(逻辑删除)

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 

try {
    final response = api.deleteDewormingRecordApiPetDeleteDewormingRecordRecordIdPost(recordId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->deleteDewormingRecordApiPetDeleteDewormingRecordRecordIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteExaminationRecordApiPetDeleteExaminationRecordRecordIdPost**
> GenericResponseDict deleteExaminationRecordApiPetDeleteExaminationRecordRecordIdPost(recordId)

删除体检记录

删除体检记录(逻辑删除)

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 

try {
    final response = api.deleteExaminationRecordApiPetDeleteExaminationRecordRecordIdPost(recordId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->deleteExaminationRecordApiPetDeleteExaminationRecordRecordIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteGroomingRecordApiPetDeleteGroomingRecordRecordIdPost**
> GenericResponseDict deleteGroomingRecordApiPetDeleteGroomingRecordRecordIdPost(recordId)

删除美容养护记录

删除美容养护记录(逻辑删除)

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 

try {
    final response = api.deleteGroomingRecordApiPetDeleteGroomingRecordRecordIdPost(recordId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->deleteGroomingRecordApiPetDeleteGroomingRecordRecordIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOtherHealthRecordApiPetDeleteOtherHealthRecordRecordIdPost**
> GenericResponseDict deleteOtherHealthRecordApiPetDeleteOtherHealthRecordRecordIdPost(recordId)

删除其他健康记录

删除其他健康记录(逻辑删除)

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 

try {
    final response = api.deleteOtherHealthRecordApiPetDeleteOtherHealthRecordRecordIdPost(recordId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->deleteOtherHealthRecordApiPetDeleteOtherHealthRecordRecordIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteVaccinationRecordApiPetDeleteVaccinationRecordRecordIdPost**
> GenericResponseDict deleteVaccinationRecordApiPetDeleteVaccinationRecordRecordIdPost(recordId)

删除疫苗接种记录

删除疫苗接种记录(逻辑删除)

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 

try {
    final response = api.deleteVaccinationRecordApiPetDeleteVaccinationRecordRecordIdPost(recordId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->deleteVaccinationRecordApiPetDeleteVaccinationRecordRecordIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteWeightRecordApiPetDeleteWeightRecordRecordIdPost**
> GenericResponseDict deleteWeightRecordApiPetDeleteWeightRecordRecordIdPost(recordId)

删除体重记录

删除体重记录(逻辑删除)

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 

try {
    final response = api.deleteWeightRecordApiPetDeleteWeightRecordRecordIdPost(recordId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->deleteWeightRecordApiPetDeleteWeightRecordRecordIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 

### Return type

[**GenericResponseDict**](GenericResponseDict.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getConsultationRecordApiPetGetConsultationRecordRecordIdGet**
> GenericResponseConsultationResponse getConsultationRecordApiPetGetConsultationRecordRecordIdGet(recordId)

获取就诊记录

获取就诊记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 

try {
    final response = api.getConsultationRecordApiPetGetConsultationRecordRecordIdGet(recordId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->getConsultationRecordApiPetGetConsultationRecordRecordIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 

### Return type

[**GenericResponseConsultationResponse**](GenericResponseConsultationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getConsultationRecordsByPetApiPetGetConsultationRecordsByPetPetIdGet**
> GenericResponsePaginationResponseConsultationResponse getConsultationRecordsByPetApiPetGetConsultationRecordsByPetPetIdGet(petId, skip, size)

根据宠物ID获取就诊记录列表（分页）

根据宠物ID获取就诊记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int petId = 0; // int | 
final int skip = 56; // int | 
final int size = 56; // int | 

try {
    final response = api.getConsultationRecordsByPetApiPetGetConsultationRecordsByPetPetIdGet(petId, skip, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->getConsultationRecordsByPetApiPetGetConsultationRecordsByPetPetIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **petId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **size** | **int**|  | [optional] [default to 10]

### Return type

[**GenericResponsePaginationResponseConsultationResponse**](GenericResponsePaginationResponseConsultationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDewormingRecordApiPetGetDewormingRecordRecordIdGet**
> GenericResponseDewormingRecordResponse getDewormingRecordApiPetGetDewormingRecordRecordIdGet(recordId)

获取驱虫记录

获取驱虫记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 

try {
    final response = api.getDewormingRecordApiPetGetDewormingRecordRecordIdGet(recordId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->getDewormingRecordApiPetGetDewormingRecordRecordIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 

### Return type

[**GenericResponseDewormingRecordResponse**](GenericResponseDewormingRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDewormingRecordsByPetApiPetGetDewormingRecordsByPetPetIdGet**
> GenericResponsePaginationResponseDewormingRecordResponse getDewormingRecordsByPetApiPetGetDewormingRecordsByPetPetIdGet(petId, skip, size)

根据宠物ID获取驱虫记录列表（分页）

根据宠物ID获取驱虫记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int petId = 0; // int | 
final int skip = 56; // int | 
final int size = 56; // int | 

try {
    final response = api.getDewormingRecordsByPetApiPetGetDewormingRecordsByPetPetIdGet(petId, skip, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->getDewormingRecordsByPetApiPetGetDewormingRecordsByPetPetIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **petId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **size** | **int**|  | [optional] [default to 10]

### Return type

[**GenericResponsePaginationResponseDewormingRecordResponse**](GenericResponsePaginationResponseDewormingRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getExaminationRecordApiPetGetExaminationRecordRecordIdGet**
> GenericResponseExaminationRecordResponse getExaminationRecordApiPetGetExaminationRecordRecordIdGet(recordId)

获取体检记录

获取体检记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 

try {
    final response = api.getExaminationRecordApiPetGetExaminationRecordRecordIdGet(recordId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->getExaminationRecordApiPetGetExaminationRecordRecordIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 

### Return type

[**GenericResponseExaminationRecordResponse**](GenericResponseExaminationRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getExaminationRecordsByPetApiPetGetExaminationRecordsByPetPetIdGet**
> GenericResponsePaginationResponseExaminationRecordResponse getExaminationRecordsByPetApiPetGetExaminationRecordsByPetPetIdGet(petId, skip, size)

根据宠物ID获取体检记录列表（分页）

根据宠物ID获取体检记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int petId = 0; // int | 
final int skip = 56; // int | 
final int size = 56; // int | 

try {
    final response = api.getExaminationRecordsByPetApiPetGetExaminationRecordsByPetPetIdGet(petId, skip, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->getExaminationRecordsByPetApiPetGetExaminationRecordsByPetPetIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **petId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **size** | **int**|  | [optional] [default to 10]

### Return type

[**GenericResponsePaginationResponseExaminationRecordResponse**](GenericResponsePaginationResponseExaminationRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGroomingRecordApiPetGetGroomingRecordRecordIdGet**
> GenericResponseBeautificationRecordResponse getGroomingRecordApiPetGetGroomingRecordRecordIdGet(recordId)

获取美容养护记录

获取美容养护记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 

try {
    final response = api.getGroomingRecordApiPetGetGroomingRecordRecordIdGet(recordId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->getGroomingRecordApiPetGetGroomingRecordRecordIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 

### Return type

[**GenericResponseBeautificationRecordResponse**](GenericResponseBeautificationRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGroomingRecordsByPetApiPetGetGroomingRecordsByPetPetIdGet**
> GenericResponsePaginationResponseBeautificationRecordResponse getGroomingRecordsByPetApiPetGetGroomingRecordsByPetPetIdGet(petId, skip, size)

根据宠物ID获取美容养护记录列表（分页）

根据宠物ID获取美容养护记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int petId = 0; // int | 
final int skip = 56; // int | 
final int size = 56; // int | 

try {
    final response = api.getGroomingRecordsByPetApiPetGetGroomingRecordsByPetPetIdGet(petId, skip, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->getGroomingRecordsByPetApiPetGetGroomingRecordsByPetPetIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **petId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **size** | **int**|  | [optional] [default to 10]

### Return type

[**GenericResponsePaginationResponseBeautificationRecordResponse**](GenericResponsePaginationResponseBeautificationRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOtherHealthRecordApiPetGetOtherHealthRecordRecordIdGet**
> GenericResponseOtherHealthRecordResponse getOtherHealthRecordApiPetGetOtherHealthRecordRecordIdGet(recordId)

获取其他健康记录

获取其他健康记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 

try {
    final response = api.getOtherHealthRecordApiPetGetOtherHealthRecordRecordIdGet(recordId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->getOtherHealthRecordApiPetGetOtherHealthRecordRecordIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 

### Return type

[**GenericResponseOtherHealthRecordResponse**](GenericResponseOtherHealthRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOtherHealthRecordsByPetApiPetGetOtherHealthRecordsByPetPetIdGet**
> GenericResponsePaginationResponseOtherHealthRecordResponse getOtherHealthRecordsByPetApiPetGetOtherHealthRecordsByPetPetIdGet(petId, skip, size)

根据宠物ID获取其他健康记录列表（分页）

根据宠物ID获取其他健康记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int petId = 0; // int | 
final int skip = 56; // int | 
final int size = 56; // int | 

try {
    final response = api.getOtherHealthRecordsByPetApiPetGetOtherHealthRecordsByPetPetIdGet(petId, skip, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->getOtherHealthRecordsByPetApiPetGetOtherHealthRecordsByPetPetIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **petId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **size** | **int**|  | [optional] [default to 10]

### Return type

[**GenericResponsePaginationResponseOtherHealthRecordResponse**](GenericResponsePaginationResponseOtherHealthRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getVaccinationRecordsByPetApiPetGetVaccinationRecordsByPetPetIdGet**
> GenericResponsePaginationResponseVaccinationRecordResponse getVaccinationRecordsByPetApiPetGetVaccinationRecordsByPetPetIdGet(petId, skip, size)

根据宠物ID获取疫苗接种记录列表（分页）

根据宠物ID获取疫苗接种记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int petId = 0; // int | 
final int skip = 56; // int | 
final int size = 56; // int | 

try {
    final response = api.getVaccinationRecordsByPetApiPetGetVaccinationRecordsByPetPetIdGet(petId, skip, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->getVaccinationRecordsByPetApiPetGetVaccinationRecordsByPetPetIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **petId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **size** | **int**|  | [optional] [default to 10]

### Return type

[**GenericResponsePaginationResponseVaccinationRecordResponse**](GenericResponsePaginationResponseVaccinationRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWeightRecordApiPetGetWeightRecordRecordIdGet**
> GenericResponseWeightRecordResponse getWeightRecordApiPetGetWeightRecordRecordIdGet(recordId)

获取体重记录

获取体重记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 

try {
    final response = api.getWeightRecordApiPetGetWeightRecordRecordIdGet(recordId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->getWeightRecordApiPetGetWeightRecordRecordIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 

### Return type

[**GenericResponseWeightRecordResponse**](GenericResponseWeightRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWeightRecordsByPetApiPetGetWeightRecordsByPetPetIdGet**
> GenericResponsePaginationResponseWeightRecordResponse getWeightRecordsByPetApiPetGetWeightRecordsByPetPetIdGet(petId, skip, size)

根据宠物ID获取体重记录列表（分页）

根据宠物ID获取体重记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int petId = 0; // int | 
final int skip = 56; // int | 
final int size = 56; // int | 

try {
    final response = api.getWeightRecordsByPetApiPetGetWeightRecordsByPetPetIdGet(petId, skip, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->getWeightRecordsByPetApiPetGetWeightRecordsByPetPetIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **petId** | **int**|  | 
 **skip** | **int**|  | [optional] [default to 0]
 **size** | **int**|  | [optional] [default to 10]

### Return type

[**GenericResponsePaginationResponseWeightRecordResponse**](GenericResponsePaginationResponseWeightRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readHealthRecordTypesApiPetHealthTypesGet**
> GenericResponseList readHealthRecordTypesApiPetHealthTypesGet()

获取健康记录类型列表



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();

try {
    final response = api.readHealthRecordTypesApiPetHealthTypesGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->readHealthRecordTypesApiPetHealthTypesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GenericResponseList**](GenericResponseList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readPetApiPetProfilePetIdGet**
> GenericResponsePetResponse readPetApiPetProfilePetIdGet(petId)

获取单个宠物档案



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int petId = 0; // int | 

try {
    final response = api.readPetApiPetProfilePetIdGet(petId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->readPetApiPetProfilePetIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **petId** | **int**|  | 

### Return type

[**GenericResponsePetResponse**](GenericResponsePetResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readPetsApiPetProfileGet**
> GenericResponsePetListResponse readPetsApiPetProfileGet()

获取宠物档案列表



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();

try {
    final response = api.readPetsApiPetProfileGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->readPetsApiPetProfileGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GenericResponsePetListResponse**](GenericResponsePetListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateConsultationRecordApiPetUpdateConsultationRecordRecordIdPost**
> GenericResponseConsultationResponse updateConsultationRecordApiPetUpdateConsultationRecordRecordIdPost(recordId, consultationCreate)

更新就诊记录

更新就诊记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 
final ConsultationCreate consultationCreate = ; // ConsultationCreate | 

try {
    final response = api.updateConsultationRecordApiPetUpdateConsultationRecordRecordIdPost(recordId, consultationCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->updateConsultationRecordApiPetUpdateConsultationRecordRecordIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 
 **consultationCreate** | [**ConsultationCreate**](ConsultationCreate.md)|  | [optional] 

### Return type

[**GenericResponseConsultationResponse**](GenericResponseConsultationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateDewormingRecordApiPetUpdateDewormingRecordRecordIdPost**
> GenericResponseDewormingRecordResponse updateDewormingRecordApiPetUpdateDewormingRecordRecordIdPost(recordId, dewormingRecordCreate)

更新驱虫记录

更新驱虫记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 
final DewormingRecordCreate dewormingRecordCreate = ; // DewormingRecordCreate | 

try {
    final response = api.updateDewormingRecordApiPetUpdateDewormingRecordRecordIdPost(recordId, dewormingRecordCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->updateDewormingRecordApiPetUpdateDewormingRecordRecordIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 
 **dewormingRecordCreate** | [**DewormingRecordCreate**](DewormingRecordCreate.md)|  | [optional] 

### Return type

[**GenericResponseDewormingRecordResponse**](GenericResponseDewormingRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateExaminationRecordApiPetUpdateExaminationRecordRecordIdPost**
> GenericResponseExaminationRecordResponse updateExaminationRecordApiPetUpdateExaminationRecordRecordIdPost(recordId, examinationRecordCreate)

更新体检记录

更新体检记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 
final ExaminationRecordCreate examinationRecordCreate = ; // ExaminationRecordCreate | 

try {
    final response = api.updateExaminationRecordApiPetUpdateExaminationRecordRecordIdPost(recordId, examinationRecordCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->updateExaminationRecordApiPetUpdateExaminationRecordRecordIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 
 **examinationRecordCreate** | [**ExaminationRecordCreate**](ExaminationRecordCreate.md)|  | [optional] 

### Return type

[**GenericResponseExaminationRecordResponse**](GenericResponseExaminationRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateGroomingRecordApiPetUpdateGroomingRecordRecordIdPost**
> GenericResponseBeautificationRecordResponse updateGroomingRecordApiPetUpdateGroomingRecordRecordIdPost(recordId, beautificationRecordCreate)

更新美容养护记录

更新美容养护记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 
final BeautificationRecordCreate beautificationRecordCreate = ; // BeautificationRecordCreate | 

try {
    final response = api.updateGroomingRecordApiPetUpdateGroomingRecordRecordIdPost(recordId, beautificationRecordCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->updateGroomingRecordApiPetUpdateGroomingRecordRecordIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 
 **beautificationRecordCreate** | [**BeautificationRecordCreate**](BeautificationRecordCreate.md)|  | [optional] 

### Return type

[**GenericResponseBeautificationRecordResponse**](GenericResponseBeautificationRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOtherHealthRecordApiPetUpdateOtherHealthRecordRecordIdPost**
> GenericResponseOtherHealthRecordResponse updateOtherHealthRecordApiPetUpdateOtherHealthRecordRecordIdPost(recordId, otherHealthRecordCreate)

更新其他健康记录

更新其他健康记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 
final OtherHealthRecordCreate otherHealthRecordCreate = ; // OtherHealthRecordCreate | 

try {
    final response = api.updateOtherHealthRecordApiPetUpdateOtherHealthRecordRecordIdPost(recordId, otherHealthRecordCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->updateOtherHealthRecordApiPetUpdateOtherHealthRecordRecordIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 
 **otherHealthRecordCreate** | [**OtherHealthRecordCreate**](OtherHealthRecordCreate.md)|  | [optional] 

### Return type

[**GenericResponseOtherHealthRecordResponse**](GenericResponseOtherHealthRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateVaccinationRecordApiPetUpdateVaccinationRecordRecordIdPost**
> GenericResponseVaccinationRecordResponse updateVaccinationRecordApiPetUpdateVaccinationRecordRecordIdPost(recordId, vaccinationRecordCreate)

更新疫苗接种记录

更新疫苗接种记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 
final VaccinationRecordCreate vaccinationRecordCreate = ; // VaccinationRecordCreate | 

try {
    final response = api.updateVaccinationRecordApiPetUpdateVaccinationRecordRecordIdPost(recordId, vaccinationRecordCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->updateVaccinationRecordApiPetUpdateVaccinationRecordRecordIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 
 **vaccinationRecordCreate** | [**VaccinationRecordCreate**](VaccinationRecordCreate.md)|  | [optional] 

### Return type

[**GenericResponseVaccinationRecordResponse**](GenericResponseVaccinationRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateWeightRecordApiPetUpdateWeightRecordRecordIdPost**
> GenericResponseWeightRecordResponse updateWeightRecordApiPetUpdateWeightRecordRecordIdPost(recordId, weightRecordCreate)

更新体重记录

更新体重记录

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getPetProfileApi();
final int recordId = 0; // int | 
final WeightRecordCreate weightRecordCreate = ; // WeightRecordCreate | 

try {
    final response = api.updateWeightRecordApiPetUpdateWeightRecordRecordIdPost(recordId, weightRecordCreate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PetProfileApi->updateWeightRecordApiPetUpdateWeightRecordRecordIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recordId** | **int**|  | 
 **weightRecordCreate** | [**WeightRecordCreate**](WeightRecordCreate.md)|  | [optional] 

### Return type

[**GenericResponseWeightRecordResponse**](GenericResponseWeightRecordResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

