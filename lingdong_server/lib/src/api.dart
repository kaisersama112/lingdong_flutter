//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:lingdong_server/src/serializers.dart';
import 'package:lingdong_server/src/auth/api_key_auth.dart';
import 'package:lingdong_server/src/auth/basic_auth.dart';
import 'package:lingdong_server/src/auth/bearer_auth.dart';
import 'package:lingdong_server/src/auth/oauth.dart';
import 'package:lingdong_server/src/api/default_api.dart';
import 'package:lingdong_server/src/api/auth_api.dart';
import 'package:lingdong_server/src/api/chat_api.dart';
import 'package:lingdong_server/src/api/default_api.dart';
import 'package:lingdong_server/src/api/dog_breeds_api.dart';
import 'package:lingdong_server/src/api/dynamics_api.dart';
import 'package:lingdong_server/src/api/enums_api.dart';
import 'package:lingdong_server/src/api/expl6_ore_api.dart';
import 'package:lingdong_server/src/api/media_api.dart';
import 'package:lingdong_server/src/api/pet_profile_api.dart';
import 'package:lingdong_server/src/api/social_api.dart';
import 'package:lingdong_server/src/api/tags_api.dart';
import 'package:lingdong_server/src/api/user_api.dart';
import 'package:lingdong_server/src/api/user_relationship_api.dart';

class LingdongServer {
  static const String basePath = r'http://localhost';

  final Dio dio;
  final Serializers serializers;

  LingdongServer({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor)
              as OAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor)
              as BearerAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor)
              as BasicAuthInterceptor)
          .authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this
                  .dio
                  .interceptors
                  .firstWhere((element) => element is ApiKeyAuthInterceptor)
              as ApiKeyAuthInterceptor)
          .apiKeys[name] = apiKey;
    }
  }

  /// Get DefaultApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DefaultApi getDefaultApi() {
    return DefaultApi(dio, serializers);
  }

  /// Get AuthApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuthApi getAuthApi() {
    return AuthApi(dio, serializers);
  }

  /// Get ChatApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ChatApi getChatApi() {
    return ChatApi(dio, serializers);
  }

  /// Get DogBreedsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DogBreedsApi getDogBreedsApi() {
    return DogBreedsApi(dio, serializers);
  }

  /// Get DynamicsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DynamicsApi getDynamicsApi() {
    return DynamicsApi(dio, serializers);
  }

  /// Get EnumsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  EnumsApi getEnumsApi() {
    return EnumsApi(dio, serializers);
  }

  /// Get Expl6OreApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  Expl6OreApi getExpl6OreApi() {
    return Expl6OreApi(dio, serializers);
  }

  /// Get MediaApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MediaApi getMediaApi() {
    return MediaApi(dio, serializers);
  }

  /// Get PetProfileApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PetProfileApi getPetProfileApi() {
    return PetProfileApi(dio, serializers);
  }

  /// Get SocialApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SocialApi getSocialApi() {
    return SocialApi(dio, serializers);
  }

  /// Get TagsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TagsApi getTagsApi() {
    return TagsApi(dio, serializers);
  }

  /// Get UserApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UserApi getUserApi() {
    return UserApi(dio, serializers);
  }

  /// Get UserRelationshipApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UserRelationshipApi getUserRelationshipApi() {
    return UserRelationshipApi(dio, serializers);
  }
}
