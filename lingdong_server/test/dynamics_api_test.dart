import 'package:test/test.dart';
import 'package:lingdong_server/lingdong_server.dart';


/// tests for DynamicsApi
void main() {
  final instance = LingdongServer().getDynamicsApi();

  group(DynamicsApi, () {
    // 创建广场动态
    //
    // 
    //
    //Future<GenericResponsePostResponse> createDynamicApiDynamicsCreateDynamicPost({ PostCreate postCreate }) async
    test('test createDynamicApiDynamicsCreateDynamicPost', () async {
      // TODO
    });

    // 创建顶级评论
    //
    // 创建对指定动态的顶级评论
    //
    //Future<GenericResponseParentComment> createParentCommentApiDynamicsPostsRepliesPost({ ParentCommentCreate parentCommentCreate }) async
    test('test createParentCommentApiDynamicsPostsRepliesPost', () async {
      // TODO
    });

    // 创建回复
    //
    // 创建对指定评论的回复或回复其他回复
    //
    //Future<GenericResponseReply> createReplyApiDynamicsCommentsRepliesPost({ ReplyCreate replyCreate }) async
    test('test createReplyApiDynamicsCommentsRepliesPost', () async {
      // TODO
    });

    // 删除动态
    //
    // 
    //
    //Future<GenericResponseDict> deleteDynamicApiDynamicsPostIdDeleteDynamicPost(int postId) async
    test('test deleteDynamicApiDynamicsPostIdDeleteDynamicPost', () async {
      // TODO
    });

    // 删除顶级评论
    //
    // 删除指定的顶级评论，包括评论的所有回复
    //
    //Future<GenericResponseBool> deleteParentCommentApiDynamicsParentCommentsCommentIdDelete(int commentId) async
    test('test deleteParentCommentApiDynamicsParentCommentsCommentIdDelete', () async {
      // TODO
    });

    // 删除回复
    //
    // 删除指定的回复
    //
    //Future<GenericResponseBool> deleteReplyApiDynamicsRepliesReplyIdDeletePost(int replyId) async
    test('test deleteReplyApiDynamicsRepliesReplyIdDeletePost', () async {
      // TODO
    });

    // 获取顶级评论下的回复
    //
    // 获取指定顶级评论下的回复，支持分页，返回平铺形式的回复数据（包含回复人和被回复人信息）
    //
    //Future<GenericResponseDict> getCommentRepliesApiDynamicsCommentsParentCommentIdRepliesGet(int parentCommentId, { int skip, int limit }) async
    test('test getCommentRepliesApiDynamicsCommentsParentCommentIdRepliesGet', () async {
      // TODO
    });

    // 获取动态详情
    //
    // 
    //
    //Future<GenericResponsePostResponse> getDynamicDetailApiDynamicsPostIdGet(int postId) async
    test('test getDynamicDetailApiDynamicsPostIdGet', () async {
      // TODO
    });

    // 获取帖子总评论数
    //
    // 获取指定帖子的总评论数，包括顶级评论和回复
    //
    //Future<GenericResponseDict> getPostCommentsCountApiDynamicsPostsPostIdCommentsCountGet(int postId) async
    test('test getPostCommentsCountApiDynamicsPostsPostIdCommentsCountGet', () async {
      // TODO
    });

    // 获取动态下的顶级评论
    //
    // 获取指定动态下的顶级评论，默认不包含完整回复树以提高性能，返回回复数量
    //
    //Future<GenericResponseDict> getPostParentCommentsApiDynamicsPostsPostIdParentCommentsGet(int postId, { int skip, int limit, bool includeReplies }) async
    test('test getPostParentCommentsApiDynamicsPostsPostIdParentCommentsGet', () async {
      // TODO
    });

    // 获取广场动态
    //
    // 
    //
    //Future<GenericResponsePostListResponse> getPublicDynamicsApiDynamicsGetPublicDynamicsGet({ int page, int limit, Tag tag }) async
    test('test getPublicDynamicsApiDynamicsGetPublicDynamicsGet', () async {
      // TODO
    });

    // 获取推荐动态
    //
    // 
    //
    //Future<GenericResponsePostListResponse> getRecommendedDynamicsApiDynamicsRecommendedPost({ PaginationParams paginationParams }) async
    test('test getRecommendedDynamicsApiDynamicsRecommendedPost', () async {
      // TODO
    });

    // 获取用户收藏的动态
    //
    // 获取当前用户收藏的动态列表，支持分页
    //
    //Future<GenericResponsePostListResponse> getUserFavoriteDynamicsApiDynamicsGetUserFavoriteDynamicsPost({ PaginationParams paginationParams }) async
    test('test getUserFavoriteDynamicsApiDynamicsGetUserFavoriteDynamicsPost', () async {
      // TODO
    });

    // 回复点赞
    //
    // 对指定回复进行点赞操作
    //
    //Future<GenericResponseDict> likeCommentApiDynamicsCommentsCommentIdLikePost(int commentId) async
    test('test likeCommentApiDynamicsCommentsCommentIdLikePost', () async {
      // TODO
    });

    // 点赞动态
    //
    // 
    //
    //Future<GenericResponseDict> likeDynamicApiDynamicsPostIdLikeDynamicPost(int postId) async
    test('test likeDynamicApiDynamicsPostIdLikeDynamicPost', () async {
      // TODO
    });

    // 分享动态
    //
    // 
    //
    //Future<GenericResponseDict> shareDynamicApiDynamicsPostIdSharePost(int postId, String platform, { String content, String shareUrl, bool isPublic }) async
    test('test shareDynamicApiDynamicsPostIdSharePost', () async {
      // TODO
    });

    // 切换动态收藏状态
    //
    // 
    //
    //Future<GenericResponseDict> toggleDynamicFavoriteApiDynamicsPostIdFavoritePost(int postId, { String source_ }) async
    test('test toggleDynamicFavoriteApiDynamicsPostIdFavoritePost', () async {
      // TODO
    });

    // 切换点赞状态
    //
    // 
    //
    //Future<GenericResponseDict> toggleLikeApiDynamicsPostIdToggleLikePost(int postId) async
    test('test toggleLikeApiDynamicsPostIdToggleLikePost', () async {
      // TODO
    });

    // 取消点赞
    //
    // 
    //
    //Future<GenericResponseDict> unlikeDynamicApiDynamicsPostIdUnlikeDynamicPost(int postId) async
    test('test unlikeDynamicApiDynamicsPostIdUnlikeDynamicPost', () async {
      // TODO
    });

    // 更新动态
    //
    // 
    //
    //Future<GenericResponsePostResponse> updateDynamicApiDynamicsPostIdUpdateDynamicPost(int postId, { PostCreate postCreate }) async
    test('test updateDynamicApiDynamicsPostIdUpdateDynamicPost', () async {
      // TODO
    });

  });
}
