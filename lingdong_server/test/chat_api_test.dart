import 'package:test/test.dart';
import 'package:lingdong_server/lingdong_server.dart';


/// tests for ChatApi
void main() {
  final instance = LingdongServer().getChatApi();

  group(ChatApi, () {
    // 向会话中添加消息
    //
    // 向会话中添加消息
    //
    //Future<GenericResponseConversationMessageResponse> addConversationMessageApiChatConversationMessageAddPost({ AddMessageToConversation addMessageToConversation }) async
    test('test addConversationMessageApiChatConversationMessageAddPost', () async {
      // TODO
    });

    // 向会话中添加消息
    //
    // 向会话中添加消息
    //
    //Future<GenericResponseConversationMessageResponse> addConversationMessageApiChatConversationMessageAddPost_0({ AddMessageToConversation addMessageToConversation }) async
    test('test addConversationMessageApiChatConversationMessageAddPost_0', () async {
      // TODO
    });

    // 创建新会话
    //
    // 创建新会话
    //
    //Future<GenericResponseConversationResponse> createConversationApiChatConversationCreatePost({ ConversationCreate conversationCreate }) async
    test('test createConversationApiChatConversationCreatePost', () async {
      // TODO
    });

    // 创建新会话
    //
    // 创建新会话
    //
    //Future<GenericResponseConversationResponse> createConversationApiChatConversationCreatePost_0({ ConversationCreate conversationCreate }) async
    test('test createConversationApiChatConversationCreatePost_0', () async {
      // TODO
    });

    // 创建群聊
    //
    // 创建群聊
    //
    //Future<GenericResponseGroupConversationResponse> createGroupConversationApiChatGroupCreatePost({ GroupConversationCreate groupConversationCreate }) async
    test('test createGroupConversationApiChatGroupCreatePost', () async {
      // TODO
    });

    // 创建群聊
    //
    // 创建群聊
    //
    //Future<GenericResponseGroupConversationResponse> createGroupConversationApiChatGroupCreatePost_0({ GroupConversationCreate groupConversationCreate }) async
    test('test createGroupConversationApiChatGroupCreatePost_0', () async {
      // TODO
    });

    // 根据会话ID获取会话信息
    //
    // 根据会话ID获取会话信息 - session_id: 会话唯一标识
    //
    //Future<GenericResponseConversationResponse> getConversationBySessionIdApiChatConversationSessionIdGet(String sessionId) async
    test('test getConversationBySessionIdApiChatConversationSessionIdGet', () async {
      // TODO
    });

    // 根据会话ID获取会话信息
    //
    // 根据会话ID获取会话信息 - session_id: 会话唯一标识
    //
    //Future<GenericResponseConversationResponse> getConversationBySessionIdApiChatConversationSessionIdGet_0(String sessionId) async
    test('test getConversationBySessionIdApiChatConversationSessionIdGet_0', () async {
      // TODO
    });

    // 获取会话中的所有消息
    //
    // 获取会话中的所有消息 - session_id: 会话唯一标识
    //
    //Future<GenericResponseListConversationMessageResponse> getConversationMessagesApiChatConversationMessagesSessionIdGet(String sessionId) async
    test('test getConversationMessagesApiChatConversationMessagesSessionIdGet', () async {
      // TODO
    });

    // 获取会话中的所有消息
    //
    // 获取会话中的所有消息 - session_id: 会话唯一标识
    //
    //Future<GenericResponseListConversationMessageResponse> getConversationMessagesApiChatConversationMessagesSessionIdGet_0(String sessionId) async
    test('test getConversationMessagesApiChatConversationMessagesSessionIdGet_0', () async {
      // TODO
    });

    // 获取群成员列表
    //
    // 获取群成员列表 - group_id: 群聊ID
    //
    //Future<GenericResponseListGroupMemberResponse> getGroupMembersApiChatGroupMembersGroupIdGet(int groupId) async
    test('test getGroupMembersApiChatGroupMembersGroupIdGet', () async {
      // TODO
    });

    // 获取群成员列表
    //
    // 获取群成员列表 - group_id: 群聊ID
    //
    //Future<GenericResponseListGroupMemberResponse> getGroupMembersApiChatGroupMembersGroupIdGet_0(int groupId) async
    test('test getGroupMembersApiChatGroupMembersGroupIdGet_0', () async {
      // TODO
    });

    // 获取群消息记录
    //
    // 获取群消息记录 - group_id: 群聊ID - skip: 跳过的记录数，默认为0 - limit: 返回的记录数，默认为50
    //
    //Future<GenericResponseListGroupMessageResponse> getGroupMessagesApiChatGroupMessagesGroupIdGet(int groupId, { int skip, int limit }) async
    test('test getGroupMessagesApiChatGroupMessagesGroupIdGet', () async {
      // TODO
    });

    // 获取群消息记录
    //
    // 获取群消息记录 - group_id: 群聊ID - skip: 跳过的记录数，默认为0 - limit: 返回的记录数，默认为50
    //
    //Future<GenericResponseListGroupMessageResponse> getGroupMessagesApiChatGroupMessagesGroupIdGet_0(int groupId, { int skip, int limit }) async
    test('test getGroupMessagesApiChatGroupMessagesGroupIdGet_0', () async {
      // TODO
    });

    // 获取用户的所有会话列表
    //
    // 获取用户的所有会话列表（包括单聊和群聊）
    //
    //Future<GenericResponseListConversationListItem> getUserConversationsApiChatConversationsGet() async
    test('test getUserConversationsApiChatConversationsGet', () async {
      // TODO
    });

    // 获取用户的所有会话列表
    //
    // 获取用户的所有会话列表（包括单聊和群聊）
    //
    //Future<GenericResponseListConversationListItem> getUserConversationsApiChatConversationsGet_0() async
    test('test getUserConversationsApiChatConversationsGet_0', () async {
      // TODO
    });

    // 发送群消息
    //
    // 发送群消息
    //
    //Future<GenericResponseGroupMessageResponse> sendGroupMessageApiChatGroupSendPost({ GroupMessageCreate groupMessageCreate }) async
    test('test sendGroupMessageApiChatGroupSendPost', () async {
      // TODO
    });

    // 发送群消息
    //
    // 发送群消息
    //
    //Future<GenericResponseGroupMessageResponse> sendGroupMessageApiChatGroupSendPost_0({ GroupMessageCreate groupMessageCreate }) async
    test('test sendGroupMessageApiChatGroupSendPost_0', () async {
      // TODO
    });

  });
}
