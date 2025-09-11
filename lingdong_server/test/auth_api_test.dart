import 'package:test/test.dart';
import 'package:lingdong_server/lingdong_server.dart';


/// tests for AuthApi
void main() {
  final instance = LingdongServer().getAuthApi();

  group(AuthApi, () {
    // 修改密码（需登录+旧密码）
    //
    // 
    //
    //Future<GenericResponseEmptyResponse> changePasswordApiAuthChangePasswordPost({ ChangePasswordRequest changePasswordRequest }) async
    test('test changePasswordApiAuthChangePasswordPost', () async {
      // TODO
    });

    // 修改密码（需登录+旧密码）
    //
    // 
    //
    //Future<GenericResponseEmptyResponse> changePasswordApiAuthChangePasswordPost_0({ ChangePasswordRequest changePasswordRequest }) async
    test('test changePasswordApiAuthChangePasswordPost_0', () async {
      // TODO
    });

    // 获取其他用户个人信息
    //
    // 获取其他用户的个人信息（不包含敏感数据） :param user_id: 目标用户ID :param db: 数据库会话 :return: 用户的非敏感信息
    //
    //Future<GenericResponseUserResponse> getOtherUserInfoApiAuthUsersUserIdGet(int userId) async
    test('test getOtherUserInfoApiAuthUsersUserIdGet', () async {
      // TODO
    });

    // 获取其他用户个人信息
    //
    // 获取其他用户的个人信息（不包含敏感数据） :param user_id: 目标用户ID :param db: 数据库会话 :return: 用户的非敏感信息
    //
    //Future<GenericResponseUserResponse> getOtherUserInfoApiAuthUsersUserIdGet_0(int userId) async
    test('test getOtherUserInfoApiAuthUsersUserIdGet_0', () async {
      // TODO
    });

    // 用户登录
    //
    // 用户登录，支持用户名或手机号登录 :param request: 登录请求 :param db: 数据库会话 :return: 访问令牌和刷新令牌
    //
    //Future<GenericResponseLoginResponse> loginForAccessTokenApiAuthLoginPost({ LoginRequest loginRequest }) async
    test('test loginForAccessTokenApiAuthLoginPost', () async {
      // TODO
    });

    // 用户登录
    //
    // 用户登录，支持用户名或手机号登录 :param request: 登录请求 :param db: 数据库会话 :return: 访问令牌和刷新令牌
    //
    //Future<GenericResponseLoginResponse> loginForAccessTokenApiAuthLoginPost_0({ LoginRequest loginRequest }) async
    test('test loginForAccessTokenApiAuthLoginPost_0', () async {
      // TODO
    });

    // 手机号+验证码 一键注册/登录
    //
    // 
    //
    //Future<GenericResponsePhoneCodeLoginResponse> phoneCodeLoginApiAuthPhoneCodeLoginPost({ PhoneCodeLoginRequest phoneCodeLoginRequest }) async
    test('test phoneCodeLoginApiAuthPhoneCodeLoginPost', () async {
      // TODO
    });

    // 手机号+验证码 一键注册/登录
    //
    // 
    //
    //Future<GenericResponsePhoneCodeLoginResponse> phoneCodeLoginApiAuthPhoneCodeLoginPost_0({ PhoneCodeLoginRequest phoneCodeLoginRequest }) async
    test('test phoneCodeLoginApiAuthPhoneCodeLoginPost_0', () async {
      // TODO
    });

    // 手机号+密码 登录（仅登录，未注册报错）
    //
    // 
    //
    //Future<GenericResponsePhoneLoginResponse> phonePasswordLoginApiAuthPhoneLoginPost({ PhoneLoginRequest phoneLoginRequest }) async
    test('test phonePasswordLoginApiAuthPhoneLoginPost', () async {
      // TODO
    });

    // 手机号+密码 登录（仅登录，未注册报错）
    //
    // 
    //
    //Future<GenericResponsePhoneLoginResponse> phonePasswordLoginApiAuthPhoneLoginPost_0({ PhoneLoginRequest phoneLoginRequest }) async
    test('test phonePasswordLoginApiAuthPhoneLoginPost_0', () async {
      // TODO
    });

    // 获取当前用户信息
    //
    // 获取当前用户信息 :param current_user: 当前用户 :return: 当前用户信息
    //
    //Future<GenericResponseUserInfoResponse> readUsersMeApiAuthUsersMeGet() async
    test('test readUsersMeApiAuthUsersMeGet', () async {
      // TODO
    });

    // 获取当前用户信息
    //
    // 获取当前用户信息 :param current_user: 当前用户 :return: 当前用户信息
    //
    //Future<GenericResponseUserInfoResponse> readUsersMeApiAuthUsersMeGet_0() async
    test('test readUsersMeApiAuthUsersMeGet_0', () async {
      // TODO
    });

    // 刷新访问令牌
    //
    // 使用刷新令牌获取新的访问令牌 :param refresh_token: 刷新令牌 :param db: 数据库会话 :return: 新的访问令牌
    //
    //Future<GenericResponseRefreshTokenResponse> refreshAccessTokenApiAuthRefreshPost(String refreshToken) async
    test('test refreshAccessTokenApiAuthRefreshPost', () async {
      // TODO
    });

    // 刷新访问令牌
    //
    // 使用刷新令牌获取新的访问令牌 :param refresh_token: 刷新令牌 :param db: 数据库会话 :return: 新的访问令牌
    //
    //Future<GenericResponseRefreshTokenResponse> refreshAccessTokenApiAuthRefreshPost_0(String refreshToken) async
    test('test refreshAccessTokenApiAuthRefreshPost_0', () async {
      // TODO
    });

    // 注册用户
    //
    // 注册用户 :param username: 用户名 :param password: 密码 :param email: 邮箱 :param phone: 手机号 :param db: 数据库会话 :return: 注册成功的消息
    //
    //Future<GenericResponseUserInfoResponse> registerUserApiAuthRegisterPost(String username, String password, String email, { String phone }) async
    test('test registerUserApiAuthRegisterPost', () async {
      // TODO
    });

    // 注册用户
    //
    // 注册用户 :param username: 用户名 :param password: 密码 :param email: 邮箱 :param phone: 手机号 :param db: 数据库会话 :return: 注册成功的消息
    //
    //Future<GenericResponseUserInfoResponse> registerUserApiAuthRegisterPost_0(String username, String password, String email, { String phone }) async
    test('test registerUserApiAuthRegisterPost_0', () async {
      // TODO
    });

    // 发送手机验证码
    //
    // 
    //
    //Future<GenericResponseSendCodeResponse> sendLoginCodeApiAuthSendCodePost({ SendCodeRequest sendCodeRequest }) async
    test('test sendLoginCodeApiAuthSendCodePost', () async {
      // TODO
    });

    // 发送手机验证码
    //
    // 
    //
    //Future<GenericResponseSendCodeResponse> sendLoginCodeApiAuthSendCodePost_0({ SendCodeRequest sendCodeRequest }) async
    test('test sendLoginCodeApiAuthSendCodePost_0', () async {
      // TODO
    });

    // 通过手机号验证码设置密码（无需登录）
    //
    // 
    //
    //Future<GenericResponseEmptyResponse> setPasswordByCodeApiAuthSetPasswordByCodePost({ SetPasswordByCodeRequest setPasswordByCodeRequest }) async
    test('test setPasswordByCodeApiAuthSetPasswordByCodePost', () async {
      // TODO
    });

    // 通过手机号验证码设置密码（无需登录）
    //
    // 
    //
    //Future<GenericResponseEmptyResponse> setPasswordByCodeApiAuthSetPasswordByCodePost_0({ SetPasswordByCodeRequest setPasswordByCodeRequest }) async
    test('test setPasswordByCodeApiAuthSetPasswordByCodePost_0', () async {
      // TODO
    });

  });
}
