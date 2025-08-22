import 'package:test/test.dart';
import 'package:lingdong_server/lingdong_server.dart';

// tests for PostCreate
void main() {
  final instance = PostCreateBuilder();
  // TODO add properties to the builder and call build()

  group(PostCreate, () {
    // Content，动态内容
    // String content
    test('to test the property `content`', () async {
      // TODO
    });

    // Related Type，关联类型:0:place,1:post
    // int relatedType
    test('to test the property `relatedType`', () async {
      // TODO
    });

    // int communityId
    test('to test the property `communityId`', () async {
      // TODO
    });

    // BuiltList<MediaCreate> medias
    test('to test the property `medias`', () async {
      // TODO
    });

    // String tags
    test('to test the property `tags`', () async {
      // TODO
    });

    // int visibility
    test('to test the property `visibility`', () async {
      // TODO
    });

    // String location
    test('to test the property `location`', () async {
      // TODO
    });

  });
}
