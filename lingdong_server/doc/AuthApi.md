# lingdong_server.api.AuthApi

## Load the API package
```dart
import 'package:lingdong_server/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**changePasswordApiAuthChangePasswordPost**](AuthApi.md#changepasswordapiauthchangepasswordpost) | **POST** /api/auth/change_password | 修改密码（需登录+旧密码）
[**changePasswordApiAuthChangePasswordPost_0**](AuthApi.md#changepasswordapiauthchangepasswordpost_0) | **POST** /api/auth/change_password | 修改密码（需登录+旧密码）
[**getOtherUserInfoApiAuthUsersOtherUserIdGet**](AuthApi.md#getotheruserinfoapiauthusersotheruseridget) | **GET** /api/auth/users/other/{user_id}/ | 获取其他用户信息
[**getOtherUserInfoApiAuthUsersOtherUserIdGet_0**](AuthApi.md#getotheruserinfoapiauthusersotheruseridget_0) | **GET** /api/auth/users/other/{user_id}/ | 获取其他用户信息
[**loginForAccessTokenApiAuthLoginPost**](AuthApi.md#loginforaccesstokenapiauthloginpost) | **POST** /api/auth/login | 用户登录
[**loginForAccessTokenApiAuthLoginPost_0**](AuthApi.md#loginforaccesstokenapiauthloginpost_0) | **POST** /api/auth/login | 用户登录
[**phoneCodeLoginApiAuthPhoneCodeLoginPost**](AuthApi.md#phonecodeloginapiauthphonecodeloginpost) | **POST** /api/auth/phone_code_login | 手机号+验证码 一键注册/登录
[**phoneCodeLoginApiAuthPhoneCodeLoginPost_0**](AuthApi.md#phonecodeloginapiauthphonecodeloginpost_0) | **POST** /api/auth/phone_code_login | 手机号+验证码 一键注册/登录
[**phonePasswordLoginApiAuthPhoneLoginPost**](AuthApi.md#phonepasswordloginapiauthphoneloginpost) | **POST** /api/auth/phone_login | 手机号+密码 登录（仅登录，未注册报错）
[**phonePasswordLoginApiAuthPhoneLoginPost_0**](AuthApi.md#phonepasswordloginapiauthphoneloginpost_0) | **POST** /api/auth/phone_login | 手机号+密码 登录（仅登录，未注册报错）
[**readUsersMeApiAuthUsersMeGet**](AuthApi.md#readusersmeapiauthusersmeget) | **GET** /api/auth/users/me/ | 获取当前用户信息
[**readUsersMeApiAuthUsersMeGet_0**](AuthApi.md#readusersmeapiauthusersmeget_0) | **GET** /api/auth/users/me/ | 获取当前用户信息
[**refreshAccessTokenApiAuthRefreshPost**](AuthApi.md#refreshaccesstokenapiauthrefreshpost) | **POST** /api/auth/refresh | 刷新访问令牌
[**refreshAccessTokenApiAuthRefreshPost_0**](AuthApi.md#refreshaccesstokenapiauthrefreshpost_0) | **POST** /api/auth/refresh | 刷新访问令牌
[**registerUserApiAuthRegisterPost**](AuthApi.md#registeruserapiauthregisterpost) | **POST** /api/auth/register | 注册用户
[**registerUserApiAuthRegisterPost_0**](AuthApi.md#registeruserapiauthregisterpost_0) | **POST** /api/auth/register | 注册用户
[**sendLoginCodeApiAuthSendCodePost**](AuthApi.md#sendlogincodeapiauthsendcodepost) | **POST** /api/auth/send_code | 发送手机验证码
[**sendLoginCodeApiAuthSendCodePost_0**](AuthApi.md#sendlogincodeapiauthsendcodepost_0) | **POST** /api/auth/send_code | 发送手机验证码
[**setPasswordByCodeApiAuthSetPasswordByCodePost**](AuthApi.md#setpasswordbycodeapiauthsetpasswordbycodepost) | **POST** /api/auth/set_password_by_code | 通过手机号验证码设置密码（无需登录）
[**setPasswordByCodeApiAuthSetPasswordByCodePost_0**](AuthApi.md#setpasswordbycodeapiauthsetpasswordbycodepost_0) | **POST** /api/auth/set_password_by_code | 通过手机号验证码设置密码（无需登录）


# **changePasswordApiAuthChangePasswordPost**
> GenericResponseEmptyResponse changePasswordApiAuthChangePasswordPost(changePasswordRequest)

修改密码（需登录+旧密码）



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getAuthApi();
final ChangePasswordRequest changePasswordRequest = ; // ChangePasswordRequest | 

try {
    final response = api.changePasswordApiAuthChangePasswordPost(changePasswordRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->changePasswordApiAuthChangePasswordPost: $e\n');
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

# **changePasswordApiAuthChangePasswordPost_0**
> GenericResponseEmptyResponse changePasswordApiAuthChangePasswordPost_0(changePasswordRequest)

修改密码（需登录+旧密码）



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getAuthApi();
final ChangePasswordRequest changePasswordRequest = ; // ChangePasswordRequest | 

try {
    final response = api.changePasswordApiAuthChangePasswordPost_0(changePasswordRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->changePasswordApiAuthChangePasswordPost_0: $e\n');
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

# **getOtherUserInfoApiAuthUsersOtherUserIdGet**
> GenericResponseUserResponse getOtherUserInfoApiAuthUsersOtherUserIdGet(userId)

获取其他用户信息

获取其他用户的非敏感信息 :param user_id: 目标用户ID :param db: 数据库会话 :param current_user: 当前用户（可选） :return: 用户的非敏感信息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getAuthApi();
final int userId = 0; // int | 

try {
    final response = api.getOtherUserInfoApiAuthUsersOtherUserIdGet(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->getOtherUserInfoApiAuthUsersOtherUserIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 

### Return type

[**GenericResponseUserResponse**](GenericResponseUserResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOtherUserInfoApiAuthUsersOtherUserIdGet_0**
> GenericResponseUserResponse getOtherUserInfoApiAuthUsersOtherUserIdGet_0(userId)

获取其他用户信息

获取其他用户的非敏感信息 :param user_id: 目标用户ID :param db: 数据库会话 :param current_user: 当前用户（可选） :return: 用户的非敏感信息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getAuthApi();
final int userId = 0; // int | 

try {
    final response = api.getOtherUserInfoApiAuthUsersOtherUserIdGet_0(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->getOtherUserInfoApiAuthUsersOtherUserIdGet_0: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 

### Return type

[**GenericResponseUserResponse**](GenericResponseUserResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginForAccessTokenApiAuthLoginPost**
> GenericResponseLoginResponse loginForAccessTokenApiAuthLoginPost(loginRequest)

用户登录

用户登录，支持用户名或手机号登录 :param request: 登录请求 :param db: 数据库会话 :return: 访问令牌和刷新令牌

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getAuthApi();
final LoginRequest loginRequest = ; // LoginRequest | 

try {
    final response = api.loginForAccessTokenApiAuthLoginPost(loginRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->loginForAccessTokenApiAuthLoginPost: $e\n');
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

# **loginForAccessTokenApiAuthLoginPost_0**
> GenericResponseLoginResponse loginForAccessTokenApiAuthLoginPost_0(loginRequest)

用户登录

用户登录，支持用户名或手机号登录 :param request: 登录请求 :param db: 数据库会话 :return: 访问令牌和刷新令牌

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getAuthApi();
final LoginRequest loginRequest = ; // LoginRequest | 

try {
    final response = api.loginForAccessTokenApiAuthLoginPost_0(loginRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->loginForAccessTokenApiAuthLoginPost_0: $e\n');
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

final api = LingdongServer().getAuthApi();
final PhoneCodeLoginRequest phoneCodeLoginRequest = {"phone":"string","code":"string"}; // PhoneCodeLoginRequest | 

try {
    final response = api.phoneCodeLoginApiAuthPhoneCodeLoginPost(phoneCodeLoginRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->phoneCodeLoginApiAuthPhoneCodeLoginPost: $e\n');
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

# **phoneCodeLoginApiAuthPhoneCodeLoginPost_0**
> GenericResponsePhoneCodeLoginResponse phoneCodeLoginApiAuthPhoneCodeLoginPost_0(phoneCodeLoginRequest)

手机号+验证码 一键注册/登录



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getAuthApi();
final PhoneCodeLoginRequest phoneCodeLoginRequest = {"phone":"string","code":"string"}; // PhoneCodeLoginRequest | 

try {
    final response = api.phoneCodeLoginApiAuthPhoneCodeLoginPost_0(phoneCodeLoginRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->phoneCodeLoginApiAuthPhoneCodeLoginPost_0: $e\n');
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

final api = LingdongServer().getAuthApi();
final PhoneLoginRequest phoneLoginRequest = ; // PhoneLoginRequest | 

try {
    final response = api.phonePasswordLoginApiAuthPhoneLoginPost(phoneLoginRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->phonePasswordLoginApiAuthPhoneLoginPost: $e\n');
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

# **phonePasswordLoginApiAuthPhoneLoginPost_0**
> GenericResponsePhoneLoginResponse phonePasswordLoginApiAuthPhoneLoginPost_0(phoneLoginRequest)

手机号+密码 登录（仅登录，未注册报错）



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getAuthApi();
final PhoneLoginRequest phoneLoginRequest = ; // PhoneLoginRequest | 

try {
    final response = api.phonePasswordLoginApiAuthPhoneLoginPost_0(phoneLoginRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->phonePasswordLoginApiAuthPhoneLoginPost_0: $e\n');
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

获取当前用户信息 :param current_user: 当前用户 :param db: 数据库会话 :return: 当前用户信息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getAuthApi();

try {
    final response = api.readUsersMeApiAuthUsersMeGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->readUsersMeApiAuthUsersMeGet: $e\n');
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

# **readUsersMeApiAuthUsersMeGet_0**
> GenericResponseUserInfoResponse readUsersMeApiAuthUsersMeGet_0()

获取当前用户信息

获取当前用户信息 :param current_user: 当前用户 :param db: 数据库会话 :return: 当前用户信息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getAuthApi();

try {
    final response = api.readUsersMeApiAuthUsersMeGet_0();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->readUsersMeApiAuthUsersMeGet_0: $e\n');
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

final api = LingdongServer().getAuthApi();
final String refreshToken = refreshToken_example; // String | 

try {
    final response = api.refreshAccessTokenApiAuthRefreshPost(refreshToken);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->refreshAccessTokenApiAuthRefreshPost: $e\n');
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

# **refreshAccessTokenApiAuthRefreshPost_0**
> GenericResponseRefreshTokenResponse refreshAccessTokenApiAuthRefreshPost_0(refreshToken)

刷新访问令牌

使用刷新令牌获取新的访问令牌 :param refresh_token: 刷新令牌 :param db: 数据库会话 :return: 新的访问令牌

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getAuthApi();
final String refreshToken = refreshToken_example; // String | 

try {
    final response = api.refreshAccessTokenApiAuthRefreshPost_0(refreshToken);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->refreshAccessTokenApiAuthRefreshPost_0: $e\n');
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

final api = LingdongServer().getAuthApi();
final String username = username_example; // String | 
final String password = password_example; // String | 
final String email = email_example; // String | 
final String phone = phone_example; // String | 

try {
    final response = api.registerUserApiAuthRegisterPost(username, password, email, phone);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->registerUserApiAuthRegisterPost: $e\n');
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

# **registerUserApiAuthRegisterPost_0**
> GenericResponseUserInfoResponse registerUserApiAuthRegisterPost_0(username, password, email, phone)

注册用户

注册用户 :param username: 用户名 :param password: 密码 :param email: 邮箱 :param phone: 手机号 :param db: 数据库会话 :return: 注册成功的消息

### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getAuthApi();
final String username = username_example; // String | 
final String password = password_example; // String | 
final String email = email_example; // String | 
final String phone = phone_example; // String | 

try {
    final response = api.registerUserApiAuthRegisterPost_0(username, password, email, phone);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->registerUserApiAuthRegisterPost_0: $e\n');
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

final api = LingdongServer().getAuthApi();
final SendCodeRequest sendCodeRequest = {"phone":"string"}; // SendCodeRequest | 

try {
    final response = api.sendLoginCodeApiAuthSendCodePost(sendCodeRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->sendLoginCodeApiAuthSendCodePost: $e\n');
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

# **sendLoginCodeApiAuthSendCodePost_0**
> GenericResponseSendCodeResponse sendLoginCodeApiAuthSendCodePost_0(sendCodeRequest)

发送手机验证码



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getAuthApi();
final SendCodeRequest sendCodeRequest = {"phone":"string"}; // SendCodeRequest | 

try {
    final response = api.sendLoginCodeApiAuthSendCodePost_0(sendCodeRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->sendLoginCodeApiAuthSendCodePost_0: $e\n');
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

final api = LingdongServer().getAuthApi();
final SetPasswordByCodeRequest setPasswordByCodeRequest = ; // SetPasswordByCodeRequest | 

try {
    final response = api.setPasswordByCodeApiAuthSetPasswordByCodePost(setPasswordByCodeRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->setPasswordByCodeApiAuthSetPasswordByCodePost: $e\n');
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

# **setPasswordByCodeApiAuthSetPasswordByCodePost_0**
> GenericResponseEmptyResponse setPasswordByCodeApiAuthSetPasswordByCodePost_0(setPasswordByCodeRequest)

通过手机号验证码设置密码（无需登录）



### Example
```dart
import 'package:lingdong_server/api.dart';

final api = LingdongServer().getAuthApi();
final SetPasswordByCodeRequest setPasswordByCodeRequest = ; // SetPasswordByCodeRequest | 

try {
    final response = api.setPasswordByCodeApiAuthSetPasswordByCodePost_0(setPasswordByCodeRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->setPasswordByCodeApiAuthSetPasswordByCodePost_0: $e\n');
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

