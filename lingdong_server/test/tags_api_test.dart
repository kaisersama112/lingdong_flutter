import 'package:test/test.dart';
import 'package:lingdong_server/lingdong_server.dart';


/// tests for TagsApi
void main() {
  final instance = LingdongServer().getTagsApi();

  group(TagsApi, () {
    // 创建标签
    //
    // 
    //
    //Future<GenericResponseTagResponse> createTagApiTagsCreateTagPost({ TagCreate tagCreate }) async
    test('test createTagApiTagsCreateTagPost', () async {
      // TODO
    });

    // 删除标签
    //
    // 
    //
    //Future<GenericResponseDict> deleteTagApiTagsDeleteTagTagIdPost(int tagId) async
    test('test deleteTagApiTagsDeleteTagTagIdPost', () async {
      // TODO
    });

    // 获取单个标签
    //
    // 
    //
    //Future<GenericResponseTagResponse> readTagApiTagsGetTagTagIdGet(int tagId) async
    test('test readTagApiTagsGetTagTagIdGet', () async {
      // TODO
    });

    // 获取标签列表
    //
    // 
    //
    //Future<GenericResponseTagListResponse> readTagsApiTagsGetTagListGet({ int skip, int limit }) async
    test('test readTagsApiTagsGetTagListGet', () async {
      // TODO
    });

    // 更新标签
    //
    // 
    //
    //Future<GenericResponseTagResponse> updateTagApiTagsUpdateTagPost(int tagId, { TagUpdate tagUpdate }) async
    test('test updateTagApiTagsUpdateTagPost', () async {
      // TODO
    });

  });
}
