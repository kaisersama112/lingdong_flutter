import 'package:test/test.dart';
import 'package:lingdong_server/lingdong_server.dart';

// tests for CommunityMemberResponse
void main() {
  final instance = CommunityMemberResponseBuilder();
  // TODO add properties to the builder and call build()

  group(CommunityMemberResponse, () {
    // Id
    // int id
    test('to test the property `id`', () async {
      // TODO
    });

    // User Id
    // int userId
    test('to test the property `userId`', () async {
      // TODO
    });

    // Role，角色(0:普通成员,1:管理员,2:超级管理员)
    // int role
    test('to test the property `role`', () async {
      // TODO
    });

    // Status，状态(0:待审核,1:已批准,2:已拒绝,3:已封禁)
    // int status
    test('to test the property `status`', () async {
      // TODO
    });

    // Joined At
    // DateTime joinedAt
    test('to test the property `joinedAt`', () async {
      // TODO
    });

    // DateTime approvalAt
    test('to test the property `approvalAt`', () async {
      // TODO
    });

  });
}
