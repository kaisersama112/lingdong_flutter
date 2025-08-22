import 'package:test/test.dart';
import 'package:lingdong_server/lingdong_server.dart';


/// tests for EnumsApi
void main() {
  final instance = LingdongServer().getEnumsApi();

  group(EnumsApi, () {
    // 创建行为风格
    //
    // 创建新的行为风格 :param behavior_style: 行为风格创建模型 :param db: 数据库会话 :param user: 当前用户 :return: 行为风格信息
    //
    //Future<GenericResponseBehaviorStyleResponse> createNewBehaviorStyleApiEnumsBehaviorStylesPost({ BehaviorStyleCreate behaviorStyleCreate }) async
    test('test createNewBehaviorStyleApiEnumsBehaviorStylesPost', () async {
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

    // 创建任务类型
    //
    // 创建新的任务类型 :param task_type: 任务类型创建模型 :param db: 数据库会话 :param user: 当前用户 :return: 任务类型信息
    //
    //Future<GenericResponseTaskTypeResponse> createNewTaskTypeApiEnumsTaskTypesPost({ TaskTypeCreate taskTypeCreate }) async
    test('test createNewTaskTypeApiEnumsTaskTypesPost', () async {
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

    // 分页获取所有行为风格
    //
    // 分页获取所有行为风格 :param page: 页码 :param page_size: 每页数量 :param db: 数据库会话 :return: 行为风格列表
    //
    //Future<GenericResponseListBehaviorStyleResponse> readBehaviorStylesApiEnumsBehaviorStylesGet({ int page, int pageSize }) async
    test('test readBehaviorStylesApiEnumsBehaviorStylesGet', () async {
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

    // 获取单个性格特征
    //
    // 根据 ID 获取性格特征 :param personality_id: 性格特征ID :param db: 数据库会话 :return: 性格特征信息
    //
    //Future<GenericResponsePersonalityResponse> readPersonalityApiEnumsPersonalitiesPersonalityIdGet(int personalityId) async
    test('test readPersonalityApiEnumsPersonalitiesPersonalityIdGet', () async {
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

    // 分页获取所有任务类型
    //
    // 分页获取所有任务类型 :param page: 页码 :param page_size: 每页数量 :param db: 数据库会话 :return: 任务类型列表
    //
    //Future<GenericResponseListTaskTypeResponse> readTaskTypesApiEnumsTaskTypesGet({ int page, int pageSize }) async
    test('test readTaskTypesApiEnumsTaskTypesGet', () async {
      // TODO
    });

  });
}
