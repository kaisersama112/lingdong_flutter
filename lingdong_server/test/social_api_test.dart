import 'package:test/test.dart';
import 'package:lingdong_server/lingdong_server.dart';


/// tests for SocialApi
void main() {
  final instance = LingdongServer().getSocialApi();

  group(SocialApi, () {
    // 审核成员加入申请
    //
    // 
    //
    //Future<GenericResponseDict> approveMemberApiCommunityCommunitiesCommunityIdMembersApprovePost(int communityId, { MembershipApproval membershipApproval }) async
    test('test approveMemberApiCommunityCommunitiesCommunityIdMembersApprovePost', () async {
      // TODO
    });

    // 封禁成员
    //
    // 
    //
    //Future<GenericResponseDict> banMemberApiCommunityCommunitiesCommunityIdMembersMemberIdBanPost(int communityId, int memberId, { String comment }) async
    test('test banMemberApiCommunityCommunitiesCommunityIdMembersMemberIdBanPost', () async {
      // TODO
    });

    // 创建社群
    //
    // 创建一个新的社群。 Args:     community (CommunityCreate): 包含社群信息的请求模型。     db (Session, optional): 数据库会话对象。     current_user (User, optional): 当前登录用户。  Returns:     GenericResponse[CommunityResponse]: 包含新创建社群信息的响应模型。
    //
    //Future<GenericResponseCommunityResponse> createCommunityApiCommunityCommunitiesPost({ CommunityCreate communityCreate }) async
    test('test createCommunityApiCommunityCommunitiesPost', () async {
      // TODO
    });

    // 发布社群动态
    //
    // 
    //
    //Future<GenericResponsePostResponse> createCommunityPostApiCommunityCommunitiesCommunityIdPostsPost(int communityId, { PostCreate postCreate }) async
    test('test createCommunityPostApiCommunityCommunitiesCommunityIdPostsPost', () async {
      // TODO
    });

    // 获取社群列表
    //
    // 
    //
    //Future<GenericResponseCommunityListResponse> getCommunitiesApiCommunityCommunitiesGet({ int skip, int limit, String search }) async
    test('test getCommunitiesApiCommunityCommunitiesGet', () async {
      // TODO
    });

    // 获取社群详情
    //
    // 
    //
    //Future<GenericResponseCommunityDetailResponse> getCommunityDetailApiCommunityCommunitiesCommunityIdGet(int communityId) async
    test('test getCommunityDetailApiCommunityCommunitiesCommunityIdGet', () async {
      // TODO
    });

    // 获取社群成员列表
    //
    // 
    //
    //Future<GenericResponseCommunityMemberListResponse> getCommunityMembersApiCommunityCommunitiesCommunityIdMembersGet(int communityId, { int skip, int limit, String role, String status }) async
    test('test getCommunityMembersApiCommunityCommunitiesCommunityIdMembersGet', () async {
      // TODO
    });

    // 获取社群动态
    //
    // 
    //
    //Future<GenericResponsePostListResponse> getCommunityPostsApiCommunityCommunitiesCommunityIdPostsGet(int communityId, { int page, int limit }) async
    test('test getCommunityPostsApiCommunityCommunitiesCommunityIdPostsGet', () async {
      // TODO
    });

    // 获取待审核成员列表
    //
    // 
    //
    //Future<GenericResponseCommunityMemberListResponse> getPendingMembersApiCommunityCommunitiesCommunityIdMembersPendingGet(int communityId, { int skip, int limit }) async
    test('test getPendingMembersApiCommunityCommunitiesCommunityIdMembersPendingGet', () async {
      // TODO
    });

    // 加入社群
    //
    // 
    //
    //Future<GenericResponseDict> joinCommunityApiCommunityCommunitiesCommunityIdJoinPost(int communityId) async
    test('test joinCommunityApiCommunityCommunitiesCommunityIdJoinPost', () async {
      // TODO
    });

    // 更新成员角色
    //
    // 
    //
    //Future<GenericResponseDict> updateMemberRoleApiCommunityCommunitiesCommunityIdMembersRolePost(int communityId, { RoleUpdate roleUpdate }) async
    test('test updateMemberRoleApiCommunityCommunitiesCommunityIdMembersRolePost', () async {
      // TODO
    });

  });
}
