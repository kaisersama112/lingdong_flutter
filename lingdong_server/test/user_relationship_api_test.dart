import 'package:test/test.dart';
import 'package:lingdong_server/lingdong_server.dart';


/// tests for UserRelationshipApi
void main() {
  final instance = LingdongServer().getUserRelationshipApi();

  group(UserRelationshipApi, () {
    // 检查关注状态
    //
    // 检查当前用户是否关注了指定用户 - **user_id**: 要检查的目标用户ID
    //
    //Future<GenericResponseFollowStatusResponse> checkFollowStatusApiUserRelationshipStatusUserIdGet(int userId) async
    test('test checkFollowStatusApiUserRelationshipStatusUserIdGet', () async {
      // TODO
    });

    // 检查关注状态
    //
    // 检查当前用户是否关注了指定用户 - **user_id**: 要检查的目标用户ID
    //
    //Future<GenericResponseFollowStatusResponse> checkFollowStatusApiUserRelationshipStatusUserIdGet_0(int userId) async
    test('test checkFollowStatusApiUserRelationshipStatusUserIdGet_0', () async {
      // TODO
    });

    // 关注用户
    //
    // 关注指定用户 - **following_id**: 要关注的用户ID
    //
    //Future<GenericResponseDict> followApiUserRelationshipFollowPost({ FollowRequest followRequest }) async
    test('test followApiUserRelationshipFollowPost', () async {
      // TODO
    });

    // 关注用户
    //
    // 关注指定用户 - **following_id**: 要关注的用户ID
    //
    //Future<GenericResponseDict> followApiUserRelationshipFollowPost_0({ FollowRequest followRequest }) async
    test('test followApiUserRelationshipFollowPost_0', () async {
      // TODO
    });

    // 获取关注/粉丝数量
    //
    // 获取指定用户的关注数和粉丝数 - **user_id**: 要查询的用户ID
    //
    //Future<GenericResponseFollowCountResponse> getFollowCountsApiUserRelationshipCountUserIdGet(int userId) async
    test('test getFollowCountsApiUserRelationshipCountUserIdGet', () async {
      // TODO
    });

    // 获取关注/粉丝数量
    //
    // 获取指定用户的关注数和粉丝数 - **user_id**: 要查询的用户ID
    //
    //Future<GenericResponseFollowCountResponse> getFollowCountsApiUserRelationshipCountUserIdGet_0(int userId) async
    test('test getFollowCountsApiUserRelationshipCountUserIdGet_0', () async {
      // TODO
    });

    // 获取用户粉丝列表
    //
    // 获取指定用户的粉丝列表 - **user_id**: 要查询的用户ID - **skip**: 跳过的记录数，默认为0 - **limit**: 获取的记录数限制，默认为20
    //
    //Future<GenericResponseUserFollowListResponse> getFollowersListApiUserRelationshipFollowersUserIdGet(int userId, { int skip, int limit }) async
    test('test getFollowersListApiUserRelationshipFollowersUserIdGet', () async {
      // TODO
    });

    // 获取用户粉丝列表
    //
    // 获取指定用户的粉丝列表 - **user_id**: 要查询的用户ID - **skip**: 跳过的记录数，默认为0 - **limit**: 获取的记录数限制，默认为20
    //
    //Future<GenericResponseUserFollowListResponse> getFollowersListApiUserRelationshipFollowersUserIdGet_0(int userId, { int skip, int limit }) async
    test('test getFollowersListApiUserRelationshipFollowersUserIdGet_0', () async {
      // TODO
    });

    // 获取用户关注列表
    //
    // 获取指定用户的关注列表 - **user_id**: 要查询的用户ID - **skip**: 跳过的记录数，默认为0 - **limit**: 获取的记录数限制，默认为20
    //
    //Future<GenericResponseUserFollowListResponse> getFollowingListApiUserRelationshipFollowingUserIdGet(int userId, { int skip, int limit }) async
    test('test getFollowingListApiUserRelationshipFollowingUserIdGet', () async {
      // TODO
    });

    // 获取用户关注列表
    //
    // 获取指定用户的关注列表 - **user_id**: 要查询的用户ID - **skip**: 跳过的记录数，默认为0 - **limit**: 获取的记录数限制，默认为20
    //
    //Future<GenericResponseUserFollowListResponse> getFollowingListApiUserRelationshipFollowingUserIdGet_0(int userId, { int skip, int limit }) async
    test('test getFollowingListApiUserRelationshipFollowingUserIdGet_0', () async {
      // TODO
    });

    // 获取当前用户粉丝列表
    //
    // 获取当前用户的粉丝列表 - **skip**: 跳过的记录数，默认为0 - **limit**: 获取的记录数限制，默认为20
    //
    //Future<GenericResponseUserFollowListResponse> getMyFollowersApiUserRelationshipMyFollowersGet({ int skip, int limit }) async
    test('test getMyFollowersApiUserRelationshipMyFollowersGet', () async {
      // TODO
    });

    // 获取当前用户粉丝列表
    //
    // 获取当前用户的粉丝列表 - **skip**: 跳过的记录数，默认为0 - **limit**: 获取的记录数限制，默认为20
    //
    //Future<GenericResponseUserFollowListResponse> getMyFollowersApiUserRelationshipMyFollowersGet_0({ int skip, int limit }) async
    test('test getMyFollowersApiUserRelationshipMyFollowersGet_0', () async {
      // TODO
    });

    // 获取当前用户关注列表
    //
    // 获取当前用户的关注列表 - **skip**: 跳过的记录数，默认为0 - **limit**: 获取的记录数限制，默认为20
    //
    //Future<GenericResponseUserFollowListResponse> getMyFollowingApiUserRelationshipMyFollowingGet({ int skip, int limit }) async
    test('test getMyFollowingApiUserRelationshipMyFollowingGet', () async {
      // TODO
    });

    // 获取当前用户关注列表
    //
    // 获取当前用户的关注列表 - **skip**: 跳过的记录数，默认为0 - **limit**: 获取的记录数限制，默认为20
    //
    //Future<GenericResponseUserFollowListResponse> getMyFollowingApiUserRelationshipMyFollowingGet_0({ int skip, int limit }) async
    test('test getMyFollowingApiUserRelationshipMyFollowingGet_0', () async {
      // TODO
    });

    // 取消关注用户
    //
    // 取消关注指定用户 - **following_id**: 要取消关注的用户ID
    //
    //Future<GenericResponseDict> unfollowApiUserRelationshipUnfollowPost({ UnfollowRequest unfollowRequest }) async
    test('test unfollowApiUserRelationshipUnfollowPost', () async {
      // TODO
    });

    // 取消关注用户
    //
    // 取消关注指定用户 - **following_id**: 要取消关注的用户ID
    //
    //Future<GenericResponseDict> unfollowApiUserRelationshipUnfollowPost_0({ UnfollowRequest unfollowRequest }) async
    test('test unfollowApiUserRelationshipUnfollowPost_0', () async {
      // TODO
    });

  });
}
