import 'package:test/test.dart';
import 'package:lingdong_server/lingdong_server.dart';


/// tests for MediaApi
void main() {
  final instance = LingdongServer().getMediaApi();

  group(MediaApi, () {
    // 删除媒体资源
    //
    // 删除指定的媒体资源
    //
    //Future<GenericResponseMediaOut> deleteMediaApiMediaDeleteMediaPost(int mediaId) async
    test('test deleteMediaApiMediaDeleteMediaPost', () async {
      // TODO
    });

    // 删除媒体资源
    //
    // 删除指定的媒体资源
    //
    //Future<GenericResponseMediaOut> deleteMediaApiMediaDeleteMediaPost_0(int mediaId) async
    test('test deleteMediaApiMediaDeleteMediaPost_0', () async {
      // TODO
    });

    // 上传媒体资源到指定对象
    //
    // 上传媒体资源并关联到指定类型的对象  - **related_type**: 关联对象类型 - **related_id**: 关联对象ID - **file**: 上传的文件 - **media_type**: 媒体类型(默认:image) - **description**: 媒体描述(可选) - **sort_order**: 排序序号(可选)
    //
    //Future<GenericResponseMediaOut> uploadMediaApiMediaUploadMediaPost(RelatedTypeEnum relatedType, int relatedId, MultipartFile file, { int sortOrder, MediaType mediaType, String description }) async
    test('test uploadMediaApiMediaUploadMediaPost', () async {
      // TODO
    });

    // 上传媒体资源到指定对象
    //
    // 上传媒体资源并关联到指定类型的对象  - **related_type**: 关联对象类型 - **related_id**: 关联对象ID - **file**: 上传的文件 - **media_type**: 媒体类型(默认:image) - **description**: 媒体描述(可选) - **sort_order**: 排序序号(可选)
    //
    //Future<GenericResponseMediaOut> uploadMediaApiMediaUploadMediaPost_0(RelatedTypeEnum relatedType, int relatedId, MultipartFile file, { int sortOrder, MediaType mediaType, String description }) async
    test('test uploadMediaApiMediaUploadMediaPost_0', () async {
      // TODO
    });

  });
}
