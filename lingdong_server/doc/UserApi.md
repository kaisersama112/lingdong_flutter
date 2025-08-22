# lingdong_server.api.UserApi

## Load the API package
```dart
import 'package:lingdong_server/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**changePasswordApiAuthChangePasswordPost**](UserApi.md#changepasswordapiauthchangepasswordpost) | **POST** /api/auth/change_password | 修改密码（需登录+旧密码）
[**loginForAccessTokenApiAuthLoginPost**](UserApi.md#loginforaccesstokenapiauthloginpost) | **POST** /api/auth/login | 用户登录
[**phoneCodeLoginApiAuthPhoneCodeLoginPost**](UserApi.md#phonecodeloginapiauthphonecodeloginpost) | **POST** /api/auth/phone_code_login | 手机号+验证码 一键注册/登录
[**phonePasswordLoginApiAuthPhoneLoginPost**](UserApi.md#phonepasswordloginapiauthphoneloginpost) | **POST** /api/auth/phone_login | 手机号+密码 登录（仅登录，未注册报错）
[**readUsersMeApiAuthUsersMeGet**](UserApi.md#readusersmeapiauthusersmeget) | **GET** /api/auth/users/me/ | 获取当前用户信息
[**refreshAccessTokenApiAuthRefreshPost**](UserApi.md#refreshaccesstokenapiauthrefreshpost) | **POST** /api/auth/refresh | 刷新访问令牌
[**registerUserApiAuthRegisterPost**](UserApi.md#registeruserapiauthregisterpost) | **POST** /api/auth/register | 注册用户
[**sendLoginCodeApiAuthSendCodePost**](UserApi.md#sendlogincodeapiauthsendcodepost) | **POST** /api/auth/send_code | 发送手机验证码
[**setPasswordByCodeApiAuthSetPasswordByCodePost**](UserApi.md#setpasswordbycodeapiauthsetpasswordbycodepost) | **POST** /api/auth/set_password_by_code | 通过手机号验证码设置密码（无需登录）


# **changePasswordApiAuthChangePasswordPost**
> GenericResponseEmptyResponse changePasswordApiAuthChangePasswordPost(changePasswordRequest)

修改密码（需登录+旧密码）



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserApi();
final ChangePasswordRequest changePasswordRequest = ; // ChangePasswordRequest | 

try {
    final response = api.changePasswordApiAuthChangePasswordPost(changePasswordRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserApi->changePasswordApiAuthChangePasswordPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **changePasswordRequest** | [**ChangePasswordRequest**](ChangePasswordRequest.md)|  | [optional] 

### Return type

[**GenericResponseEmptyResponse**](GenericResponseEmptyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginForAccessTokenApiAuthLoginPost**
> GenericResponseLoginResponse loginForAccessTokenApiAuthLoginPost(loginRequest)

用户登录

用户登录，支持用户名或手机号登录 :param request: 登录请求 :param db: 数据库会话 :return: 访问令牌和刷新令牌

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserApi();
final LoginRequest loginRequest = {"identifier":"string","password":"string"}; // LoginRequest | 

try {
    final response = api.loginForAccessTokenApiAuthLoginPost(loginRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserApi->loginForAccessTokenApiAuthLoginPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md)|  | [optional] 

### Return type

[**GenericResponseLoginResponse**](GenericResponseLoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **phoneCodeLoginApiAuthPhoneCodeLoginPost**
> GenericResponsePhoneCodeLoginResponse phoneCodeLoginApiAuthPhoneCodeLoginPost(phoneCodeLoginRequest)

手机号+验证码 一键注册/登录



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserApi();
final PhoneCodeLoginRequest phoneCodeLoginRequest = ; // PhoneCodeLoginRequest | 

try {
    final response = api.phoneCodeLoginApiAuthPhoneCodeLoginPost(phoneCodeLoginRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserApi->phoneCodeLoginApiAuthPhoneCodeLoginPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **phoneCodeLoginRequest** | [**PhoneCodeLoginRequest**](PhoneCodeLoginRequest.md)|  | [optional] 

### Return type

[**GenericResponsePhoneCodeLoginResponse**](GenericResponsePhoneCodeLoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **phonePasswordLoginApiAuthPhoneLoginPost**
> GenericResponsePhoneLoginResponse phonePasswordLoginApiAuthPhoneLoginPost(phoneLoginRequest)

手机号+密码 登录（仅登录，未注册报错）



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserApi();
final PhoneLoginRequest phoneLoginRequest = ; // PhoneLoginRequest | 

try {
    final response = api.phonePasswordLoginApiAuthPhoneLoginPost(phoneLoginRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserApi->phonePasswordLoginApiAuthPhoneLoginPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **phoneLoginRequest** | [**PhoneLoginRequest**](PhoneLoginRequest.md)|  | [optional] 

### Return type

[**GenericResponsePhoneLoginResponse**](GenericResponsePhoneLoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readUsersMeApiAuthUsersMeGet**
> GenericResponseUserInfoResponse readUsersMeApiAuthUsersMeGet()

获取当前用户信息

获取当前用户信息 :param current_user: 当前用户 :return: 当前用户信息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserApi();

try {
    final response = api.readUsersMeApiAuthUsersMeGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserApi->readUsersMeApiAuthUsersMeGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GenericResponseUserInfoResponse**](GenericResponseUserInfoResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refreshAccessTokenApiAuthRefreshPost**
> GenericResponseRefreshTokenResponse refreshAccessTokenApiAuthRefreshPost(refreshToken)

刷新访问令牌

使用刷新令牌获取新的访问令牌 :param refresh_token: 刷新令牌 :param db: 数据库会话 :return: 新的访问令牌

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserApi();
final String refreshToken = refreshToken_example; // String | 

try {
    final response = api.refreshAccessTokenApiAuthRefreshPost(refreshToken);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserApi->refreshAccessTokenApiAuthRefreshPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshToken** | **String**|  | 

### Return type

[**GenericResponseRefreshTokenResponse**](GenericResponseRefreshTokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerUserApiAuthRegisterPost**
> GenericResponseUserInfoResponse registerUserApiAuthRegisterPost(username, password, email, phone)

注册用户

注册用户 :param username: 用户名 :param password: 密码 :param email: 邮箱 :param phone: 手机号 :param db: 数据库会话 :return: 注册成功的消息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserApi();
final String username = username_example; // String | 
final String password = password_example; // String | 
final String email = email_example; // String | 
final String phone = phone_example; // String | 

try {
    final response = api.registerUserApiAuthRegisterPost(username, password, email, phone);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserApi->registerUserApiAuthRegisterPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**|  | 
 **password** | **String**|  | 
 **email** | **String**|  | 
 **phone** | **String**|  | [optional] 

### Return type

[**GenericResponseUserInfoResponse**](GenericResponseUserInfoResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendLoginCodeApiAuthSendCodePost**
> GenericResponseSendCodeResponse sendLoginCodeApiAuthSendCodePost(sendCodeRequest)

发送手机验证码



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserApi();
final SendCodeRequest sendCodeRequest = {"phone":"string"}; // SendCodeRequest | 

try {
    final response = api.sendLoginCodeApiAuthSendCodePost(sendCodeRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserApi->sendLoginCodeApiAuthSendCodePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sendCodeRequest** | [**SendCodeRequest**](SendCodeRequest.md)|  | [optional] 

### Return type

[**GenericResponseSendCodeResponse**](GenericResponseSendCodeResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setPasswordByCodeApiAuthSetPasswordByCodePost**
> GenericResponseEmptyResponse setPasswordByCodeApiAuthSetPasswordByCodePost(setPasswordByCodeRequest)

通过手机号验证码设置密码（无需登录）



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getUserApi();
final SetPasswordByCodeRequest setPasswordByCodeRequest = ; // SetPasswordByCodeRequest | 

try {
    final response = api.setPasswordByCodeApiAuthSetPasswordByCodePost(setPasswordByCodeRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserApi->setPasswordByCodeApiAuthSetPasswordByCodePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setPasswordByCodeRequest** | [**SetPasswordByCodeRequest**](SetPasswordByCodeRequest.md)|  | [optional] 

### Return type

[**GenericResponseEmptyResponse**](GenericResponseEmptyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

