import 'package:test/test.dart';
import 'package:lingdong_server/lingdong_server.dart';


/// tests for DefaultApi
void main() {
  final instance = LingdongServer().getDefaultApi();

  group(DefaultApi, () {
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

    // 审核成员加入申请
    //
    // 
    //
    //Future<GenericResponseDict> approveMemberApiCommunityCommunitiesCommunityIdMembersApprovePost(int communityId, { MembershipApproval membershipApproval }) async
    test('test approveMemberApiCommunityCommunitiesCommunityIdMembersApprovePost', () async {
      // TODO
    });

    // 审核成员加入申请
    //
    // 
    //
    //Future<GenericResponseDict> approveMemberApiCommunityCommunitiesCommunityIdMembersApprovePost_0(int communityId, { MembershipApproval membershipApproval }) async
    test('test approveMemberApiCommunityCommunitiesCommunityIdMembersApprovePost_0', () async {
      // TODO
    });

    // 审核成员加入申请
    //
    // 
    //
    //Future<GenericResponseDict> approveMemberApiCommunityCommunitiesCommunityIdMembersApprovePost_1(int communityId, { MembershipApproval membershipApproval }) async
    test('test approveMemberApiCommunityCommunitiesCommunityIdMembersApprovePost_1', () async {
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

    // 封禁成员
    //
    // 
    //
    //Future<GenericResponseDict> banMemberApiCommunityCommunitiesCommunityIdMembersMemberIdBanPost_0(int communityId, int memberId, { String comment }) async
    test('test banMemberApiCommunityCommunitiesCommunityIdMembersMemberIdBanPost_0', () async {
      // TODO
    });

    // 封禁成员
    //
    // 
    //
    //Future<GenericResponseDict> banMemberApiCommunityCommunitiesCommunityIdMembersMemberIdBanPost_1(int communityId, int memberId, { String comment }) async
    test('test banMemberApiCommunityCommunitiesCommunityIdMembersMemberIdBanPost_1', () async {
      // TODO
    });

    // 修改密码（需登录+旧密码）
    //
    // 
    //
    //Future<GenericResponseEmptyResponse> changePasswordApiAuthChangePasswordPost({ ChangePasswordRequest changePasswordRequest }) async
    test('test changePasswordApiAuthChangePasswordPost', () async {
      // TODO
    });

    // 修改密码（需登录+旧密码）
    //
    // 
    //
    //Future<GenericResponseEmptyResponse> changePasswordApiAuthChangePasswordPost_0({ ChangePasswordRequest changePasswordRequest }) async
    test('test changePasswordApiAuthChangePasswordPost_0', () async {
      // TODO
    });

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

    // 创建种类
    //
    // 创建种类  - **name**: 品种名称 - **english_name**: 品种英文名称 - **origin**: 品种产地(可选) - **group**: 犬种分组(可选) - **size**: 体型(可选) - **lifespan**: 寿命(可选) - **temperament**: 性格特征(可选) - **appearance**: 外貌特征(可选) - **care_level**: 饲养难度(1-5，可选) - **activity_level**: 活动量(1-5，可选) - **popularity**: 受欢迎程度(可选) - **is_popular**: 是否热门品种(可选) - **media**: 媒体资源ID列表(可选)
    //
    //Future<GenericResponseDogBreedOut> createBreedApiBreedReedsCreateBreedPost({ DogBreedCreate dogBreedCreate }) async
    test('test createBreedApiBreedReedsCreateBreedPost', () async {
      // TODO
    });

    // 创建种类
    //
    // 创建种类  - **name**: 品种名称 - **english_name**: 品种英文名称 - **origin**: 品种产地(可选) - **group**: 犬种分组(可选) - **size**: 体型(可选) - **lifespan**: 寿命(可选) - **temperament**: 性格特征(可选) - **appearance**: 外貌特征(可选) - **care_level**: 饲养难度(1-5，可选) - **activity_level**: 活动量(1-5，可选) - **popularity**: 受欢迎程度(可选) - **is_popular**: 是否热门品种(可选) - **media**: 媒体资源ID列表(可选)
    //
    //Future<GenericResponseDogBreedOut> createBreedApiBreedReedsCreateBreedPost_0({ DogBreedCreate dogBreedCreate }) async
    test('test createBreedApiBreedReedsCreateBreedPost_0', () async {
      // TODO
    });

    // 创建种类
    //
    // 创建种类  - **name**: 品种名称 - **english_name**: 品种英文名称 - **origin**: 品种产地(可选) - **group**: 犬种分组(可选) - **size**: 体型(可选) - **lifespan**: 寿命(可选) - **temperament**: 性格特征(可选) - **appearance**: 外貌特征(可选) - **care_level**: 饲养难度(1-5，可选) - **activity_level**: 活动量(1-5，可选) - **popularity**: 受欢迎程度(可选) - **is_popular**: 是否热门品种(可选) - **media**: 媒体资源ID列表(可选)
    //
    //Future<GenericResponseDogBreedOut> createBreedApiBreedReedsCreateBreedPost_1({ DogBreedCreate dogBreedCreate }) async
    test('test createBreedApiBreedReedsCreateBreedPost_1', () async {
      // TODO
    });

    // 创建种类
    //
    // 创建种类  - **name**: 品种名称 - **english_name**: 品种英文名称 - **origin**: 品种产地(可选) - **group**: 犬种分组(可选) - **size**: 体型(可选) - **lifespan**: 寿命(可选) - **temperament**: 性格特征(可选) - **appearance**: 外貌特征(可选) - **care_level**: 饲养难度(1-5，可选) - **activity_level**: 活动量(1-5，可选) - **popularity**: 受欢迎程度(可选) - **is_popular**: 是否热门品种(可选) - **media**: 媒体资源ID列表(可选)
    //
    //Future<GenericResponseDogBreedOut> createBreedApiBreedReedsCreateBreedPost_2({ DogBreedCreate dogBreedCreate }) async
    test('test createBreedApiBreedReedsCreateBreedPost_2', () async {
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

    // 创建社群
    //
    // 创建一个新的社群。 Args:     community (CommunityCreate): 包含社群信息的请求模型。     db (Session, optional): 数据库会话对象。     current_user (User, optional): 当前登录用户。  Returns:     GenericResponse[CommunityResponse]: 包含新创建社群信息的响应模型。
    //
    //Future<GenericResponseCommunityResponse> createCommunityApiCommunityCommunitiesPost_0({ CommunityCreate communityCreate }) async
    test('test createCommunityApiCommunityCommunitiesPost_0', () async {
      // TODO
    });

    // 创建社群
    //
    // 创建一个新的社群。 Args:     community (CommunityCreate): 包含社群信息的请求模型。     db (Session, optional): 数据库会话对象。     current_user (User, optional): 当前登录用户。  Returns:     GenericResponse[CommunityResponse]: 包含新创建社群信息的响应模型。
    //
    //Future<GenericResponseCommunityResponse> createCommunityApiCommunityCommunitiesPost_1({ CommunityCreate communityCreate }) async
    test('test createCommunityApiCommunityCommunitiesPost_1', () async {
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

    // 发布社群动态
    //
    // 
    //
    //Future<GenericResponsePostResponse> createCommunityPostApiCommunityCommunitiesCommunityIdPostsPost_0(int communityId, { PostCreate postCreate }) async
    test('test createCommunityPostApiCommunityCommunitiesCommunityIdPostsPost_0', () async {
      // TODO
    });

    // 发布社群动态
    //
    // 
    //
    //Future<GenericResponsePostResponse> createCommunityPostApiCommunityCommunitiesCommunityIdPostsPost_1(int communityId, { PostCreate postCreate }) async
    test('test createCommunityPostApiCommunityCommunitiesCommunityIdPostsPost_1', () async {
      // TODO
    });

    // 创建就诊记录
    //
    // 创建就诊记录
    //
    //Future<GenericResponseConsultationResponse> createConsultationRecordApiPetCreateConsultationRecordPost({ ConsultationCreate consultationCreate }) async
    test('test createConsultationRecordApiPetCreateConsultationRecordPost', () async {
      // TODO
    });

    // 创建就诊记录
    //
    // 创建就诊记录
    //
    //Future<GenericResponseConsultationResponse> createConsultationRecordApiPetCreateConsultationRecordPost_0({ ConsultationCreate consultationCreate }) async
    test('test createConsultationRecordApiPetCreateConsultationRecordPost_0', () async {
      // TODO
    });

    // 创建就诊记录
    //
    // 创建就诊记录
    //
    //Future<GenericResponseConsultationResponse> createConsultationRecordApiPetCreateConsultationRecordPost_1({ ConsultationCreate consultationCreate }) async
    test('test createConsultationRecordApiPetCreateConsultationRecordPost_1', () async {
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

    // 创建驱虫记录
    //
    // 创建驱虫记录
    //
    //Future<GenericResponseDewormingRecordResponse> createDewormingRecordApiPetCreateDewormingRecordPost({ DewormingRecordCreate dewormingRecordCreate }) async
    test('test createDewormingRecordApiPetCreateDewormingRecordPost', () async {
      // TODO
    });

    // 创建驱虫记录
    //
    // 创建驱虫记录
    //
    //Future<GenericResponseDewormingRecordResponse> createDewormingRecordApiPetCreateDewormingRecordPost_0({ DewormingRecordCreate dewormingRecordCreate }) async
    test('test createDewormingRecordApiPetCreateDewormingRecordPost_0', () async {
      // TODO
    });

    // 创建驱虫记录
    //
    // 创建驱虫记录
    //
    //Future<GenericResponseDewormingRecordResponse> createDewormingRecordApiPetCreateDewormingRecordPost_1({ DewormingRecordCreate dewormingRecordCreate }) async
    test('test createDewormingRecordApiPetCreateDewormingRecordPost_1', () async {
      // TODO
    });

    // 创建广场动态
    //
    // 
    //
    //Future<GenericResponsePostResponse> createDynamicApiDynamicsCreateDynamicPost({ PostCreate postCreate }) async
    test('test createDynamicApiDynamicsCreateDynamicPost', () async {
      // TODO
    });

    // 创建广场动态
    //
    // 
    //
    //Future<GenericResponsePostResponse> createDynamicApiDynamicsCreateDynamicPost_0({ PostCreate postCreate }) async
    test('test createDynamicApiDynamicsCreateDynamicPost_0', () async {
      // TODO
    });

    // 创建广场动态
    //
    // 
    //
    //Future<GenericResponsePostResponse> createDynamicApiDynamicsCreateDynamicPost_1({ PostCreate postCreate }) async
    test('test createDynamicApiDynamicsCreateDynamicPost_1', () async {
      // TODO
    });

    // 创建体检记录
    //
    // 创建体检记录
    //
    //Future<GenericResponseExaminationRecordResponse> createExaminationRecordApiPetCreateExaminationRecordPost({ ExaminationRecordCreate examinationRecordCreate }) async
    test('test createExaminationRecordApiPetCreateExaminationRecordPost', () async {
      // TODO
    });

    // 创建体检记录
    //
    // 创建体检记录
    //
    //Future<GenericResponseExaminationRecordResponse> createExaminationRecordApiPetCreateExaminationRecordPost_0({ ExaminationRecordCreate examinationRecordCreate }) async
    test('test createExaminationRecordApiPetCreateExaminationRecordPost_0', () async {
      // TODO
    });

    // 创建体检记录
    //
    // 创建体检记录
    //
    //Future<GenericResponseExaminationRecordResponse> createExaminationRecordApiPetCreateExaminationRecordPost_1({ ExaminationRecordCreate examinationRecordCreate }) async
    test('test createExaminationRecordApiPetCreateExaminationRecordPost_1', () async {
      // TODO
    });

    // 创建美容养护记录
    //
    // 创建美容养护记录
    //
    //Future<GenericResponseBeautificationRecordResponse> createGroomingRecordApiPetCreateGroomingRecordPost({ BeautificationRecordCreate beautificationRecordCreate }) async
    test('test createGroomingRecordApiPetCreateGroomingRecordPost', () async {
      // TODO
    });

    // 创建美容养护记录
    //
    // 创建美容养护记录
    //
    //Future<GenericResponseBeautificationRecordResponse> createGroomingRecordApiPetCreateGroomingRecordPost_0({ BeautificationRecordCreate beautificationRecordCreate }) async
    test('test createGroomingRecordApiPetCreateGroomingRecordPost_0', () async {
      // TODO
    });

    // 创建美容养护记录
    //
    // 创建美容养护记录
    //
    //Future<GenericResponseBeautificationRecordResponse> createGroomingRecordApiPetCreateGroomingRecordPost_1({ BeautificationRecordCreate beautificationRecordCreate }) async
    test('test createGroomingRecordApiPetCreateGroomingRecordPost_1', () async {
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

    // 创建行为指南
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> createGuideApiBreedBehaviorGuidesCreateBehaviorGuidePost({ DogBehaviorGuideCreate dogBehaviorGuideCreate }) async
    test('test createGuideApiBreedBehaviorGuidesCreateBehaviorGuidePost', () async {
      // TODO
    });

    // 创建行为指南
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> createGuideApiBreedBehaviorGuidesCreateBehaviorGuidePost_0({ DogBehaviorGuideCreate dogBehaviorGuideCreate }) async
    test('test createGuideApiBreedBehaviorGuidesCreateBehaviorGuidePost_0', () async {
      // TODO
    });

    // 创建行为指南
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> createGuideApiBreedBehaviorGuidesCreateBehaviorGuidePost_1({ DogBehaviorGuideCreate dogBehaviorGuideCreate }) async
    test('test createGuideApiBreedBehaviorGuidesCreateBehaviorGuidePost_1', () async {
      // TODO
    });

    // 创建行为指南
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> createGuideApiBreedBehaviorGuidesCreateBehaviorGuidePost_2({ DogBehaviorGuideCreate dogBehaviorGuideCreate }) async
    test('test createGuideApiBreedBehaviorGuidesCreateBehaviorGuidePost_2', () async {
      // TODO
    });

    // 创建护理指南
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> createGuideApiBreedCareGuidesCreateDogCareGuidePost({ DogCareGuideCreate dogCareGuideCreate }) async
    test('test createGuideApiBreedCareGuidesCreateDogCareGuidePost', () async {
      // TODO
    });

    // 创建护理指南
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> createGuideApiBreedCareGuidesCreateDogCareGuidePost_0({ DogCareGuideCreate dogCareGuideCreate }) async
    test('test createGuideApiBreedCareGuidesCreateDogCareGuidePost_0', () async {
      // TODO
    });

    // 创建护理指南
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> createGuideApiBreedCareGuidesCreateDogCareGuidePost_1({ DogCareGuideCreate dogCareGuideCreate }) async
    test('test createGuideApiBreedCareGuidesCreateDogCareGuidePost_1', () async {
      // TODO
    });

    // 创建护理指南
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> createGuideApiBreedCareGuidesCreateDogCareGuidePost_2({ DogCareGuideCreate dogCareGuideCreate }) async
    test('test createGuideApiBreedCareGuidesCreateDogCareGuidePost_2', () async {
      // TODO
    });

    // 创建训练指南
    //
    // 
    //
    //Future<DogTrainingGuideOut> createGuideApiBreedTrainingGuidesCreateTrainingGuidePost({ DogTrainingGuideCreate dogTrainingGuideCreate }) async
    test('test createGuideApiBreedTrainingGuidesCreateTrainingGuidePost', () async {
      // TODO
    });

    // 创建训练指南
    //
    // 
    //
    //Future<DogTrainingGuideOut> createGuideApiBreedTrainingGuidesCreateTrainingGuidePost_0({ DogTrainingGuideCreate dogTrainingGuideCreate }) async
    test('test createGuideApiBreedTrainingGuidesCreateTrainingGuidePost_0', () async {
      // TODO
    });

    // 创建训练指南
    //
    // 
    //
    //Future<DogTrainingGuideOut> createGuideApiBreedTrainingGuidesCreateTrainingGuidePost_1({ DogTrainingGuideCreate dogTrainingGuideCreate }) async
    test('test createGuideApiBreedTrainingGuidesCreateTrainingGuidePost_1', () async {
      // TODO
    });

    // 创建训练指南
    //
    // 
    //
    //Future<DogTrainingGuideOut> createGuideApiBreedTrainingGuidesCreateTrainingGuidePost_2({ DogTrainingGuideCreate dogTrainingGuideCreate }) async
    test('test createGuideApiBreedTrainingGuidesCreateTrainingGuidePost_2', () async {
      // TODO
    });

    // 创建行为风格
    //
    // 创建新的行为风格 :param behavior_style: 行为风格创建模型 :param db: 数据库会话 :param user: 当前用户 :return: 行为风格信息
    //
    //Future<GenericResponseBehaviorStyleResponse> createNewBehaviorStyleApiEnumsBehaviorStylesPost({ BehaviorStyleCreate behaviorStyleCreate }) async
    test('test createNewBehaviorStyleApiEnumsBehaviorStylesPost', () async {
      // TODO
    });

    // 创建行为风格
    //
    // 创建新的行为风格 :param behavior_style: 行为风格创建模型 :param db: 数据库会话 :param user: 当前用户 :return: 行为风格信息
    //
    //Future<GenericResponseBehaviorStyleResponse> createNewBehaviorStyleApiEnumsBehaviorStylesPost_0({ BehaviorStyleCreate behaviorStyleCreate }) async
    test('test createNewBehaviorStyleApiEnumsBehaviorStylesPost_0', () async {
      // TODO
    });

    // 创建行为风格
    //
    // 创建新的行为风格 :param behavior_style: 行为风格创建模型 :param db: 数据库会话 :param user: 当前用户 :return: 行为风格信息
    //
    //Future<GenericResponseBehaviorStyleResponse> createNewBehaviorStyleApiEnumsBehaviorStylesPost_1({ BehaviorStyleCreate behaviorStyleCreate }) async
    test('test createNewBehaviorStyleApiEnumsBehaviorStylesPost_1', () async {
      // TODO
    });

    // 创建性格特征
    //
    // 创建新的性格特征 :param personality: 性格特征创建模型 :param db: 数据库会话 :param user: 当前用户 :return: 性格特征信息
    //
    //Future<GenericResponsePersonalityResponse> createNewPersonalityApiEnumsPersonalitiesPost({ PersonalityCreate personalityCreate }) async
    test('test createNewPersonalityApiEnumsPersonalitiesPost', () async {
      // TODO
    });

    // 创建性格特征
    //
    // 创建新的性格特征 :param personality: 性格特征创建模型 :param db: 数据库会话 :param user: 当前用户 :return: 性格特征信息
    //
    //Future<GenericResponsePersonalityResponse> createNewPersonalityApiEnumsPersonalitiesPost_0({ PersonalityCreate personalityCreate }) async
    test('test createNewPersonalityApiEnumsPersonalitiesPost_0', () async {
      // TODO
    });

    // 创建性格特征
    //
    // 创建新的性格特征 :param personality: 性格特征创建模型 :param db: 数据库会话 :param user: 当前用户 :return: 性格特征信息
    //
    //Future<GenericResponsePersonalityResponse> createNewPersonalityApiEnumsPersonalitiesPost_1({ PersonalityCreate personalityCreate }) async
    test('test createNewPersonalityApiEnumsPersonalitiesPost_1', () async {
      // TODO
    });

    // 创建任务类型
    //
    // 创建新的任务类型 :param task_type: 任务类型创建模型 :param db: 数据库会话 :param user: 当前用户 :return: 任务类型信息
    //
    //Future<GenericResponseTaskTypeResponse> createNewTaskTypeApiEnumsTaskTypesPost({ TaskTypeCreate taskTypeCreate }) async
    test('test createNewTaskTypeApiEnumsTaskTypesPost', () async {
      // TODO
    });

    // 创建任务类型
    //
    // 创建新的任务类型 :param task_type: 任务类型创建模型 :param db: 数据库会话 :param user: 当前用户 :return: 任务类型信息
    //
    //Future<GenericResponseTaskTypeResponse> createNewTaskTypeApiEnumsTaskTypesPost_0({ TaskTypeCreate taskTypeCreate }) async
    test('test createNewTaskTypeApiEnumsTaskTypesPost_0', () async {
      // TODO
    });

    // 创建任务类型
    //
    // 创建新的任务类型 :param task_type: 任务类型创建模型 :param db: 数据库会话 :param user: 当前用户 :return: 任务类型信息
    //
    //Future<GenericResponseTaskTypeResponse> createNewTaskTypeApiEnumsTaskTypesPost_1({ TaskTypeCreate taskTypeCreate }) async
    test('test createNewTaskTypeApiEnumsTaskTypesPost_1', () async {
      // TODO
    });

    // 创建其他健康记录
    //
    // 创建其他健康记录
    //
    //Future<GenericResponseOtherHealthRecordResponse> createOtherHealthRecordApiPetCreateOtherHealthRecordPost({ OtherHealthRecordCreate otherHealthRecordCreate }) async
    test('test createOtherHealthRecordApiPetCreateOtherHealthRecordPost', () async {
      // TODO
    });

    // 创建其他健康记录
    //
    // 创建其他健康记录
    //
    //Future<GenericResponseOtherHealthRecordResponse> createOtherHealthRecordApiPetCreateOtherHealthRecordPost_0({ OtherHealthRecordCreate otherHealthRecordCreate }) async
    test('test createOtherHealthRecordApiPetCreateOtherHealthRecordPost_0', () async {
      // TODO
    });

    // 创建其他健康记录
    //
    // 创建其他健康记录
    //
    //Future<GenericResponseOtherHealthRecordResponse> createOtherHealthRecordApiPetCreateOtherHealthRecordPost_1({ OtherHealthRecordCreate otherHealthRecordCreate }) async
    test('test createOtherHealthRecordApiPetCreateOtherHealthRecordPost_1', () async {
      // TODO
    });

    // 创建顶级评论
    //
    // 创建对指定动态的顶级评论
    //
    //Future<GenericResponseParentComment> createParentCommentApiDynamicsPostsParentCommentsPost({ ParentCommentCreate parentCommentCreate }) async
    test('test createParentCommentApiDynamicsPostsParentCommentsPost', () async {
      // TODO
    });

    // 创建顶级评论
    //
    // 创建对指定动态的顶级评论
    //
    //Future<GenericResponseParentComment> createParentCommentApiDynamicsPostsParentCommentsPost_0({ ParentCommentCreate parentCommentCreate }) async
    test('test createParentCommentApiDynamicsPostsParentCommentsPost_0', () async {
      // TODO
    });

    // 创建顶级评论
    //
    // 创建对指定动态的顶级评论
    //
    //Future<GenericResponseParentComment> createParentCommentApiDynamicsPostsParentCommentsPost_1({ ParentCommentCreate parentCommentCreate }) async
    test('test createParentCommentApiDynamicsPostsParentCommentsPost_1', () async {
      // TODO
    });

    // 创建宠物档案
    //
    // 
    //
    //Future<GenericResponsePetResponse> createPetApiPetProfilePost({ PetCreate petCreate }) async
    test('test createPetApiPetProfilePost', () async {
      // TODO
    });

    // 创建宠物档案
    //
    // 
    //
    //Future<GenericResponsePetResponse> createPetApiPetProfilePost_0({ PetCreate petCreate }) async
    test('test createPetApiPetProfilePost_0', () async {
      // TODO
    });

    // 创建宠物档案
    //
    // 
    //
    //Future<GenericResponsePetResponse> createPetApiPetProfilePost_1({ PetCreate petCreate }) async
    test('test createPetApiPetProfilePost_1', () async {
      // TODO
    });

    // 创建宠物友好场所
    //
    // 创建新的宠物友好场所
    //
    //Future<GenericResponsePlaceResponse> createPlaceApiExplorePlacesPost({ PlaceCreate placeCreate }) async
    test('test createPlaceApiExplorePlacesPost', () async {
      // TODO
    });

    // 创建宠物友好场所
    //
    // 创建新的宠物友好场所
    //
    //Future<GenericResponsePlaceResponse> createPlaceApiExplorePlacesPost_0({ PlaceCreate placeCreate }) async
    test('test createPlaceApiExplorePlacesPost_0', () async {
      // TODO
    });

    // 创建宠物友好场所
    //
    // 创建新的宠物友好场所
    //
    //Future<GenericResponsePlaceResponse> createPlaceApiExplorePlacesPost_1({ PlaceCreate placeCreate }) async
    test('test createPlaceApiExplorePlacesPost_1', () async {
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

    // 创建回复
    //
    // 创建对指定评论的回复或回复其他回复
    //
    //Future<GenericResponseReply> createReplyApiDynamicsCommentsRepliesPost_0({ ReplyCreate replyCreate }) async
    test('test createReplyApiDynamicsCommentsRepliesPost_0', () async {
      // TODO
    });

    // 创建回复
    //
    // 创建对指定评论的回复或回复其他回复
    //
    //Future<GenericResponseReply> createReplyApiDynamicsCommentsRepliesPost_1({ ReplyCreate replyCreate }) async
    test('test createReplyApiDynamicsCommentsRepliesPost_1', () async {
      // TODO
    });

    // 创建年龄阶段
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> createStageApiBreedAgeStagesPost({ DogAgeStageCreate dogAgeStageCreate }) async
    test('test createStageApiBreedAgeStagesPost', () async {
      // TODO
    });

    // 创建年龄阶段
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> createStageApiBreedAgeStagesPost_0({ DogAgeStageCreate dogAgeStageCreate }) async
    test('test createStageApiBreedAgeStagesPost_0', () async {
      // TODO
    });

    // 创建年龄阶段
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> createStageApiBreedAgeStagesPost_1({ DogAgeStageCreate dogAgeStageCreate }) async
    test('test createStageApiBreedAgeStagesPost_1', () async {
      // TODO
    });

    // 创建年龄阶段
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> createStageApiBreedAgeStagesPost_2({ DogAgeStageCreate dogAgeStageCreate }) async
    test('test createStageApiBreedAgeStagesPost_2', () async {
      // TODO
    });

    // 创建标签
    //
    // 
    //
    //Future<GenericResponseTagResponse> createTagApiTagsCreateTagPost({ TagCreate tagCreate }) async
    test('test createTagApiTagsCreateTagPost', () async {
      // TODO
    });

    // 创建标签
    //
    // 
    //
    //Future<GenericResponseTagResponse> createTagApiTagsCreateTagPost_0({ TagCreate tagCreate }) async
    test('test createTagApiTagsCreateTagPost_0', () async {
      // TODO
    });

    // 创建标签
    //
    // 
    //
    //Future<GenericResponseTagResponse> createTagApiTagsCreateTagPost_1({ TagCreate tagCreate }) async
    test('test createTagApiTagsCreateTagPost_1', () async {
      // TODO
    });

    // 创建疫苗接种记录
    //
    // 创建疫苗接种记录
    //
    //Future<GenericResponseVaccinationRecordResponse> createVaccinationRecordApiPetCreateVaccinationRecordPost({ VaccinationRecordCreate vaccinationRecordCreate }) async
    test('test createVaccinationRecordApiPetCreateVaccinationRecordPost', () async {
      // TODO
    });

    // 创建疫苗接种记录
    //
    // 创建疫苗接种记录
    //
    //Future<GenericResponseVaccinationRecordResponse> createVaccinationRecordApiPetCreateVaccinationRecordPost_0({ VaccinationRecordCreate vaccinationRecordCreate }) async
    test('test createVaccinationRecordApiPetCreateVaccinationRecordPost_0', () async {
      // TODO
    });

    // 创建疫苗接种记录
    //
    // 创建疫苗接种记录
    //
    //Future<GenericResponseVaccinationRecordResponse> createVaccinationRecordApiPetCreateVaccinationRecordPost_1({ VaccinationRecordCreate vaccinationRecordCreate }) async
    test('test createVaccinationRecordApiPetCreateVaccinationRecordPost_1', () async {
      // TODO
    });

    // 创建体重记录
    //
    // 创建体重记录
    //
    //Future<GenericResponseWeightRecordResponse> createWeightRecordApiPetCreateWeightRecordPost({ WeightRecordCreate weightRecordCreate }) async
    test('test createWeightRecordApiPetCreateWeightRecordPost', () async {
      // TODO
    });

    // 创建体重记录
    //
    // 创建体重记录
    //
    //Future<GenericResponseWeightRecordResponse> createWeightRecordApiPetCreateWeightRecordPost_0({ WeightRecordCreate weightRecordCreate }) async
    test('test createWeightRecordApiPetCreateWeightRecordPost_0', () async {
      // TODO
    });

    // 创建体重记录
    //
    // 创建体重记录
    //
    //Future<GenericResponseWeightRecordResponse> createWeightRecordApiPetCreateWeightRecordPost_1({ WeightRecordCreate weightRecordCreate }) async
    test('test createWeightRecordApiPetCreateWeightRecordPost_1', () async {
      // TODO
    });

    // 删除种类
    //
    // 
    //
    //Future<GenericResponseDogBreedOut> deleteBreedApiBreedReedsDeleteBreedPost({ DogBreedDelete dogBreedDelete }) async
    test('test deleteBreedApiBreedReedsDeleteBreedPost', () async {
      // TODO
    });

    // 删除种类
    //
    // 
    //
    //Future<GenericResponseDogBreedOut> deleteBreedApiBreedReedsDeleteBreedPost_0({ DogBreedDelete dogBreedDelete }) async
    test('test deleteBreedApiBreedReedsDeleteBreedPost_0', () async {
      // TODO
    });

    // 删除种类
    //
    // 
    //
    //Future<GenericResponseDogBreedOut> deleteBreedApiBreedReedsDeleteBreedPost_1({ DogBreedDelete dogBreedDelete }) async
    test('test deleteBreedApiBreedReedsDeleteBreedPost_1', () async {
      // TODO
    });

    // 删除种类
    //
    // 
    //
    //Future<GenericResponseDogBreedOut> deleteBreedApiBreedReedsDeleteBreedPost_2({ DogBreedDelete dogBreedDelete }) async
    test('test deleteBreedApiBreedReedsDeleteBreedPost_2', () async {
      // TODO
    });

    // 删除就诊记录
    //
    // 删除就诊记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteConsultationRecordApiPetDeleteConsultationRecordRecordIdPost(int recordId) async
    test('test deleteConsultationRecordApiPetDeleteConsultationRecordRecordIdPost', () async {
      // TODO
    });

    // 删除就诊记录
    //
    // 删除就诊记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteConsultationRecordApiPetDeleteConsultationRecordRecordIdPost_0(int recordId) async
    test('test deleteConsultationRecordApiPetDeleteConsultationRecordRecordIdPost_0', () async {
      // TODO
    });

    // 删除就诊记录
    //
    // 删除就诊记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteConsultationRecordApiPetDeleteConsultationRecordRecordIdPost_1(int recordId) async
    test('test deleteConsultationRecordApiPetDeleteConsultationRecordRecordIdPost_1', () async {
      // TODO
    });

    // 删除驱虫记录
    //
    // 删除驱虫记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteDewormingRecordApiPetDeleteDewormingRecordRecordIdPost(int recordId) async
    test('test deleteDewormingRecordApiPetDeleteDewormingRecordRecordIdPost', () async {
      // TODO
    });

    // 删除驱虫记录
    //
    // 删除驱虫记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteDewormingRecordApiPetDeleteDewormingRecordRecordIdPost_0(int recordId) async
    test('test deleteDewormingRecordApiPetDeleteDewormingRecordRecordIdPost_0', () async {
      // TODO
    });

    // 删除驱虫记录
    //
    // 删除驱虫记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteDewormingRecordApiPetDeleteDewormingRecordRecordIdPost_1(int recordId) async
    test('test deleteDewormingRecordApiPetDeleteDewormingRecordRecordIdPost_1', () async {
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

    // 删除动态
    //
    // 
    //
    //Future<GenericResponseDict> deleteDynamicApiDynamicsPostIdDeleteDynamicPost_0(int postId) async
    test('test deleteDynamicApiDynamicsPostIdDeleteDynamicPost_0', () async {
      // TODO
    });

    // 删除动态
    //
    // 
    //
    //Future<GenericResponseDict> deleteDynamicApiDynamicsPostIdDeleteDynamicPost_1(int postId) async
    test('test deleteDynamicApiDynamicsPostIdDeleteDynamicPost_1', () async {
      // TODO
    });

    // 删除体检记录
    //
    // 删除体检记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteExaminationRecordApiPetDeleteExaminationRecordRecordIdPost(int recordId) async
    test('test deleteExaminationRecordApiPetDeleteExaminationRecordRecordIdPost', () async {
      // TODO
    });

    // 删除体检记录
    //
    // 删除体检记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteExaminationRecordApiPetDeleteExaminationRecordRecordIdPost_0(int recordId) async
    test('test deleteExaminationRecordApiPetDeleteExaminationRecordRecordIdPost_0', () async {
      // TODO
    });

    // 删除体检记录
    //
    // 删除体检记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteExaminationRecordApiPetDeleteExaminationRecordRecordIdPost_1(int recordId) async
    test('test deleteExaminationRecordApiPetDeleteExaminationRecordRecordIdPost_1', () async {
      // TODO
    });

    // 删除美容养护记录
    //
    // 删除美容养护记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteGroomingRecordApiPetDeleteGroomingRecordRecordIdPost(int recordId) async
    test('test deleteGroomingRecordApiPetDeleteGroomingRecordRecordIdPost', () async {
      // TODO
    });

    // 删除美容养护记录
    //
    // 删除美容养护记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteGroomingRecordApiPetDeleteGroomingRecordRecordIdPost_0(int recordId) async
    test('test deleteGroomingRecordApiPetDeleteGroomingRecordRecordIdPost_0', () async {
      // TODO
    });

    // 删除美容养护记录
    //
    // 删除美容养护记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteGroomingRecordApiPetDeleteGroomingRecordRecordIdPost_1(int recordId) async
    test('test deleteGroomingRecordApiPetDeleteGroomingRecordRecordIdPost_1', () async {
      // TODO
    });

    // 删除行为指南
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> deleteGuideApiBreedBehaviorGuidesDeleteBehaviorGuidePost({ DogBehaviorGuideBase dogBehaviorGuideBase }) async
    test('test deleteGuideApiBreedBehaviorGuidesDeleteBehaviorGuidePost', () async {
      // TODO
    });

    // 删除行为指南
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> deleteGuideApiBreedBehaviorGuidesDeleteBehaviorGuidePost_0({ DogBehaviorGuideBase dogBehaviorGuideBase }) async
    test('test deleteGuideApiBreedBehaviorGuidesDeleteBehaviorGuidePost_0', () async {
      // TODO
    });

    // 删除行为指南
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> deleteGuideApiBreedBehaviorGuidesDeleteBehaviorGuidePost_1({ DogBehaviorGuideBase dogBehaviorGuideBase }) async
    test('test deleteGuideApiBreedBehaviorGuidesDeleteBehaviorGuidePost_1', () async {
      // TODO
    });

    // 删除行为指南
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> deleteGuideApiBreedBehaviorGuidesDeleteBehaviorGuidePost_2({ DogBehaviorGuideBase dogBehaviorGuideBase }) async
    test('test deleteGuideApiBreedBehaviorGuidesDeleteBehaviorGuidePost_2', () async {
      // TODO
    });

    // 删除护理指南
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> deleteGuideApiBreedCareGuidesDeleteCareGuidePost({ DogCareGuideBase dogCareGuideBase }) async
    test('test deleteGuideApiBreedCareGuidesDeleteCareGuidePost', () async {
      // TODO
    });

    // 删除护理指南
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> deleteGuideApiBreedCareGuidesDeleteCareGuidePost_0({ DogCareGuideBase dogCareGuideBase }) async
    test('test deleteGuideApiBreedCareGuidesDeleteCareGuidePost_0', () async {
      // TODO
    });

    // 删除护理指南
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> deleteGuideApiBreedCareGuidesDeleteCareGuidePost_1({ DogCareGuideBase dogCareGuideBase }) async
    test('test deleteGuideApiBreedCareGuidesDeleteCareGuidePost_1', () async {
      // TODO
    });

    // 删除护理指南
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> deleteGuideApiBreedCareGuidesDeleteCareGuidePost_2({ DogCareGuideBase dogCareGuideBase }) async
    test('test deleteGuideApiBreedCareGuidesDeleteCareGuidePost_2', () async {
      // TODO
    });

    // 删除训练指南
    //
    // 
    //
    //Future<DogTrainingGuideOut> deleteGuideApiBreedTrainingGuidesDeleteTrainingGuideGuideIdPost(int guideId) async
    test('test deleteGuideApiBreedTrainingGuidesDeleteTrainingGuideGuideIdPost', () async {
      // TODO
    });

    // 删除训练指南
    //
    // 
    //
    //Future<DogTrainingGuideOut> deleteGuideApiBreedTrainingGuidesDeleteTrainingGuideGuideIdPost_0(int guideId) async
    test('test deleteGuideApiBreedTrainingGuidesDeleteTrainingGuideGuideIdPost_0', () async {
      // TODO
    });

    // 删除训练指南
    //
    // 
    //
    //Future<DogTrainingGuideOut> deleteGuideApiBreedTrainingGuidesDeleteTrainingGuideGuideIdPost_1(int guideId) async
    test('test deleteGuideApiBreedTrainingGuidesDeleteTrainingGuideGuideIdPost_1', () async {
      // TODO
    });

    // 删除训练指南
    //
    // 
    //
    //Future<DogTrainingGuideOut> deleteGuideApiBreedTrainingGuidesDeleteTrainingGuideGuideIdPost_2(int guideId) async
    test('test deleteGuideApiBreedTrainingGuidesDeleteTrainingGuideGuideIdPost_2', () async {
      // TODO
    });

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

    // 删除其他健康记录
    //
    // 删除其他健康记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteOtherHealthRecordApiPetDeleteOtherHealthRecordRecordIdPost(int recordId) async
    test('test deleteOtherHealthRecordApiPetDeleteOtherHealthRecordRecordIdPost', () async {
      // TODO
    });

    // 删除其他健康记录
    //
    // 删除其他健康记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteOtherHealthRecordApiPetDeleteOtherHealthRecordRecordIdPost_0(int recordId) async
    test('test deleteOtherHealthRecordApiPetDeleteOtherHealthRecordRecordIdPost_0', () async {
      // TODO
    });

    // 删除其他健康记录
    //
    // 删除其他健康记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteOtherHealthRecordApiPetDeleteOtherHealthRecordRecordIdPost_1(int recordId) async
    test('test deleteOtherHealthRecordApiPetDeleteOtherHealthRecordRecordIdPost_1', () async {
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

    // 删除顶级评论
    //
    // 删除指定的顶级评论，包括评论的所有回复
    //
    //Future<GenericResponseBool> deleteParentCommentApiDynamicsParentCommentsCommentIdDelete_0(int commentId) async
    test('test deleteParentCommentApiDynamicsParentCommentsCommentIdDelete_0', () async {
      // TODO
    });

    // 删除顶级评论
    //
    // 删除指定的顶级评论，包括评论的所有回复
    //
    //Future<GenericResponseBool> deleteParentCommentApiDynamicsParentCommentsCommentIdDelete_1(int commentId) async
    test('test deleteParentCommentApiDynamicsParentCommentsCommentIdDelete_1', () async {
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

    // 删除回复
    //
    // 删除指定的回复
    //
    //Future<GenericResponseBool> deleteReplyApiDynamicsRepliesReplyIdDeletePost_0(int replyId) async
    test('test deleteReplyApiDynamicsRepliesReplyIdDeletePost_0', () async {
      // TODO
    });

    // 删除回复
    //
    // 删除指定的回复
    //
    //Future<GenericResponseBool> deleteReplyApiDynamicsRepliesReplyIdDeletePost_1(int replyId) async
    test('test deleteReplyApiDynamicsRepliesReplyIdDeletePost_1', () async {
      // TODO
    });

    // 删除年龄阶段
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> deleteStageApiBreedAgeStagesDeleteAgeStagePost({ DogAgeStageBase dogAgeStageBase }) async
    test('test deleteStageApiBreedAgeStagesDeleteAgeStagePost', () async {
      // TODO
    });

    // 删除年龄阶段
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> deleteStageApiBreedAgeStagesDeleteAgeStagePost_0({ DogAgeStageBase dogAgeStageBase }) async
    test('test deleteStageApiBreedAgeStagesDeleteAgeStagePost_0', () async {
      // TODO
    });

    // 删除年龄阶段
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> deleteStageApiBreedAgeStagesDeleteAgeStagePost_1({ DogAgeStageBase dogAgeStageBase }) async
    test('test deleteStageApiBreedAgeStagesDeleteAgeStagePost_1', () async {
      // TODO
    });

    // 删除年龄阶段
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> deleteStageApiBreedAgeStagesDeleteAgeStagePost_2({ DogAgeStageBase dogAgeStageBase }) async
    test('test deleteStageApiBreedAgeStagesDeleteAgeStagePost_2', () async {
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

    // 删除标签
    //
    // 
    //
    //Future<GenericResponseDict> deleteTagApiTagsDeleteTagTagIdPost_0(int tagId) async
    test('test deleteTagApiTagsDeleteTagTagIdPost_0', () async {
      // TODO
    });

    // 删除标签
    //
    // 
    //
    //Future<GenericResponseDict> deleteTagApiTagsDeleteTagTagIdPost_1(int tagId) async
    test('test deleteTagApiTagsDeleteTagTagIdPost_1', () async {
      // TODO
    });

    // 删除疫苗接种记录
    //
    // 删除疫苗接种记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteVaccinationRecordApiPetDeleteVaccinationRecordRecordIdPost(int recordId) async
    test('test deleteVaccinationRecordApiPetDeleteVaccinationRecordRecordIdPost', () async {
      // TODO
    });

    // 删除疫苗接种记录
    //
    // 删除疫苗接种记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteVaccinationRecordApiPetDeleteVaccinationRecordRecordIdPost_0(int recordId) async
    test('test deleteVaccinationRecordApiPetDeleteVaccinationRecordRecordIdPost_0', () async {
      // TODO
    });

    // 删除疫苗接种记录
    //
    // 删除疫苗接种记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteVaccinationRecordApiPetDeleteVaccinationRecordRecordIdPost_1(int recordId) async
    test('test deleteVaccinationRecordApiPetDeleteVaccinationRecordRecordIdPost_1', () async {
      // TODO
    });

    // 删除体重记录
    //
    // 删除体重记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteWeightRecordApiPetDeleteWeightRecordRecordIdPost(int recordId) async
    test('test deleteWeightRecordApiPetDeleteWeightRecordRecordIdPost', () async {
      // TODO
    });

    // 删除体重记录
    //
    // 删除体重记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteWeightRecordApiPetDeleteWeightRecordRecordIdPost_0(int recordId) async
    test('test deleteWeightRecordApiPetDeleteWeightRecordRecordIdPost_0', () async {
      // TODO
    });

    // 删除体重记录
    //
    // 删除体重记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteWeightRecordApiPetDeleteWeightRecordRecordIdPost_1(int recordId) async
    test('test deleteWeightRecordApiPetDeleteWeightRecordRecordIdPost_1', () async {
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

    // 获取顶级评论下的回复
    //
    // 获取指定顶级评论下的回复，支持分页，返回平铺形式的回复数据（包含回复人和被回复人信息）
    //
    //Future<GenericResponseDict> getCommentRepliesApiDynamicsCommentsParentCommentIdRepliesGet(int parentCommentId, { int skip, int limit }) async
    test('test getCommentRepliesApiDynamicsCommentsParentCommentIdRepliesGet', () async {
      // TODO
    });

    // 获取顶级评论下的回复
    //
    // 获取指定顶级评论下的回复，支持分页，返回平铺形式的回复数据（包含回复人和被回复人信息）
    //
    //Future<GenericResponseDict> getCommentRepliesApiDynamicsCommentsParentCommentIdRepliesGet_0(int parentCommentId, { int skip, int limit }) async
    test('test getCommentRepliesApiDynamicsCommentsParentCommentIdRepliesGet_0', () async {
      // TODO
    });

    // 获取顶级评论下的回复
    //
    // 获取指定顶级评论下的回复，支持分页，返回平铺形式的回复数据（包含回复人和被回复人信息）
    //
    //Future<GenericResponseDict> getCommentRepliesApiDynamicsCommentsParentCommentIdRepliesGet_1(int parentCommentId, { int skip, int limit }) async
    test('test getCommentRepliesApiDynamicsCommentsParentCommentIdRepliesGet_1', () async {
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

    // 获取社群列表
    //
    // 
    //
    //Future<GenericResponseCommunityListResponse> getCommunitiesApiCommunityCommunitiesGet_0({ int skip, int limit, String search }) async
    test('test getCommunitiesApiCommunityCommunitiesGet_0', () async {
      // TODO
    });

    // 获取社群列表
    //
    // 
    //
    //Future<GenericResponseCommunityListResponse> getCommunitiesApiCommunityCommunitiesGet_1({ int skip, int limit, String search }) async
    test('test getCommunitiesApiCommunityCommunitiesGet_1', () async {
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

    // 获取社群详情
    //
    // 
    //
    //Future<GenericResponseCommunityDetailResponse> getCommunityDetailApiCommunityCommunitiesCommunityIdGet_0(int communityId) async
    test('test getCommunityDetailApiCommunityCommunitiesCommunityIdGet_0', () async {
      // TODO
    });

    // 获取社群详情
    //
    // 
    //
    //Future<GenericResponseCommunityDetailResponse> getCommunityDetailApiCommunityCommunitiesCommunityIdGet_1(int communityId) async
    test('test getCommunityDetailApiCommunityCommunitiesCommunityIdGet_1', () async {
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

    // 获取社群成员列表
    //
    // 
    //
    //Future<GenericResponseCommunityMemberListResponse> getCommunityMembersApiCommunityCommunitiesCommunityIdMembersGet_0(int communityId, { int skip, int limit, String role, String status }) async
    test('test getCommunityMembersApiCommunityCommunitiesCommunityIdMembersGet_0', () async {
      // TODO
    });

    // 获取社群成员列表
    //
    // 
    //
    //Future<GenericResponseCommunityMemberListResponse> getCommunityMembersApiCommunityCommunitiesCommunityIdMembersGet_1(int communityId, { int skip, int limit, String role, String status }) async
    test('test getCommunityMembersApiCommunityCommunitiesCommunityIdMembersGet_1', () async {
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

    // 获取社群动态
    //
    // 
    //
    //Future<GenericResponsePostListResponse> getCommunityPostsApiCommunityCommunitiesCommunityIdPostsGet_0(int communityId, { int page, int limit }) async
    test('test getCommunityPostsApiCommunityCommunitiesCommunityIdPostsGet_0', () async {
      // TODO
    });

    // 获取社群动态
    //
    // 
    //
    //Future<GenericResponsePostListResponse> getCommunityPostsApiCommunityCommunitiesCommunityIdPostsGet_1(int communityId, { int page, int limit }) async
    test('test getCommunityPostsApiCommunityCommunitiesCommunityIdPostsGet_1', () async {
      // TODO
    });

    // 获取就诊记录
    //
    // 获取就诊记录
    //
    //Future<GenericResponseConsultationResponse> getConsultationRecordApiPetGetConsultationRecordRecordIdGet(int recordId) async
    test('test getConsultationRecordApiPetGetConsultationRecordRecordIdGet', () async {
      // TODO
    });

    // 获取就诊记录
    //
    // 获取就诊记录
    //
    //Future<GenericResponseConsultationResponse> getConsultationRecordApiPetGetConsultationRecordRecordIdGet_0(int recordId) async
    test('test getConsultationRecordApiPetGetConsultationRecordRecordIdGet_0', () async {
      // TODO
    });

    // 获取就诊记录
    //
    // 获取就诊记录
    //
    //Future<GenericResponseConsultationResponse> getConsultationRecordApiPetGetConsultationRecordRecordIdGet_1(int recordId) async
    test('test getConsultationRecordApiPetGetConsultationRecordRecordIdGet_1', () async {
      // TODO
    });

    // 根据宠物ID获取就诊记录列表（分页）
    //
    // 根据宠物ID获取就诊记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseConsultationResponse> getConsultationRecordsByPetApiPetGetConsultationRecordsByPetPetIdGet(int petId, { int skip, int size }) async
    test('test getConsultationRecordsByPetApiPetGetConsultationRecordsByPetPetIdGet', () async {
      // TODO
    });

    // 根据宠物ID获取就诊记录列表（分页）
    //
    // 根据宠物ID获取就诊记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseConsultationResponse> getConsultationRecordsByPetApiPetGetConsultationRecordsByPetPetIdGet_0(int petId, { int skip, int size }) async
    test('test getConsultationRecordsByPetApiPetGetConsultationRecordsByPetPetIdGet_0', () async {
      // TODO
    });

    // 根据宠物ID获取就诊记录列表（分页）
    //
    // 根据宠物ID获取就诊记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseConsultationResponse> getConsultationRecordsByPetApiPetGetConsultationRecordsByPetPetIdGet_1(int petId, { int skip, int size }) async
    test('test getConsultationRecordsByPetApiPetGetConsultationRecordsByPetPetIdGet_1', () async {
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

    // 获取驱虫记录
    //
    // 获取驱虫记录
    //
    //Future<GenericResponseDewormingRecordResponse> getDewormingRecordApiPetGetDewormingRecordRecordIdGet(int recordId) async
    test('test getDewormingRecordApiPetGetDewormingRecordRecordIdGet', () async {
      // TODO
    });

    // 获取驱虫记录
    //
    // 获取驱虫记录
    //
    //Future<GenericResponseDewormingRecordResponse> getDewormingRecordApiPetGetDewormingRecordRecordIdGet_0(int recordId) async
    test('test getDewormingRecordApiPetGetDewormingRecordRecordIdGet_0', () async {
      // TODO
    });

    // 获取驱虫记录
    //
    // 获取驱虫记录
    //
    //Future<GenericResponseDewormingRecordResponse> getDewormingRecordApiPetGetDewormingRecordRecordIdGet_1(int recordId) async
    test('test getDewormingRecordApiPetGetDewormingRecordRecordIdGet_1', () async {
      // TODO
    });

    // 根据宠物ID获取驱虫记录列表（分页）
    //
    // 根据宠物ID获取驱虫记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseDewormingRecordResponse> getDewormingRecordsByPetApiPetGetDewormingRecordsByPetPetIdGet(int petId, { int skip, int size }) async
    test('test getDewormingRecordsByPetApiPetGetDewormingRecordsByPetPetIdGet', () async {
      // TODO
    });

    // 根据宠物ID获取驱虫记录列表（分页）
    //
    // 根据宠物ID获取驱虫记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseDewormingRecordResponse> getDewormingRecordsByPetApiPetGetDewormingRecordsByPetPetIdGet_0(int petId, { int skip, int size }) async
    test('test getDewormingRecordsByPetApiPetGetDewormingRecordsByPetPetIdGet_0', () async {
      // TODO
    });

    // 根据宠物ID获取驱虫记录列表（分页）
    //
    // 根据宠物ID获取驱虫记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseDewormingRecordResponse> getDewormingRecordsByPetApiPetGetDewormingRecordsByPetPetIdGet_1(int petId, { int skip, int size }) async
    test('test getDewormingRecordsByPetApiPetGetDewormingRecordsByPetPetIdGet_1', () async {
      // TODO
    });

    // 获取体检记录
    //
    // 获取体检记录
    //
    //Future<GenericResponseExaminationRecordResponse> getExaminationRecordApiPetGetExaminationRecordRecordIdGet(int recordId) async
    test('test getExaminationRecordApiPetGetExaminationRecordRecordIdGet', () async {
      // TODO
    });

    // 获取体检记录
    //
    // 获取体检记录
    //
    //Future<GenericResponseExaminationRecordResponse> getExaminationRecordApiPetGetExaminationRecordRecordIdGet_0(int recordId) async
    test('test getExaminationRecordApiPetGetExaminationRecordRecordIdGet_0', () async {
      // TODO
    });

    // 获取体检记录
    //
    // 获取体检记录
    //
    //Future<GenericResponseExaminationRecordResponse> getExaminationRecordApiPetGetExaminationRecordRecordIdGet_1(int recordId) async
    test('test getExaminationRecordApiPetGetExaminationRecordRecordIdGet_1', () async {
      // TODO
    });

    // 根据宠物ID获取体检记录列表（分页）
    //
    // 根据宠物ID获取体检记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseExaminationRecordResponse> getExaminationRecordsByPetApiPetGetExaminationRecordsByPetPetIdGet(int petId, { int skip, int size }) async
    test('test getExaminationRecordsByPetApiPetGetExaminationRecordsByPetPetIdGet', () async {
      // TODO
    });

    // 根据宠物ID获取体检记录列表（分页）
    //
    // 根据宠物ID获取体检记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseExaminationRecordResponse> getExaminationRecordsByPetApiPetGetExaminationRecordsByPetPetIdGet_0(int petId, { int skip, int size }) async
    test('test getExaminationRecordsByPetApiPetGetExaminationRecordsByPetPetIdGet_0', () async {
      // TODO
    });

    // 根据宠物ID获取体检记录列表（分页）
    //
    // 根据宠物ID获取体检记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseExaminationRecordResponse> getExaminationRecordsByPetApiPetGetExaminationRecordsByPetPetIdGet_1(int petId, { int skip, int size }) async
    test('test getExaminationRecordsByPetApiPetGetExaminationRecordsByPetPetIdGet_1', () async {
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

    // 获取美容养护记录
    //
    // 获取美容养护记录
    //
    //Future<GenericResponseBeautificationRecordResponse> getGroomingRecordApiPetGetGroomingRecordRecordIdGet(int recordId) async
    test('test getGroomingRecordApiPetGetGroomingRecordRecordIdGet', () async {
      // TODO
    });

    // 获取美容养护记录
    //
    // 获取美容养护记录
    //
    //Future<GenericResponseBeautificationRecordResponse> getGroomingRecordApiPetGetGroomingRecordRecordIdGet_0(int recordId) async
    test('test getGroomingRecordApiPetGetGroomingRecordRecordIdGet_0', () async {
      // TODO
    });

    // 获取美容养护记录
    //
    // 获取美容养护记录
    //
    //Future<GenericResponseBeautificationRecordResponse> getGroomingRecordApiPetGetGroomingRecordRecordIdGet_1(int recordId) async
    test('test getGroomingRecordApiPetGetGroomingRecordRecordIdGet_1', () async {
      // TODO
    });

    // 根据宠物ID获取美容养护记录列表（分页）
    //
    // 根据宠物ID获取美容养护记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseBeautificationRecordResponse> getGroomingRecordsByPetApiPetGetGroomingRecordsByPetPetIdGet(int petId, { int skip, int size }) async
    test('test getGroomingRecordsByPetApiPetGetGroomingRecordsByPetPetIdGet', () async {
      // TODO
    });

    // 根据宠物ID获取美容养护记录列表（分页）
    //
    // 根据宠物ID获取美容养护记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseBeautificationRecordResponse> getGroomingRecordsByPetApiPetGetGroomingRecordsByPetPetIdGet_0(int petId, { int skip, int size }) async
    test('test getGroomingRecordsByPetApiPetGetGroomingRecordsByPetPetIdGet_0', () async {
      // TODO
    });

    // 根据宠物ID获取美容养护记录列表（分页）
    //
    // 根据宠物ID获取美容养护记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseBeautificationRecordResponse> getGroomingRecordsByPetApiPetGetGroomingRecordsByPetPetIdGet_1(int petId, { int skip, int size }) async
    test('test getGroomingRecordsByPetApiPetGetGroomingRecordsByPetPetIdGet_1', () async {
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

    // 获取其他健康记录
    //
    // 获取其他健康记录
    //
    //Future<GenericResponseOtherHealthRecordResponse> getOtherHealthRecordApiPetGetOtherHealthRecordRecordIdGet(int recordId) async
    test('test getOtherHealthRecordApiPetGetOtherHealthRecordRecordIdGet', () async {
      // TODO
    });

    // 获取其他健康记录
    //
    // 获取其他健康记录
    //
    //Future<GenericResponseOtherHealthRecordResponse> getOtherHealthRecordApiPetGetOtherHealthRecordRecordIdGet_0(int recordId) async
    test('test getOtherHealthRecordApiPetGetOtherHealthRecordRecordIdGet_0', () async {
      // TODO
    });

    // 获取其他健康记录
    //
    // 获取其他健康记录
    //
    //Future<GenericResponseOtherHealthRecordResponse> getOtherHealthRecordApiPetGetOtherHealthRecordRecordIdGet_1(int recordId) async
    test('test getOtherHealthRecordApiPetGetOtherHealthRecordRecordIdGet_1', () async {
      // TODO
    });

    // 根据宠物ID获取其他健康记录列表（分页）
    //
    // 根据宠物ID获取其他健康记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseOtherHealthRecordResponse> getOtherHealthRecordsByPetApiPetGetOtherHealthRecordsByPetPetIdGet(int petId, { int skip, int size }) async
    test('test getOtherHealthRecordsByPetApiPetGetOtherHealthRecordsByPetPetIdGet', () async {
      // TODO
    });

    // 根据宠物ID获取其他健康记录列表（分页）
    //
    // 根据宠物ID获取其他健康记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseOtherHealthRecordResponse> getOtherHealthRecordsByPetApiPetGetOtherHealthRecordsByPetPetIdGet_0(int petId, { int skip, int size }) async
    test('test getOtherHealthRecordsByPetApiPetGetOtherHealthRecordsByPetPetIdGet_0', () async {
      // TODO
    });

    // 根据宠物ID获取其他健康记录列表（分页）
    //
    // 根据宠物ID获取其他健康记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseOtherHealthRecordResponse> getOtherHealthRecordsByPetApiPetGetOtherHealthRecordsByPetPetIdGet_1(int petId, { int skip, int size }) async
    test('test getOtherHealthRecordsByPetApiPetGetOtherHealthRecordsByPetPetIdGet_1', () async {
      // TODO
    });

    // 获取其他用户信息
    //
    // 获取其他用户的非敏感信息 :param user_id: 目标用户ID :param db: 数据库会话 :param current_user: 当前用户（可选） :return: 用户的非敏感信息
    //
    //Future<GenericResponseUserResponse> getOtherUserInfoApiAuthUsersOtherUserIdGet(int userId) async
    test('test getOtherUserInfoApiAuthUsersOtherUserIdGet', () async {
      // TODO
    });

    // 获取其他用户信息
    //
    // 获取其他用户的非敏感信息 :param user_id: 目标用户ID :param db: 数据库会话 :param current_user: 当前用户（可选） :return: 用户的非敏感信息
    //
    //Future<GenericResponseUserResponse> getOtherUserInfoApiAuthUsersOtherUserIdGet_0(int userId) async
    test('test getOtherUserInfoApiAuthUsersOtherUserIdGet_0', () async {
      // TODO
    });

    // 获取其他用户个人信息
    //
    // 获取其他用户的个人信息（不包含敏感数据） :param user_id: 目标用户ID :param db: 数据库会话 :return: 用户的非敏感信息
    //
    //Future<GenericResponseUserResponse> getOtherUserInfoApiAuthUsersUserIdGet(int userId) async
    test('test getOtherUserInfoApiAuthUsersUserIdGet', () async {
      // TODO
    });

    // 获取其他用户个人信息
    //
    // 获取其他用户的个人信息（不包含敏感数据） :param user_id: 目标用户ID :param db: 数据库会话 :return: 用户的非敏感信息
    //
    //Future<GenericResponseUserResponse> getOtherUserInfoApiAuthUsersUserIdGet_0(int userId) async
    test('test getOtherUserInfoApiAuthUsersUserIdGet_0', () async {
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

    // 获取待审核成员列表
    //
    // 
    //
    //Future<GenericResponseCommunityMemberListResponse> getPendingMembersApiCommunityCommunitiesCommunityIdMembersPendingGet_0(int communityId, { int skip, int limit }) async
    test('test getPendingMembersApiCommunityCommunitiesCommunityIdMembersPendingGet_0', () async {
      // TODO
    });

    // 获取待审核成员列表
    //
    // 
    //
    //Future<GenericResponseCommunityMemberListResponse> getPendingMembersApiCommunityCommunitiesCommunityIdMembersPendingGet_1(int communityId, { int skip, int limit }) async
    test('test getPendingMembersApiCommunityCommunitiesCommunityIdMembersPendingGet_1', () async {
      // TODO
    });

    // 获取单个场所信息
    //
    // 根据ID获取场所详细信息
    //
    //Future<GenericResponsePlaceResponse> getPlaceApiExplorePlacesPlaceIdGet(int placeId) async
    test('test getPlaceApiExplorePlacesPlaceIdGet', () async {
      // TODO
    });

    // 获取单个场所信息
    //
    // 根据ID获取场所详细信息
    //
    //Future<GenericResponsePlaceResponse> getPlaceApiExplorePlacesPlaceIdGet_0(int placeId) async
    test('test getPlaceApiExplorePlacesPlaceIdGet_0', () async {
      // TODO
    });

    // 获取单个场所信息
    //
    // 根据ID获取场所详细信息
    //
    //Future<GenericResponsePlaceResponse> getPlaceApiExplorePlacesPlaceIdGet_1(int placeId) async
    test('test getPlaceApiExplorePlacesPlaceIdGet_1', () async {
      // TODO
    });

    // 获取宠物友好场所列表
    //
    // 分页获取所有宠物友好场所
    //
    //Future<GenericResponseListPlaceResponse> getPlacesApiExplorePlacesGet({ int skip, int limit }) async
    test('test getPlacesApiExplorePlacesGet', () async {
      // TODO
    });

    // 获取宠物友好场所列表
    //
    // 分页获取所有宠物友好场所
    //
    //Future<GenericResponseListPlaceResponse> getPlacesApiExplorePlacesGet_0({ int skip, int limit }) async
    test('test getPlacesApiExplorePlacesGet_0', () async {
      // TODO
    });

    // 获取宠物友好场所列表
    //
    // 分页获取所有宠物友好场所
    //
    //Future<GenericResponseListPlaceResponse> getPlacesApiExplorePlacesGet_1({ int skip, int limit }) async
    test('test getPlacesApiExplorePlacesGet_1', () async {
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

    // 获取帖子总评论数
    //
    // 获取指定帖子的总评论数，包括顶级评论和回复
    //
    //Future<GenericResponseDict> getPostCommentsCountApiDynamicsPostsPostIdCommentsCountGet_0(int postId) async
    test('test getPostCommentsCountApiDynamicsPostsPostIdCommentsCountGet_0', () async {
      // TODO
    });

    // 获取帖子总评论数
    //
    // 获取指定帖子的总评论数，包括顶级评论和回复
    //
    //Future<GenericResponseDict> getPostCommentsCountApiDynamicsPostsPostIdCommentsCountGet_1(int postId) async
    test('test getPostCommentsCountApiDynamicsPostsPostIdCommentsCountGet_1', () async {
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

    // 获取动态下的顶级评论
    //
    // 获取指定动态下的顶级评论，默认不包含完整回复树以提高性能，返回回复数量
    //
    //Future<GenericResponseDict> getPostParentCommentsApiDynamicsPostsPostIdParentCommentsGet_0(int postId, { int skip, int limit, bool includeReplies }) async
    test('test getPostParentCommentsApiDynamicsPostsPostIdParentCommentsGet_0', () async {
      // TODO
    });

    // 获取动态下的顶级评论
    //
    // 获取指定动态下的顶级评论，默认不包含完整回复树以提高性能，返回回复数量
    //
    //Future<GenericResponseDict> getPostParentCommentsApiDynamicsPostsPostIdParentCommentsGet_1(int postId, { int skip, int limit, bool includeReplies }) async
    test('test getPostParentCommentsApiDynamicsPostsPostIdParentCommentsGet_1', () async {
      // TODO
    });

    // 获取广场动态
    //
    // 
    //
    //Future<GenericResponsePostListResponse> getPublicDynamicsApiDynamicsGetPublicDynamicsGet({ int page, int limit, String tag }) async
    test('test getPublicDynamicsApiDynamicsGetPublicDynamicsGet', () async {
      // TODO
    });

    // 获取广场动态
    //
    // 
    //
    //Future<GenericResponsePostListResponse> getPublicDynamicsApiDynamicsGetPublicDynamicsGet_0({ int page, int limit, String tag }) async
    test('test getPublicDynamicsApiDynamicsGetPublicDynamicsGet_0', () async {
      // TODO
    });

    // 获取广场动态
    //
    // 
    //
    //Future<GenericResponsePostListResponse> getPublicDynamicsApiDynamicsGetPublicDynamicsGet_1({ int page, int limit, String tag }) async
    test('test getPublicDynamicsApiDynamicsGetPublicDynamicsGet_1', () async {
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

    // 获取推荐动态
    //
    // 
    //
    //Future<GenericResponsePostListResponse> getRecommendedDynamicsApiDynamicsRecommendedPost_0({ PaginationParams paginationParams }) async
    test('test getRecommendedDynamicsApiDynamicsRecommendedPost_0', () async {
      // TODO
    });

    // 获取推荐动态
    //
    // 
    //
    //Future<GenericResponsePostListResponse> getRecommendedDynamicsApiDynamicsRecommendedPost_1({ PaginationParams paginationParams }) async
    test('test getRecommendedDynamicsApiDynamicsRecommendedPost_1', () async {
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

    // 获取用户收藏的动态
    //
    // 获取当前用户收藏的动态列表，支持分页
    //
    //Future<GenericResponsePostListResponse> getUserFavoriteDynamicsApiDynamicsGetUserFavoriteDynamicsPost({ PaginationParams paginationParams }) async
    test('test getUserFavoriteDynamicsApiDynamicsGetUserFavoriteDynamicsPost', () async {
      // TODO
    });

    // 获取用户收藏的动态
    //
    // 获取当前用户收藏的动态列表，支持分页
    //
    //Future<GenericResponsePostListResponse> getUserFavoriteDynamicsApiDynamicsGetUserFavoriteDynamicsPost_0({ PaginationParams paginationParams }) async
    test('test getUserFavoriteDynamicsApiDynamicsGetUserFavoriteDynamicsPost_0', () async {
      // TODO
    });

    // 获取用户收藏的动态
    //
    // 获取当前用户收藏的动态列表，支持分页
    //
    //Future<GenericResponsePostListResponse> getUserFavoriteDynamicsApiDynamicsGetUserFavoriteDynamicsPost_1({ PaginationParams paginationParams }) async
    test('test getUserFavoriteDynamicsApiDynamicsGetUserFavoriteDynamicsPost_1', () async {
      // TODO
    });

    // 获取指定用户的动态列表
    //
    // 获取指定用户发布的动态列表（分页） :param user_id: 目标用户ID :param page: 页码，从0开始 :param limit: 每页数量，最大100 :param db: 数据库会话 :param current_user: 当前登录用户（可选） :return: 动态列表和总数
    //
    //Future<GenericResponsePostListResponse> getUserPostsApiDynamicsUsersUserIdPostsGet(int userId, { int page, int limit }) async
    test('test getUserPostsApiDynamicsUsersUserIdPostsGet', () async {
      // TODO
    });

    // 获取指定用户的动态列表
    //
    // 获取指定用户发布的动态列表（分页） :param user_id: 目标用户ID :param page: 页码，从0开始 :param limit: 每页数量，最大100 :param db: 数据库会话 :param current_user: 当前登录用户（可选） :return: 动态列表和总数
    //
    //Future<GenericResponsePostListResponse> getUserPostsApiDynamicsUsersUserIdPostsGet_0(int userId, { int page, int limit }) async
    test('test getUserPostsApiDynamicsUsersUserIdPostsGet_0', () async {
      // TODO
    });

    // 获取指定用户的动态列表
    //
    // 获取指定用户发布的动态列表（分页） :param user_id: 目标用户ID :param page: 页码，从0开始 :param limit: 每页数量，最大100 :param db: 数据库会话 :param current_user: 当前登录用户（可选） :return: 动态列表和总数
    //
    //Future<GenericResponsePostListResponse> getUserPostsApiDynamicsUsersUserIdPostsGet_1(int userId, { int page, int limit }) async
    test('test getUserPostsApiDynamicsUsersUserIdPostsGet_1', () async {
      // TODO
    });

    // 根据宠物ID获取疫苗接种记录列表（分页）
    //
    // 根据宠物ID获取疫苗接种记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseVaccinationRecordResponse> getVaccinationRecordsByPetApiPetGetVaccinationRecordsByPetPetIdGet(int petId, { int skip, int size }) async
    test('test getVaccinationRecordsByPetApiPetGetVaccinationRecordsByPetPetIdGet', () async {
      // TODO
    });

    // 根据宠物ID获取疫苗接种记录列表（分页）
    //
    // 根据宠物ID获取疫苗接种记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseVaccinationRecordResponse> getVaccinationRecordsByPetApiPetGetVaccinationRecordsByPetPetIdGet_0(int petId, { int skip, int size }) async
    test('test getVaccinationRecordsByPetApiPetGetVaccinationRecordsByPetPetIdGet_0', () async {
      // TODO
    });

    // 根据宠物ID获取疫苗接种记录列表（分页）
    //
    // 根据宠物ID获取疫苗接种记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseVaccinationRecordResponse> getVaccinationRecordsByPetApiPetGetVaccinationRecordsByPetPetIdGet_1(int petId, { int skip, int size }) async
    test('test getVaccinationRecordsByPetApiPetGetVaccinationRecordsByPetPetIdGet_1', () async {
      // TODO
    });

    // 获取体重记录
    //
    // 获取体重记录
    //
    //Future<GenericResponseWeightRecordResponse> getWeightRecordApiPetGetWeightRecordRecordIdGet(int recordId) async
    test('test getWeightRecordApiPetGetWeightRecordRecordIdGet', () async {
      // TODO
    });

    // 获取体重记录
    //
    // 获取体重记录
    //
    //Future<GenericResponseWeightRecordResponse> getWeightRecordApiPetGetWeightRecordRecordIdGet_0(int recordId) async
    test('test getWeightRecordApiPetGetWeightRecordRecordIdGet_0', () async {
      // TODO
    });

    // 获取体重记录
    //
    // 获取体重记录
    //
    //Future<GenericResponseWeightRecordResponse> getWeightRecordApiPetGetWeightRecordRecordIdGet_1(int recordId) async
    test('test getWeightRecordApiPetGetWeightRecordRecordIdGet_1', () async {
      // TODO
    });

    // 根据宠物ID获取体重记录列表（分页）
    //
    // 根据宠物ID获取体重记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseWeightRecordResponse> getWeightRecordsByPetApiPetGetWeightRecordsByPetPetIdGet(int petId, { int skip, int size }) async
    test('test getWeightRecordsByPetApiPetGetWeightRecordsByPetPetIdGet', () async {
      // TODO
    });

    // 根据宠物ID获取体重记录列表（分页）
    //
    // 根据宠物ID获取体重记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseWeightRecordResponse> getWeightRecordsByPetApiPetGetWeightRecordsByPetPetIdGet_0(int petId, { int skip, int size }) async
    test('test getWeightRecordsByPetApiPetGetWeightRecordsByPetPetIdGet_0', () async {
      // TODO
    });

    // 根据宠物ID获取体重记录列表（分页）
    //
    // 根据宠物ID获取体重记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponsePaginationResponseWeightRecordResponse> getWeightRecordsByPetApiPetGetWeightRecordsByPetPetIdGet_1(int petId, { int skip, int size }) async
    test('test getWeightRecordsByPetApiPetGetWeightRecordsByPetPetIdGet_1', () async {
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

    // 加入社群
    //
    // 
    //
    //Future<GenericResponseDict> joinCommunityApiCommunityCommunitiesCommunityIdJoinPost_0(int communityId) async
    test('test joinCommunityApiCommunityCommunitiesCommunityIdJoinPost_0', () async {
      // TODO
    });

    // 加入社群
    //
    // 
    //
    //Future<GenericResponseDict> joinCommunityApiCommunityCommunitiesCommunityIdJoinPost_1(int communityId) async
    test('test joinCommunityApiCommunityCommunitiesCommunityIdJoinPost_1', () async {
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

    // 点赞动态
    //
    // 
    //
    //Future<GenericResponseDict> likeDynamicApiDynamicsPostIdLikeDynamicPost_0(int postId) async
    test('test likeDynamicApiDynamicsPostIdLikeDynamicPost_0', () async {
      // TODO
    });

    // 点赞动态
    //
    // 
    //
    //Future<GenericResponseDict> likeDynamicApiDynamicsPostIdLikeDynamicPost_1(int postId) async
    test('test likeDynamicApiDynamicsPostIdLikeDynamicPost_1', () async {
      // TODO
    });

    // 回复点赞状态切换
    //
    // 对指定回复进行点赞或取消点赞操作
    //
    //Future<GenericResponseDict> likeReplyApiDynamicsCommentsReplyIdLikePost(int replyId) async
    test('test likeReplyApiDynamicsCommentsReplyIdLikePost', () async {
      // TODO
    });

    // 回复点赞状态切换
    //
    // 对指定回复进行点赞或取消点赞操作
    //
    //Future<GenericResponseDict> likeReplyApiDynamicsCommentsReplyIdLikePost_0(int replyId) async
    test('test likeReplyApiDynamicsCommentsReplyIdLikePost_0', () async {
      // TODO
    });

    // 回复点赞状态切换
    //
    // 对指定回复进行点赞或取消点赞操作
    //
    //Future<GenericResponseDict> likeReplyApiDynamicsCommentsReplyIdLikePost_1(int replyId) async
    test('test likeReplyApiDynamicsCommentsReplyIdLikePost_1', () async {
      // TODO
    });

    // 用户登录
    //
    // 用户登录，支持用户名或手机号登录 :param request: 登录请求 :param db: 数据库会话 :return: 访问令牌和刷新令牌
    //
    //Future<GenericResponseLoginResponse> loginForAccessTokenApiAuthLoginPost({ LoginRequest loginRequest }) async
    test('test loginForAccessTokenApiAuthLoginPost', () async {
      // TODO
    });

    // 用户登录
    //
    // 用户登录，支持用户名或手机号登录 :param request: 登录请求 :param db: 数据库会话 :return: 访问令牌和刷新令牌
    //
    //Future<GenericResponseLoginResponse> loginForAccessTokenApiAuthLoginPost_0({ LoginRequest loginRequest }) async
    test('test loginForAccessTokenApiAuthLoginPost_0', () async {
      // TODO
    });

    // 手机号+验证码 一键注册/登录
    //
    // 
    //
    //Future<GenericResponsePhoneCodeLoginResponse> phoneCodeLoginApiAuthPhoneCodeLoginPost({ PhoneCodeLoginRequest phoneCodeLoginRequest }) async
    test('test phoneCodeLoginApiAuthPhoneCodeLoginPost', () async {
      // TODO
    });

    // 手机号+验证码 一键注册/登录
    //
    // 
    //
    //Future<GenericResponsePhoneCodeLoginResponse> phoneCodeLoginApiAuthPhoneCodeLoginPost_0({ PhoneCodeLoginRequest phoneCodeLoginRequest }) async
    test('test phoneCodeLoginApiAuthPhoneCodeLoginPost_0', () async {
      // TODO
    });

    // 手机号+密码 登录（仅登录，未注册报错）
    //
    // 
    //
    //Future<GenericResponsePhoneLoginResponse> phonePasswordLoginApiAuthPhoneLoginPost({ PhoneLoginRequest phoneLoginRequest }) async
    test('test phonePasswordLoginApiAuthPhoneLoginPost', () async {
      // TODO
    });

    // 手机号+密码 登录（仅登录，未注册报错）
    //
    // 
    //
    //Future<GenericResponsePhoneLoginResponse> phonePasswordLoginApiAuthPhoneLoginPost_0({ PhoneLoginRequest phoneLoginRequest }) async
    test('test phonePasswordLoginApiAuthPhoneLoginPost_0', () async {
      // TODO
    });

    // 获取单个行为风格
    //
    // 根据 ID 获取行为风格 :param behavior_style_id: 行为风格ID :param db: 数据库会话 :return: 行为风格信息
    //
    //Future<GenericResponseBehaviorStyleResponse> readBehaviorStyleApiEnumsBehaviorStylesBehaviorStyleIdGet(int behaviorStyleId) async
    test('test readBehaviorStyleApiEnumsBehaviorStylesBehaviorStyleIdGet', () async {
      // TODO
    });

    // 获取单个行为风格
    //
    // 根据 ID 获取行为风格 :param behavior_style_id: 行为风格ID :param db: 数据库会话 :return: 行为风格信息
    //
    //Future<GenericResponseBehaviorStyleResponse> readBehaviorStyleApiEnumsBehaviorStylesBehaviorStyleIdGet_0(int behaviorStyleId) async
    test('test readBehaviorStyleApiEnumsBehaviorStylesBehaviorStyleIdGet_0', () async {
      // TODO
    });

    // 获取单个行为风格
    //
    // 根据 ID 获取行为风格 :param behavior_style_id: 行为风格ID :param db: 数据库会话 :return: 行为风格信息
    //
    //Future<GenericResponseBehaviorStyleResponse> readBehaviorStyleApiEnumsBehaviorStylesBehaviorStyleIdGet_1(int behaviorStyleId) async
    test('test readBehaviorStyleApiEnumsBehaviorStylesBehaviorStyleIdGet_1', () async {
      // TODO
    });

    // 分页获取所有行为风格
    //
    // 分页获取所有行为风格 :param page: 页码 :param page_size: 每页数量 :param db: 数据库会话 :return: 行为风格列表
    //
    //Future<GenericResponseListBehaviorStyleResponse> readBehaviorStylesApiEnumsBehaviorStylesGet({ int page, int pageSize }) async
    test('test readBehaviorStylesApiEnumsBehaviorStylesGet', () async {
      // TODO
    });

    // 分页获取所有行为风格
    //
    // 分页获取所有行为风格 :param page: 页码 :param page_size: 每页数量 :param db: 数据库会话 :return: 行为风格列表
    //
    //Future<GenericResponseListBehaviorStyleResponse> readBehaviorStylesApiEnumsBehaviorStylesGet_0({ int page, int pageSize }) async
    test('test readBehaviorStylesApiEnumsBehaviorStylesGet_0', () async {
      // TODO
    });

    // 分页获取所有行为风格
    //
    // 分页获取所有行为风格 :param page: 页码 :param page_size: 每页数量 :param db: 数据库会话 :return: 行为风格列表
    //
    //Future<GenericResponseListBehaviorStyleResponse> readBehaviorStylesApiEnumsBehaviorStylesGet_1({ int page, int pageSize }) async
    test('test readBehaviorStylesApiEnumsBehaviorStylesGet_1', () async {
      // TODO
    });

    // 获取种类详情
    //
    // 
    //
    //Future<GenericResponseDogBreedOut> readBreedApiBreedReedsGetBreedDetailGet({ BreedDetail breedDetail }) async
    test('test readBreedApiBreedReedsGetBreedDetailGet', () async {
      // TODO
    });

    // 获取种类详情
    //
    // 
    //
    //Future<GenericResponseDogBreedOut> readBreedApiBreedReedsGetBreedDetailGet_0({ BreedDetail breedDetail }) async
    test('test readBreedApiBreedReedsGetBreedDetailGet_0', () async {
      // TODO
    });

    // 获取种类详情
    //
    // 
    //
    //Future<GenericResponseDogBreedOut> readBreedApiBreedReedsGetBreedDetailGet_1({ BreedDetail breedDetail }) async
    test('test readBreedApiBreedReedsGetBreedDetailGet_1', () async {
      // TODO
    });

    // 获取种类详情
    //
    // 
    //
    //Future<GenericResponseDogBreedOut> readBreedApiBreedReedsGetBreedDetailGet_2({ BreedDetail breedDetail }) async
    test('test readBreedApiBreedReedsGetBreedDetailGet_2', () async {
      // TODO
    });

    // 获取种类列表
    //
    // 
    //
    //Future<GenericResponseDogBreedListResponse> readBreedsApiBreedReedsGetBreedsGet({ int skip, int limit, bool isPopular }) async
    test('test readBreedsApiBreedReedsGetBreedsGet', () async {
      // TODO
    });

    // 获取种类列表
    //
    // 
    //
    //Future<GenericResponseDogBreedListResponse> readBreedsApiBreedReedsGetBreedsGet_0({ int skip, int limit, bool isPopular }) async
    test('test readBreedsApiBreedReedsGetBreedsGet_0', () async {
      // TODO
    });

    // 获取种类列表
    //
    // 
    //
    //Future<GenericResponseDogBreedListResponse> readBreedsApiBreedReedsGetBreedsGet_1({ int skip, int limit, bool isPopular }) async
    test('test readBreedsApiBreedReedsGetBreedsGet_1', () async {
      // TODO
    });

    // 获取种类列表
    //
    // 
    //
    //Future<GenericResponseDogBreedListResponse> readBreedsApiBreedReedsGetBreedsGet_2({ int skip, int limit, bool isPopular }) async
    test('test readBreedsApiBreedReedsGetBreedsGet_2', () async {
      // TODO
    });

    // 获取种类数量
    //
    // 
    //
    //Future<GenericResponseDict> readBreedsCountApiBreedReedsGetBreedsCountGet({ bool isPopular }) async
    test('test readBreedsCountApiBreedReedsGetBreedsCountGet', () async {
      // TODO
    });

    // 获取种类数量
    //
    // 
    //
    //Future<GenericResponseDict> readBreedsCountApiBreedReedsGetBreedsCountGet_0({ bool isPopular }) async
    test('test readBreedsCountApiBreedReedsGetBreedsCountGet_0', () async {
      // TODO
    });

    // 获取种类数量
    //
    // 
    //
    //Future<GenericResponseDict> readBreedsCountApiBreedReedsGetBreedsCountGet_1({ bool isPopular }) async
    test('test readBreedsCountApiBreedReedsGetBreedsCountGet_1', () async {
      // TODO
    });

    // 获取种类数量
    //
    // 
    //
    //Future<GenericResponseDict> readBreedsCountApiBreedReedsGetBreedsCountGet_2({ bool isPopular }) async
    test('test readBreedsCountApiBreedReedsGetBreedsCountGet_2', () async {
      // TODO
    });

    // 获取行为指南详情
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> readGuideApiBreedBehaviorGuidesGetBehaviorGuideDetailGet({ DogBehaviorGuideBase dogBehaviorGuideBase }) async
    test('test readGuideApiBreedBehaviorGuidesGetBehaviorGuideDetailGet', () async {
      // TODO
    });

    // 获取行为指南详情
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> readGuideApiBreedBehaviorGuidesGetBehaviorGuideDetailGet_0({ DogBehaviorGuideBase dogBehaviorGuideBase }) async
    test('test readGuideApiBreedBehaviorGuidesGetBehaviorGuideDetailGet_0', () async {
      // TODO
    });

    // 获取行为指南详情
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> readGuideApiBreedBehaviorGuidesGetBehaviorGuideDetailGet_1({ DogBehaviorGuideBase dogBehaviorGuideBase }) async
    test('test readGuideApiBreedBehaviorGuidesGetBehaviorGuideDetailGet_1', () async {
      // TODO
    });

    // 获取行为指南详情
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> readGuideApiBreedBehaviorGuidesGetBehaviorGuideDetailGet_2({ DogBehaviorGuideBase dogBehaviorGuideBase }) async
    test('test readGuideApiBreedBehaviorGuidesGetBehaviorGuideDetailGet_2', () async {
      // TODO
    });

    // 获取护理指南详情
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> readGuideApiBreedCareGuidesGetCareGuideGet({ DogCareGuideBase dogCareGuideBase }) async
    test('test readGuideApiBreedCareGuidesGetCareGuideGet', () async {
      // TODO
    });

    // 获取护理指南详情
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> readGuideApiBreedCareGuidesGetCareGuideGet_0({ DogCareGuideBase dogCareGuideBase }) async
    test('test readGuideApiBreedCareGuidesGetCareGuideGet_0', () async {
      // TODO
    });

    // 获取护理指南详情
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> readGuideApiBreedCareGuidesGetCareGuideGet_1({ DogCareGuideBase dogCareGuideBase }) async
    test('test readGuideApiBreedCareGuidesGetCareGuideGet_1', () async {
      // TODO
    });

    // 获取护理指南详情
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> readGuideApiBreedCareGuidesGetCareGuideGet_2({ DogCareGuideBase dogCareGuideBase }) async
    test('test readGuideApiBreedCareGuidesGetCareGuideGet_2', () async {
      // TODO
    });

    // 获取训练指南详情
    //
    // 
    //
    //Future<DogTrainingGuideOut> readGuideApiBreedTrainingGuidesGetTrainingGuideGuideIdGet(int guideId) async
    test('test readGuideApiBreedTrainingGuidesGetTrainingGuideGuideIdGet', () async {
      // TODO
    });

    // 获取训练指南详情
    //
    // 
    //
    //Future<DogTrainingGuideOut> readGuideApiBreedTrainingGuidesGetTrainingGuideGuideIdGet_0(int guideId) async
    test('test readGuideApiBreedTrainingGuidesGetTrainingGuideGuideIdGet_0', () async {
      // TODO
    });

    // 获取训练指南详情
    //
    // 
    //
    //Future<DogTrainingGuideOut> readGuideApiBreedTrainingGuidesGetTrainingGuideGuideIdGet_1(int guideId) async
    test('test readGuideApiBreedTrainingGuidesGetTrainingGuideGuideIdGet_1', () async {
      // TODO
    });

    // 获取训练指南详情
    //
    // 
    //
    //Future<DogTrainingGuideOut> readGuideApiBreedTrainingGuidesGetTrainingGuideGuideIdGet_2(int guideId) async
    test('test readGuideApiBreedTrainingGuidesGetTrainingGuideGuideIdGet_2', () async {
      // TODO
    });

    // 获取行为指南列表
    //
    // 
    //
    //Future<GenericResponsePagedResponseDogBehaviorGuideOut> readGuidesApiBreedBehaviorGuidesGetBehaviorGuidesGet({ int skip, int limit, int breedId, int ageStageId }) async
    test('test readGuidesApiBreedBehaviorGuidesGetBehaviorGuidesGet', () async {
      // TODO
    });

    // 获取行为指南列表
    //
    // 
    //
    //Future<GenericResponsePagedResponseDogBehaviorGuideOut> readGuidesApiBreedBehaviorGuidesGetBehaviorGuidesGet_0({ int skip, int limit, int breedId, int ageStageId }) async
    test('test readGuidesApiBreedBehaviorGuidesGetBehaviorGuidesGet_0', () async {
      // TODO
    });

    // 获取行为指南列表
    //
    // 
    //
    //Future<GenericResponsePagedResponseDogBehaviorGuideOut> readGuidesApiBreedBehaviorGuidesGetBehaviorGuidesGet_1({ int skip, int limit, int breedId, int ageStageId }) async
    test('test readGuidesApiBreedBehaviorGuidesGetBehaviorGuidesGet_1', () async {
      // TODO
    });

    // 获取行为指南列表
    //
    // 
    //
    //Future<GenericResponsePagedResponseDogBehaviorGuideOut> readGuidesApiBreedBehaviorGuidesGetBehaviorGuidesGet_2({ int skip, int limit, int breedId, int ageStageId }) async
    test('test readGuidesApiBreedBehaviorGuidesGetBehaviorGuidesGet_2', () async {
      // TODO
    });

    // 获取护理指南列表(分页)
    //
    // 
    //
    //Future<GenericResponsePagedResponseDogCareGuideOut> readGuidesApiBreedCareGuidesGetDogCareGuidesGet({ int page, int size, int breedId, int ageStageId }) async
    test('test readGuidesApiBreedCareGuidesGetDogCareGuidesGet', () async {
      // TODO
    });

    // 获取护理指南列表(分页)
    //
    // 
    //
    //Future<GenericResponsePagedResponseDogCareGuideOut> readGuidesApiBreedCareGuidesGetDogCareGuidesGet_0({ int page, int size, int breedId, int ageStageId }) async
    test('test readGuidesApiBreedCareGuidesGetDogCareGuidesGet_0', () async {
      // TODO
    });

    // 获取护理指南列表(分页)
    //
    // 
    //
    //Future<GenericResponsePagedResponseDogCareGuideOut> readGuidesApiBreedCareGuidesGetDogCareGuidesGet_1({ int page, int size, int breedId, int ageStageId }) async
    test('test readGuidesApiBreedCareGuidesGetDogCareGuidesGet_1', () async {
      // TODO
    });

    // 获取护理指南列表(分页)
    //
    // 
    //
    //Future<GenericResponsePagedResponseDogCareGuideOut> readGuidesApiBreedCareGuidesGetDogCareGuidesGet_2({ int page, int size, int breedId, int ageStageId }) async
    test('test readGuidesApiBreedCareGuidesGetDogCareGuidesGet_2', () async {
      // TODO
    });

    // Read Guides
    //
    // 
    //
    //Future<BuiltList<DogTrainingGuideOut>> readGuidesApiBreedTrainingGuidesGet({ int skip, int limit, int breedId, int ageStageId }) async
    test('test readGuidesApiBreedTrainingGuidesGet', () async {
      // TODO
    });

    // Read Guides
    //
    // 
    //
    //Future<BuiltList<DogTrainingGuideOut>> readGuidesApiBreedTrainingGuidesGet_0({ int skip, int limit, int breedId, int ageStageId }) async
    test('test readGuidesApiBreedTrainingGuidesGet_0', () async {
      // TODO
    });

    // Read Guides
    //
    // 
    //
    //Future<BuiltList<DogTrainingGuideOut>> readGuidesApiBreedTrainingGuidesGet_1({ int skip, int limit, int breedId, int ageStageId }) async
    test('test readGuidesApiBreedTrainingGuidesGet_1', () async {
      // TODO
    });

    // Read Guides
    //
    // 
    //
    //Future<BuiltList<DogTrainingGuideOut>> readGuidesApiBreedTrainingGuidesGet_2({ int skip, int limit, int breedId, int ageStageId }) async
    test('test readGuidesApiBreedTrainingGuidesGet_2', () async {
      // TODO
    });

    // 获取训练指南数量
    //
    // 
    //
    //Future<BuiltMap<String, JsonObject>> readGuidesCountApiBreedTrainingGuidesGetTrainingGuidesCountGet({ int breedId, int ageStageId }) async
    test('test readGuidesCountApiBreedTrainingGuidesGetTrainingGuidesCountGet', () async {
      // TODO
    });

    // 获取训练指南数量
    //
    // 
    //
    //Future<BuiltMap<String, JsonObject>> readGuidesCountApiBreedTrainingGuidesGetTrainingGuidesCountGet_0({ int breedId, int ageStageId }) async
    test('test readGuidesCountApiBreedTrainingGuidesGetTrainingGuidesCountGet_0', () async {
      // TODO
    });

    // 获取训练指南数量
    //
    // 
    //
    //Future<BuiltMap<String, JsonObject>> readGuidesCountApiBreedTrainingGuidesGetTrainingGuidesCountGet_1({ int breedId, int ageStageId }) async
    test('test readGuidesCountApiBreedTrainingGuidesGetTrainingGuidesCountGet_1', () async {
      // TODO
    });

    // 获取训练指南数量
    //
    // 
    //
    //Future<BuiltMap<String, JsonObject>> readGuidesCountApiBreedTrainingGuidesGetTrainingGuidesCountGet_2({ int breedId, int ageStageId }) async
    test('test readGuidesCountApiBreedTrainingGuidesGetTrainingGuidesCountGet_2', () async {
      // TODO
    });

    // 获取健康记录类型列表
    //
    // 
    //
    //Future<GenericResponseList> readHealthRecordTypesApiPetHealthTypesGet() async
    test('test readHealthRecordTypesApiPetHealthTypesGet', () async {
      // TODO
    });

    // 获取健康记录类型列表
    //
    // 
    //
    //Future<GenericResponseList> readHealthRecordTypesApiPetHealthTypesGet_0() async
    test('test readHealthRecordTypesApiPetHealthTypesGet_0', () async {
      // TODO
    });

    // 获取健康记录类型列表
    //
    // 
    //
    //Future<GenericResponseList> readHealthRecordTypesApiPetHealthTypesGet_1() async
    test('test readHealthRecordTypesApiPetHealthTypesGet_1', () async {
      // TODO
    });

    // 分页获取所有性格特征
    //
    // 分页获取所有性格特征 :param page: 页码 :param page_size: 每页数量 :param db: 数据库会话 :return: 性格特征列表
    //
    //Future<GenericResponseListPersonalityResponse> readPersonalitiesApiEnumsPersonalitiesGet({ int page, int pageSize }) async
    test('test readPersonalitiesApiEnumsPersonalitiesGet', () async {
      // TODO
    });

    // 分页获取所有性格特征
    //
    // 分页获取所有性格特征 :param page: 页码 :param page_size: 每页数量 :param db: 数据库会话 :return: 性格特征列表
    //
    //Future<GenericResponseListPersonalityResponse> readPersonalitiesApiEnumsPersonalitiesGet_0({ int page, int pageSize }) async
    test('test readPersonalitiesApiEnumsPersonalitiesGet_0', () async {
      // TODO
    });

    // 分页获取所有性格特征
    //
    // 分页获取所有性格特征 :param page: 页码 :param page_size: 每页数量 :param db: 数据库会话 :return: 性格特征列表
    //
    //Future<GenericResponseListPersonalityResponse> readPersonalitiesApiEnumsPersonalitiesGet_1({ int page, int pageSize }) async
    test('test readPersonalitiesApiEnumsPersonalitiesGet_1', () async {
      // TODO
    });

    // 获取单个性格特征
    //
    // 根据 ID 获取性格特征 :param personality_id: 性格特征ID :param db: 数据库会话 :return: 性格特征信息
    //
    //Future<GenericResponsePersonalityResponse> readPersonalityApiEnumsPersonalitiesPersonalityIdGet(int personalityId) async
    test('test readPersonalityApiEnumsPersonalitiesPersonalityIdGet', () async {
      // TODO
    });

    // 获取单个性格特征
    //
    // 根据 ID 获取性格特征 :param personality_id: 性格特征ID :param db: 数据库会话 :return: 性格特征信息
    //
    //Future<GenericResponsePersonalityResponse> readPersonalityApiEnumsPersonalitiesPersonalityIdGet_0(int personalityId) async
    test('test readPersonalityApiEnumsPersonalitiesPersonalityIdGet_0', () async {
      // TODO
    });

    // 获取单个性格特征
    //
    // 根据 ID 获取性格特征 :param personality_id: 性格特征ID :param db: 数据库会话 :return: 性格特征信息
    //
    //Future<GenericResponsePersonalityResponse> readPersonalityApiEnumsPersonalitiesPersonalityIdGet_1(int personalityId) async
    test('test readPersonalityApiEnumsPersonalitiesPersonalityIdGet_1', () async {
      // TODO
    });

    // 获取单个宠物档案
    //
    // 
    //
    //Future<GenericResponsePetResponse> readPetApiPetProfilePetIdGet(int petId) async
    test('test readPetApiPetProfilePetIdGet', () async {
      // TODO
    });

    // 获取单个宠物档案
    //
    // 
    //
    //Future<GenericResponsePetResponse> readPetApiPetProfilePetIdGet_0(int petId) async
    test('test readPetApiPetProfilePetIdGet_0', () async {
      // TODO
    });

    // 获取单个宠物档案
    //
    // 
    //
    //Future<GenericResponsePetResponse> readPetApiPetProfilePetIdGet_1(int petId) async
    test('test readPetApiPetProfilePetIdGet_1', () async {
      // TODO
    });

    // 获取宠物档案列表
    //
    // 
    //
    //Future<GenericResponsePetListResponse> readPetsApiPetProfileGet() async
    test('test readPetsApiPetProfileGet', () async {
      // TODO
    });

    // 获取宠物档案列表
    //
    // 
    //
    //Future<GenericResponsePetListResponse> readPetsApiPetProfileGet_0() async
    test('test readPetsApiPetProfileGet_0', () async {
      // TODO
    });

    // 获取宠物档案列表
    //
    // 
    //
    //Future<GenericResponsePetListResponse> readPetsApiPetProfileGet_1() async
    test('test readPetsApiPetProfileGet_1', () async {
      // TODO
    });

    // 获取年龄阶段详情
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> readStageApiBreedAgeStagesGetAgeStageGet({ DogAgeStageBase dogAgeStageBase }) async
    test('test readStageApiBreedAgeStagesGetAgeStageGet', () async {
      // TODO
    });

    // 获取年龄阶段详情
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> readStageApiBreedAgeStagesGetAgeStageGet_0({ DogAgeStageBase dogAgeStageBase }) async
    test('test readStageApiBreedAgeStagesGetAgeStageGet_0', () async {
      // TODO
    });

    // 获取年龄阶段详情
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> readStageApiBreedAgeStagesGetAgeStageGet_1({ DogAgeStageBase dogAgeStageBase }) async
    test('test readStageApiBreedAgeStagesGetAgeStageGet_1', () async {
      // TODO
    });

    // 获取年龄阶段详情
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> readStageApiBreedAgeStagesGetAgeStageGet_2({ DogAgeStageBase dogAgeStageBase }) async
    test('test readStageApiBreedAgeStagesGetAgeStageGet_2', () async {
      // TODO
    });

    // 获取年龄阶段列表
    //
    // 
    //
    //Future<GenericResponseListDogAgeStageOut> readStagesApiBreedAgeStagesGetAgeStagesGet({ int skip, int limit }) async
    test('test readStagesApiBreedAgeStagesGetAgeStagesGet', () async {
      // TODO
    });

    // 获取年龄阶段列表
    //
    // 
    //
    //Future<GenericResponseListDogAgeStageOut> readStagesApiBreedAgeStagesGetAgeStagesGet_0({ int skip, int limit }) async
    test('test readStagesApiBreedAgeStagesGetAgeStagesGet_0', () async {
      // TODO
    });

    // 获取年龄阶段列表
    //
    // 
    //
    //Future<GenericResponseListDogAgeStageOut> readStagesApiBreedAgeStagesGetAgeStagesGet_1({ int skip, int limit }) async
    test('test readStagesApiBreedAgeStagesGetAgeStagesGet_1', () async {
      // TODO
    });

    // 获取年龄阶段列表
    //
    // 
    //
    //Future<GenericResponseListDogAgeStageOut> readStagesApiBreedAgeStagesGetAgeStagesGet_2({ int skip, int limit }) async
    test('test readStagesApiBreedAgeStagesGetAgeStagesGet_2', () async {
      // TODO
    });

    // 获取年龄阶段总数
    //
    // 
    //
    //Future<GenericResponseInt> readStagesCountApiBreedAgeStagesAgeStagesCountGet() async
    test('test readStagesCountApiBreedAgeStagesAgeStagesCountGet', () async {
      // TODO
    });

    // 获取年龄阶段总数
    //
    // 
    //
    //Future<GenericResponseInt> readStagesCountApiBreedAgeStagesAgeStagesCountGet_0() async
    test('test readStagesCountApiBreedAgeStagesAgeStagesCountGet_0', () async {
      // TODO
    });

    // 获取年龄阶段总数
    //
    // 
    //
    //Future<GenericResponseInt> readStagesCountApiBreedAgeStagesAgeStagesCountGet_1() async
    test('test readStagesCountApiBreedAgeStagesAgeStagesCountGet_1', () async {
      // TODO
    });

    // 获取年龄阶段总数
    //
    // 
    //
    //Future<GenericResponseInt> readStagesCountApiBreedAgeStagesAgeStagesCountGet_2() async
    test('test readStagesCountApiBreedAgeStagesAgeStagesCountGet_2', () async {
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

    // 获取单个标签
    //
    // 
    //
    //Future<GenericResponseTagResponse> readTagApiTagsGetTagTagIdGet_0(int tagId) async
    test('test readTagApiTagsGetTagTagIdGet_0', () async {
      // TODO
    });

    // 获取单个标签
    //
    // 
    //
    //Future<GenericResponseTagResponse> readTagApiTagsGetTagTagIdGet_1(int tagId) async
    test('test readTagApiTagsGetTagTagIdGet_1', () async {
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

    // 获取标签列表
    //
    // 
    //
    //Future<GenericResponseTagListResponse> readTagsApiTagsGetTagListGet_0({ int skip, int limit }) async
    test('test readTagsApiTagsGetTagListGet_0', () async {
      // TODO
    });

    // 获取标签列表
    //
    // 
    //
    //Future<GenericResponseTagListResponse> readTagsApiTagsGetTagListGet_1({ int skip, int limit }) async
    test('test readTagsApiTagsGetTagListGet_1', () async {
      // TODO
    });

    // 获取单个任务类型
    //
    // 根据 ID 获取任务类型 :param task_type_id: 任务类型ID :param db: 数据库会话 :return: 任务类型信息
    //
    //Future<GenericResponseTaskTypeResponse> readTaskTypeApiEnumsTaskTypesTaskTypeIdGet(int taskTypeId) async
    test('test readTaskTypeApiEnumsTaskTypesTaskTypeIdGet', () async {
      // TODO
    });

    // 获取单个任务类型
    //
    // 根据 ID 获取任务类型 :param task_type_id: 任务类型ID :param db: 数据库会话 :return: 任务类型信息
    //
    //Future<GenericResponseTaskTypeResponse> readTaskTypeApiEnumsTaskTypesTaskTypeIdGet_0(int taskTypeId) async
    test('test readTaskTypeApiEnumsTaskTypesTaskTypeIdGet_0', () async {
      // TODO
    });

    // 获取单个任务类型
    //
    // 根据 ID 获取任务类型 :param task_type_id: 任务类型ID :param db: 数据库会话 :return: 任务类型信息
    //
    //Future<GenericResponseTaskTypeResponse> readTaskTypeApiEnumsTaskTypesTaskTypeIdGet_1(int taskTypeId) async
    test('test readTaskTypeApiEnumsTaskTypesTaskTypeIdGet_1', () async {
      // TODO
    });

    // 分页获取所有任务类型
    //
    // 分页获取所有任务类型 :param page: 页码 :param page_size: 每页数量 :param db: 数据库会话 :return: 任务类型列表
    //
    //Future<GenericResponseListTaskTypeResponse> readTaskTypesApiEnumsTaskTypesGet({ int page, int pageSize }) async
    test('test readTaskTypesApiEnumsTaskTypesGet', () async {
      // TODO
    });

    // 分页获取所有任务类型
    //
    // 分页获取所有任务类型 :param page: 页码 :param page_size: 每页数量 :param db: 数据库会话 :return: 任务类型列表
    //
    //Future<GenericResponseListTaskTypeResponse> readTaskTypesApiEnumsTaskTypesGet_0({ int page, int pageSize }) async
    test('test readTaskTypesApiEnumsTaskTypesGet_0', () async {
      // TODO
    });

    // 分页获取所有任务类型
    //
    // 分页获取所有任务类型 :param page: 页码 :param page_size: 每页数量 :param db: 数据库会话 :return: 任务类型列表
    //
    //Future<GenericResponseListTaskTypeResponse> readTaskTypesApiEnumsTaskTypesGet_1({ int page, int pageSize }) async
    test('test readTaskTypesApiEnumsTaskTypesGet_1', () async {
      // TODO
    });

    // 获取当前用户信息
    //
    // 获取当前用户信息 :param current_user: 当前用户 :param db: 数据库会话 :return: 当前用户信息
    //
    //Future<GenericResponseUserInfoResponse> readUsersMeApiAuthUsersMeGet() async
    test('test readUsersMeApiAuthUsersMeGet', () async {
      // TODO
    });

    // 获取当前用户信息
    //
    // 获取当前用户信息 :param current_user: 当前用户 :param db: 数据库会话 :return: 当前用户信息
    //
    //Future<GenericResponseUserInfoResponse> readUsersMeApiAuthUsersMeGet_0() async
    test('test readUsersMeApiAuthUsersMeGet_0', () async {
      // TODO
    });

    // 刷新访问令牌
    //
    // 使用刷新令牌获取新的访问令牌 :param refresh_token: 刷新令牌 :param db: 数据库会话 :return: 新的访问令牌
    //
    //Future<GenericResponseRefreshTokenResponse> refreshAccessTokenApiAuthRefreshPost(String refreshToken) async
    test('test refreshAccessTokenApiAuthRefreshPost', () async {
      // TODO
    });

    // 刷新访问令牌
    //
    // 使用刷新令牌获取新的访问令牌 :param refresh_token: 刷新令牌 :param db: 数据库会话 :return: 新的访问令牌
    //
    //Future<GenericResponseRefreshTokenResponse> refreshAccessTokenApiAuthRefreshPost_0(String refreshToken) async
    test('test refreshAccessTokenApiAuthRefreshPost_0', () async {
      // TODO
    });

    // 注册用户
    //
    // 注册用户 :param username: 用户名 :param password: 密码 :param email: 邮箱 :param phone: 手机号 :param db: 数据库会话 :return: 注册成功的消息
    //
    //Future<GenericResponseUserInfoResponse> registerUserApiAuthRegisterPost(String username, String password, String email, { String phone }) async
    test('test registerUserApiAuthRegisterPost', () async {
      // TODO
    });

    // 注册用户
    //
    // 注册用户 :param username: 用户名 :param password: 密码 :param email: 邮箱 :param phone: 手机号 :param db: 数据库会话 :return: 注册成功的消息
    //
    //Future<GenericResponseUserInfoResponse> registerUserApiAuthRegisterPost_0(String username, String password, String email, { String phone }) async
    test('test registerUserApiAuthRegisterPost_0', () async {
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

    // 发送手机验证码
    //
    // 
    //
    //Future<GenericResponseSendCodeResponse> sendLoginCodeApiAuthSendCodePost({ SendCodeRequest sendCodeRequest }) async
    test('test sendLoginCodeApiAuthSendCodePost', () async {
      // TODO
    });

    // 发送手机验证码
    //
    // 
    //
    //Future<GenericResponseSendCodeResponse> sendLoginCodeApiAuthSendCodePost_0({ SendCodeRequest sendCodeRequest }) async
    test('test sendLoginCodeApiAuthSendCodePost_0', () async {
      // TODO
    });

    // 通过手机号验证码设置密码（无需登录）
    //
    // 
    //
    //Future<GenericResponseEmptyResponse> setPasswordByCodeApiAuthSetPasswordByCodePost({ SetPasswordByCodeRequest setPasswordByCodeRequest }) async
    test('test setPasswordByCodeApiAuthSetPasswordByCodePost', () async {
      // TODO
    });

    // 通过手机号验证码设置密码（无需登录）
    //
    // 
    //
    //Future<GenericResponseEmptyResponse> setPasswordByCodeApiAuthSetPasswordByCodePost_0({ SetPasswordByCodeRequest setPasswordByCodeRequest }) async
    test('test setPasswordByCodeApiAuthSetPasswordByCodePost_0', () async {
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

    // 分享动态
    //
    // 
    //
    //Future<GenericResponseDict> shareDynamicApiDynamicsPostIdSharePost_0(int postId, String platform, { String content, String shareUrl, bool isPublic }) async
    test('test shareDynamicApiDynamicsPostIdSharePost_0', () async {
      // TODO
    });

    // 分享动态
    //
    // 
    //
    //Future<GenericResponseDict> shareDynamicApiDynamicsPostIdSharePost_1(int postId, String platform, { String content, String shareUrl, bool isPublic }) async
    test('test shareDynamicApiDynamicsPostIdSharePost_1', () async {
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

    // 切换动态收藏状态
    //
    // 
    //
    //Future<GenericResponseDict> toggleDynamicFavoriteApiDynamicsPostIdFavoritePost_0(int postId, { String source_ }) async
    test('test toggleDynamicFavoriteApiDynamicsPostIdFavoritePost_0', () async {
      // TODO
    });

    // 切换动态收藏状态
    //
    // 
    //
    //Future<GenericResponseDict> toggleDynamicFavoriteApiDynamicsPostIdFavoritePost_1(int postId, { String source_ }) async
    test('test toggleDynamicFavoriteApiDynamicsPostIdFavoritePost_1', () async {
      // TODO
    });

    // 统一评论/回复点赞状态切换
    //
    // 统一接口，支持对顶级评论或回复进行点赞或取消点赞操作
    //
    //Future<GenericResponseDict> toggleLikeApiDynamicsCommentsLikePost(int targetId, { String targetType }) async
    test('test toggleLikeApiDynamicsCommentsLikePost', () async {
      // TODO
    });

    // 统一评论/回复点赞状态切换
    //
    // 统一接口，支持对顶级评论或回复进行点赞或取消点赞操作
    //
    //Future<GenericResponseDict> toggleLikeApiDynamicsCommentsLikePost_0(int targetId, { String targetType }) async
    test('test toggleLikeApiDynamicsCommentsLikePost_0', () async {
      // TODO
    });

    // 统一评论/回复点赞状态切换
    //
    // 统一接口，支持对顶级评论或回复进行点赞或取消点赞操作
    //
    //Future<GenericResponseDict> toggleLikeApiDynamicsCommentsLikePost_1(int targetId, { String targetType }) async
    test('test toggleLikeApiDynamicsCommentsLikePost_1', () async {
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

    // 切换点赞状态
    //
    // 
    //
    //Future<GenericResponseDict> toggleLikeApiDynamicsPostIdToggleLikePost_0(int postId) async
    test('test toggleLikeApiDynamicsPostIdToggleLikePost_0', () async {
      // TODO
    });

    // 切换点赞状态
    //
    // 
    //
    //Future<GenericResponseDict> toggleLikeApiDynamicsPostIdToggleLikePost_1(int postId) async
    test('test toggleLikeApiDynamicsPostIdToggleLikePost_1', () async {
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

    // 取消点赞
    //
    // 
    //
    //Future<GenericResponseDict> unlikeDynamicApiDynamicsPostIdUnlikeDynamicPost(int postId) async
    test('test unlikeDynamicApiDynamicsPostIdUnlikeDynamicPost', () async {
      // TODO
    });

    // 取消点赞
    //
    // 
    //
    //Future<GenericResponseDict> unlikeDynamicApiDynamicsPostIdUnlikeDynamicPost_0(int postId) async
    test('test unlikeDynamicApiDynamicsPostIdUnlikeDynamicPost_0', () async {
      // TODO
    });

    // 取消点赞
    //
    // 
    //
    //Future<GenericResponseDict> unlikeDynamicApiDynamicsPostIdUnlikeDynamicPost_1(int postId) async
    test('test unlikeDynamicApiDynamicsPostIdUnlikeDynamicPost_1', () async {
      // TODO
    });

    // 更新种类
    //
    // 更新种类  - **name**: 品种名称(可选) - **english_name**: 品种英文名称(可选) - **origin**: 品种产地(可选) - **group**: 犬种分组(可选) - **size**: 体型(可选) - **lifespan**: 寿命(可选) - **temperament**: 性格特征(可选) - **appearance**: 外貌特征(可选) - **care_level**: 饲养难度(1-5，可选) - **activity_level**: 活动量(1-5，可选) - **is_popular**: 是否热门品种(可选) - **media_ids**: 媒体资源ID列表(可选)
    //
    //Future<GenericResponseDogBreedOut> updateBreedApiBreedReedsUpdateBreedPost({ DogBreedUpdate dogBreedUpdate }) async
    test('test updateBreedApiBreedReedsUpdateBreedPost', () async {
      // TODO
    });

    // 更新种类
    //
    // 更新种类  - **name**: 品种名称(可选) - **english_name**: 品种英文名称(可选) - **origin**: 品种产地(可选) - **group**: 犬种分组(可选) - **size**: 体型(可选) - **lifespan**: 寿命(可选) - **temperament**: 性格特征(可选) - **appearance**: 外貌特征(可选) - **care_level**: 饲养难度(1-5，可选) - **activity_level**: 活动量(1-5，可选) - **is_popular**: 是否热门品种(可选) - **media_ids**: 媒体资源ID列表(可选)
    //
    //Future<GenericResponseDogBreedOut> updateBreedApiBreedReedsUpdateBreedPost_0({ DogBreedUpdate dogBreedUpdate }) async
    test('test updateBreedApiBreedReedsUpdateBreedPost_0', () async {
      // TODO
    });

    // 更新种类
    //
    // 更新种类  - **name**: 品种名称(可选) - **english_name**: 品种英文名称(可选) - **origin**: 品种产地(可选) - **group**: 犬种分组(可选) - **size**: 体型(可选) - **lifespan**: 寿命(可选) - **temperament**: 性格特征(可选) - **appearance**: 外貌特征(可选) - **care_level**: 饲养难度(1-5，可选) - **activity_level**: 活动量(1-5，可选) - **is_popular**: 是否热门品种(可选) - **media_ids**: 媒体资源ID列表(可选)
    //
    //Future<GenericResponseDogBreedOut> updateBreedApiBreedReedsUpdateBreedPost_1({ DogBreedUpdate dogBreedUpdate }) async
    test('test updateBreedApiBreedReedsUpdateBreedPost_1', () async {
      // TODO
    });

    // 更新种类
    //
    // 更新种类  - **name**: 品种名称(可选) - **english_name**: 品种英文名称(可选) - **origin**: 品种产地(可选) - **group**: 犬种分组(可选) - **size**: 体型(可选) - **lifespan**: 寿命(可选) - **temperament**: 性格特征(可选) - **appearance**: 外貌特征(可选) - **care_level**: 饲养难度(1-5，可选) - **activity_level**: 活动量(1-5，可选) - **is_popular**: 是否热门品种(可选) - **media_ids**: 媒体资源ID列表(可选)
    //
    //Future<GenericResponseDogBreedOut> updateBreedApiBreedReedsUpdateBreedPost_2({ DogBreedUpdate dogBreedUpdate }) async
    test('test updateBreedApiBreedReedsUpdateBreedPost_2', () async {
      // TODO
    });

    // 更新就诊记录
    //
    // 更新就诊记录
    //
    //Future<GenericResponseConsultationResponse> updateConsultationRecordApiPetUpdateConsultationRecordRecordIdPost(int recordId, { ConsultationCreate consultationCreate }) async
    test('test updateConsultationRecordApiPetUpdateConsultationRecordRecordIdPost', () async {
      // TODO
    });

    // 更新就诊记录
    //
    // 更新就诊记录
    //
    //Future<GenericResponseConsultationResponse> updateConsultationRecordApiPetUpdateConsultationRecordRecordIdPost_0(int recordId, { ConsultationCreate consultationCreate }) async
    test('test updateConsultationRecordApiPetUpdateConsultationRecordRecordIdPost_0', () async {
      // TODO
    });

    // 更新就诊记录
    //
    // 更新就诊记录
    //
    //Future<GenericResponseConsultationResponse> updateConsultationRecordApiPetUpdateConsultationRecordRecordIdPost_1(int recordId, { ConsultationCreate consultationCreate }) async
    test('test updateConsultationRecordApiPetUpdateConsultationRecordRecordIdPost_1', () async {
      // TODO
    });

    // 更新驱虫记录
    //
    // 更新驱虫记录
    //
    //Future<GenericResponseDewormingRecordResponse> updateDewormingRecordApiPetUpdateDewormingRecordRecordIdPost(int recordId, { DewormingRecordCreate dewormingRecordCreate }) async
    test('test updateDewormingRecordApiPetUpdateDewormingRecordRecordIdPost', () async {
      // TODO
    });

    // 更新驱虫记录
    //
    // 更新驱虫记录
    //
    //Future<GenericResponseDewormingRecordResponse> updateDewormingRecordApiPetUpdateDewormingRecordRecordIdPost_0(int recordId, { DewormingRecordCreate dewormingRecordCreate }) async
    test('test updateDewormingRecordApiPetUpdateDewormingRecordRecordIdPost_0', () async {
      // TODO
    });

    // 更新驱虫记录
    //
    // 更新驱虫记录
    //
    //Future<GenericResponseDewormingRecordResponse> updateDewormingRecordApiPetUpdateDewormingRecordRecordIdPost_1(int recordId, { DewormingRecordCreate dewormingRecordCreate }) async
    test('test updateDewormingRecordApiPetUpdateDewormingRecordRecordIdPost_1', () async {
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

    // 更新动态
    //
    // 
    //
    //Future<GenericResponsePostResponse> updateDynamicApiDynamicsPostIdUpdateDynamicPost_0(int postId, { PostCreate postCreate }) async
    test('test updateDynamicApiDynamicsPostIdUpdateDynamicPost_0', () async {
      // TODO
    });

    // 更新动态
    //
    // 
    //
    //Future<GenericResponsePostResponse> updateDynamicApiDynamicsPostIdUpdateDynamicPost_1(int postId, { PostCreate postCreate }) async
    test('test updateDynamicApiDynamicsPostIdUpdateDynamicPost_1', () async {
      // TODO
    });

    // 更新体检记录
    //
    // 更新体检记录
    //
    //Future<GenericResponseExaminationRecordResponse> updateExaminationRecordApiPetUpdateExaminationRecordRecordIdPost(int recordId, { ExaminationRecordCreate examinationRecordCreate }) async
    test('test updateExaminationRecordApiPetUpdateExaminationRecordRecordIdPost', () async {
      // TODO
    });

    // 更新体检记录
    //
    // 更新体检记录
    //
    //Future<GenericResponseExaminationRecordResponse> updateExaminationRecordApiPetUpdateExaminationRecordRecordIdPost_0(int recordId, { ExaminationRecordCreate examinationRecordCreate }) async
    test('test updateExaminationRecordApiPetUpdateExaminationRecordRecordIdPost_0', () async {
      // TODO
    });

    // 更新体检记录
    //
    // 更新体检记录
    //
    //Future<GenericResponseExaminationRecordResponse> updateExaminationRecordApiPetUpdateExaminationRecordRecordIdPost_1(int recordId, { ExaminationRecordCreate examinationRecordCreate }) async
    test('test updateExaminationRecordApiPetUpdateExaminationRecordRecordIdPost_1', () async {
      // TODO
    });

    // 更新美容养护记录
    //
    // 更新美容养护记录
    //
    //Future<GenericResponseBeautificationRecordResponse> updateGroomingRecordApiPetUpdateGroomingRecordRecordIdPost(int recordId, { BeautificationRecordCreate beautificationRecordCreate }) async
    test('test updateGroomingRecordApiPetUpdateGroomingRecordRecordIdPost', () async {
      // TODO
    });

    // 更新美容养护记录
    //
    // 更新美容养护记录
    //
    //Future<GenericResponseBeautificationRecordResponse> updateGroomingRecordApiPetUpdateGroomingRecordRecordIdPost_0(int recordId, { BeautificationRecordCreate beautificationRecordCreate }) async
    test('test updateGroomingRecordApiPetUpdateGroomingRecordRecordIdPost_0', () async {
      // TODO
    });

    // 更新美容养护记录
    //
    // 更新美容养护记录
    //
    //Future<GenericResponseBeautificationRecordResponse> updateGroomingRecordApiPetUpdateGroomingRecordRecordIdPost_1(int recordId, { BeautificationRecordCreate beautificationRecordCreate }) async
    test('test updateGroomingRecordApiPetUpdateGroomingRecordRecordIdPost_1', () async {
      // TODO
    });

    // 更新行为指南
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> updateGuideApiBreedBehaviorGuidesUpdateBehaviorGuidePost({ DogBehaviorGuideUpdate dogBehaviorGuideUpdate }) async
    test('test updateGuideApiBreedBehaviorGuidesUpdateBehaviorGuidePost', () async {
      // TODO
    });

    // 更新行为指南
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> updateGuideApiBreedBehaviorGuidesUpdateBehaviorGuidePost_0({ DogBehaviorGuideUpdate dogBehaviorGuideUpdate }) async
    test('test updateGuideApiBreedBehaviorGuidesUpdateBehaviorGuidePost_0', () async {
      // TODO
    });

    // 更新行为指南
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> updateGuideApiBreedBehaviorGuidesUpdateBehaviorGuidePost_1({ DogBehaviorGuideUpdate dogBehaviorGuideUpdate }) async
    test('test updateGuideApiBreedBehaviorGuidesUpdateBehaviorGuidePost_1', () async {
      // TODO
    });

    // 更新行为指南
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> updateGuideApiBreedBehaviorGuidesUpdateBehaviorGuidePost_2({ DogBehaviorGuideUpdate dogBehaviorGuideUpdate }) async
    test('test updateGuideApiBreedBehaviorGuidesUpdateBehaviorGuidePost_2', () async {
      // TODO
    });

    // 更新护理指南
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> updateGuideApiBreedCareGuidesUpdateCareGuidePost({ DogCareGuideUpdate dogCareGuideUpdate }) async
    test('test updateGuideApiBreedCareGuidesUpdateCareGuidePost', () async {
      // TODO
    });

    // 更新护理指南
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> updateGuideApiBreedCareGuidesUpdateCareGuidePost_0({ DogCareGuideUpdate dogCareGuideUpdate }) async
    test('test updateGuideApiBreedCareGuidesUpdateCareGuidePost_0', () async {
      // TODO
    });

    // 更新护理指南
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> updateGuideApiBreedCareGuidesUpdateCareGuidePost_1({ DogCareGuideUpdate dogCareGuideUpdate }) async
    test('test updateGuideApiBreedCareGuidesUpdateCareGuidePost_1', () async {
      // TODO
    });

    // 更新护理指南
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> updateGuideApiBreedCareGuidesUpdateCareGuidePost_2({ DogCareGuideUpdate dogCareGuideUpdate }) async
    test('test updateGuideApiBreedCareGuidesUpdateCareGuidePost_2', () async {
      // TODO
    });

    // 更新训练指南
    //
    // 
    //
    //Future<DogTrainingGuideOut> updateGuideApiBreedTrainingGuidesUpdateTrainingGuideGuideIdPost(int guideId, { DogTrainingGuideUpdate dogTrainingGuideUpdate }) async
    test('test updateGuideApiBreedTrainingGuidesUpdateTrainingGuideGuideIdPost', () async {
      // TODO
    });

    // 更新训练指南
    //
    // 
    //
    //Future<DogTrainingGuideOut> updateGuideApiBreedTrainingGuidesUpdateTrainingGuideGuideIdPost_0(int guideId, { DogTrainingGuideUpdate dogTrainingGuideUpdate }) async
    test('test updateGuideApiBreedTrainingGuidesUpdateTrainingGuideGuideIdPost_0', () async {
      // TODO
    });

    // 更新训练指南
    //
    // 
    //
    //Future<DogTrainingGuideOut> updateGuideApiBreedTrainingGuidesUpdateTrainingGuideGuideIdPost_1(int guideId, { DogTrainingGuideUpdate dogTrainingGuideUpdate }) async
    test('test updateGuideApiBreedTrainingGuidesUpdateTrainingGuideGuideIdPost_1', () async {
      // TODO
    });

    // 更新训练指南
    //
    // 
    //
    //Future<DogTrainingGuideOut> updateGuideApiBreedTrainingGuidesUpdateTrainingGuideGuideIdPost_2(int guideId, { DogTrainingGuideUpdate dogTrainingGuideUpdate }) async
    test('test updateGuideApiBreedTrainingGuidesUpdateTrainingGuideGuideIdPost_2', () async {
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

    // 更新成员角色
    //
    // 
    //
    //Future<GenericResponseDict> updateMemberRoleApiCommunityCommunitiesCommunityIdMembersRolePost_0(int communityId, { RoleUpdate roleUpdate }) async
    test('test updateMemberRoleApiCommunityCommunitiesCommunityIdMembersRolePost_0', () async {
      // TODO
    });

    // 更新成员角色
    //
    // 
    //
    //Future<GenericResponseDict> updateMemberRoleApiCommunityCommunitiesCommunityIdMembersRolePost_1(int communityId, { RoleUpdate roleUpdate }) async
    test('test updateMemberRoleApiCommunityCommunitiesCommunityIdMembersRolePost_1', () async {
      // TODO
    });

    // 更新其他健康记录
    //
    // 更新其他健康记录
    //
    //Future<GenericResponseOtherHealthRecordResponse> updateOtherHealthRecordApiPetUpdateOtherHealthRecordRecordIdPost(int recordId, { OtherHealthRecordCreate otherHealthRecordCreate }) async
    test('test updateOtherHealthRecordApiPetUpdateOtherHealthRecordRecordIdPost', () async {
      // TODO
    });

    // 更新其他健康记录
    //
    // 更新其他健康记录
    //
    //Future<GenericResponseOtherHealthRecordResponse> updateOtherHealthRecordApiPetUpdateOtherHealthRecordRecordIdPost_0(int recordId, { OtherHealthRecordCreate otherHealthRecordCreate }) async
    test('test updateOtherHealthRecordApiPetUpdateOtherHealthRecordRecordIdPost_0', () async {
      // TODO
    });

    // 更新其他健康记录
    //
    // 更新其他健康记录
    //
    //Future<GenericResponseOtherHealthRecordResponse> updateOtherHealthRecordApiPetUpdateOtherHealthRecordRecordIdPost_1(int recordId, { OtherHealthRecordCreate otherHealthRecordCreate }) async
    test('test updateOtherHealthRecordApiPetUpdateOtherHealthRecordRecordIdPost_1', () async {
      // TODO
    });

    // 更新年龄阶段
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> updateStageApiBreedAgeStagesUpdateAgeStagePost({ DogAgeStageUpdate dogAgeStageUpdate }) async
    test('test updateStageApiBreedAgeStagesUpdateAgeStagePost', () async {
      // TODO
    });

    // 更新年龄阶段
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> updateStageApiBreedAgeStagesUpdateAgeStagePost_0({ DogAgeStageUpdate dogAgeStageUpdate }) async
    test('test updateStageApiBreedAgeStagesUpdateAgeStagePost_0', () async {
      // TODO
    });

    // 更新年龄阶段
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> updateStageApiBreedAgeStagesUpdateAgeStagePost_1({ DogAgeStageUpdate dogAgeStageUpdate }) async
    test('test updateStageApiBreedAgeStagesUpdateAgeStagePost_1', () async {
      // TODO
    });

    // 更新年龄阶段
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> updateStageApiBreedAgeStagesUpdateAgeStagePost_2({ DogAgeStageUpdate dogAgeStageUpdate }) async
    test('test updateStageApiBreedAgeStagesUpdateAgeStagePost_2', () async {
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

    // 更新标签
    //
    // 
    //
    //Future<GenericResponseTagResponse> updateTagApiTagsUpdateTagPost_0(int tagId, { TagUpdate tagUpdate }) async
    test('test updateTagApiTagsUpdateTagPost_0', () async {
      // TODO
    });

    // 更新标签
    //
    // 
    //
    //Future<GenericResponseTagResponse> updateTagApiTagsUpdateTagPost_1(int tagId, { TagUpdate tagUpdate }) async
    test('test updateTagApiTagsUpdateTagPost_1', () async {
      // TODO
    });

    // 更新疫苗接种记录
    //
    // 更新疫苗接种记录
    //
    //Future<GenericResponseVaccinationRecordResponse> updateVaccinationRecordApiPetUpdateVaccinationRecordRecordIdPost(int recordId, { VaccinationRecordCreate vaccinationRecordCreate }) async
    test('test updateVaccinationRecordApiPetUpdateVaccinationRecordRecordIdPost', () async {
      // TODO
    });

    // 更新疫苗接种记录
    //
    // 更新疫苗接种记录
    //
    //Future<GenericResponseVaccinationRecordResponse> updateVaccinationRecordApiPetUpdateVaccinationRecordRecordIdPost_0(int recordId, { VaccinationRecordCreate vaccinationRecordCreate }) async
    test('test updateVaccinationRecordApiPetUpdateVaccinationRecordRecordIdPost_0', () async {
      // TODO
    });

    // 更新疫苗接种记录
    //
    // 更新疫苗接种记录
    //
    //Future<GenericResponseVaccinationRecordResponse> updateVaccinationRecordApiPetUpdateVaccinationRecordRecordIdPost_1(int recordId, { VaccinationRecordCreate vaccinationRecordCreate }) async
    test('test updateVaccinationRecordApiPetUpdateVaccinationRecordRecordIdPost_1', () async {
      // TODO
    });

    // 更新体重记录
    //
    // 更新体重记录
    //
    //Future<GenericResponseWeightRecordResponse> updateWeightRecordApiPetUpdateWeightRecordRecordIdPost(int recordId, { WeightRecordCreate weightRecordCreate }) async
    test('test updateWeightRecordApiPetUpdateWeightRecordRecordIdPost', () async {
      // TODO
    });

    // 更新体重记录
    //
    // 更新体重记录
    //
    //Future<GenericResponseWeightRecordResponse> updateWeightRecordApiPetUpdateWeightRecordRecordIdPost_0(int recordId, { WeightRecordCreate weightRecordCreate }) async
    test('test updateWeightRecordApiPetUpdateWeightRecordRecordIdPost_0', () async {
      // TODO
    });

    // 更新体重记录
    //
    // 更新体重记录
    //
    //Future<GenericResponseWeightRecordResponse> updateWeightRecordApiPetUpdateWeightRecordRecordIdPost_1(int recordId, { WeightRecordCreate weightRecordCreate }) async
    test('test updateWeightRecordApiPetUpdateWeightRecordRecordIdPost_1', () async {
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
