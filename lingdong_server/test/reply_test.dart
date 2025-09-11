import 'package:test/test.dart';
import 'package:lingdong_server/lingdong_server.dart';

// tests for Reply
void main() {
  final instance = ReplyBuilder();
  // TODO add properties to the builder and call build()

  group(Reply, () {
    // Content，回复内容
    // String content
    test('to test the property `content`', () async {
      // TODO
    });

    // BuiltList<MediaResponse> medias
    test('to test the property `medias`', () async {
      // TODO
    });

    // Id，回复ID
    // int id
    test('to test the property `id`', () async {
      // TODO
    });

    // Parent Comment Id，顶级评论ID
    // int parentCommentId
    test('to test the property `parentCommentId`', () async {
      // TODO
    });

    // int replyToReplyId
    test('to test the property `replyToReplyId`', () async {
      // TODO
    });

    // Replier，回复人信息
    // BuiltMap<String, JsonObject> replier
    test('to test the property `replier`', () async {
      // TODO
    });

    // BuiltMap<String, JsonObject> replyTo
    test('to test the property `replyTo`', () async {
      // TODO
    });

    // Created At，创建时间
    // DateTime createdAt
    test('to test the property `createdAt`', () async {
      // TODO
    });

    // DateTime updatedAt
    test('to test the property `updatedAt`', () async {
      // TODO
    });

    // BuiltList<Reply> replies
    test('to test the property `replies`', () async {
      // TODO
    });

  });
}
