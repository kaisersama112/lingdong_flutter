import 'package:test/test.dart';
import 'package:lingdong_server/lingdong_server.dart';


/// tests for DogBreedsApi
void main() {
  final instance = LingdongServer().getDogBreedsApi();

  group(DogBreedsApi, () {
    // 创建种类
    //
    // 创建种类  - **name**: 品种名称 - **english_name**: 品种英文名称 - **origin**: 品种产地(可选) - **group**: 犬种分组(可选) - **size**: 体型(可选) - **lifespan**: 寿命(可选) - **temperament**: 性格特征(可选) - **appearance**: 外貌特征(可选) - **care_level**: 饲养难度(1-5，可选) - **activity_level**: 活动量(1-5，可选) - **popularity**: 受欢迎程度(可选) - **is_popular**: 是否热门品种(可选) - **media**: 媒体资源ID列表(可选)
    //
    //Future<GenericResponseDogBreedOut> createBreedApiBreedReedsCreateBreedPost({ DogBreedCreate dogBreedCreate }) async
    test('test createBreedApiBreedReedsCreateBreedPost', () async {
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

    // 创建护理指南
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> createGuideApiBreedCareGuidesCreateDogCareGuidePost({ DogCareGuideCreate dogCareGuideCreate }) async
    test('test createGuideApiBreedCareGuidesCreateDogCareGuidePost', () async {
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

    // 创建年龄阶段
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> createStageApiBreedAgeStagesPost({ DogAgeStageCreate dogAgeStageCreate }) async
    test('test createStageApiBreedAgeStagesPost', () async {
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

    // 删除行为指南
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> deleteGuideApiBreedBehaviorGuidesDeleteBehaviorGuidePost({ DogBehaviorGuideBase dogBehaviorGuideBase }) async
    test('test deleteGuideApiBreedBehaviorGuidesDeleteBehaviorGuidePost', () async {
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

    // 删除训练指南
    //
    // 
    //
    //Future<DogTrainingGuideOut> deleteGuideApiBreedTrainingGuidesDeleteTrainingGuideGuideIdPost(int guideId) async
    test('test deleteGuideApiBreedTrainingGuidesDeleteTrainingGuideGuideIdPost', () async {
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

    // 获取种类详情
    //
    // 
    //
    //Future<GenericResponseDogBreedOut> readBreedApiBreedReedsGetBreedDetailGet({ BreedDetail breedDetail }) async
    test('test readBreedApiBreedReedsGetBreedDetailGet', () async {
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

    // 获取种类数量
    //
    // 
    //
    //Future<GenericResponseDict> readBreedsCountApiBreedReedsGetBreedsCountGet({ bool isPopular }) async
    test('test readBreedsCountApiBreedReedsGetBreedsCountGet', () async {
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

    // 获取护理指南详情
    //
    // 
    //
    //Future<GenericResponseDogCareGuideOut> readGuideApiBreedCareGuidesGetCareGuideGet({ DogCareGuideBase dogCareGuideBase }) async
    test('test readGuideApiBreedCareGuidesGetCareGuideGet', () async {
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

    // 获取行为指南列表
    //
    // 
    //
    //Future<GenericResponsePagedResponseDogBehaviorGuideOut> readGuidesApiBreedBehaviorGuidesGetBehaviorGuidesGet({ int skip, int limit, int breedId, int ageStageId }) async
    test('test readGuidesApiBreedBehaviorGuidesGetBehaviorGuidesGet', () async {
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

    // Read Guides
    //
    // 
    //
    //Future<BuiltList<DogTrainingGuideOut>> readGuidesApiBreedTrainingGuidesGet({ int skip, int limit, int breedId, int ageStageId }) async
    test('test readGuidesApiBreedTrainingGuidesGet', () async {
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

    // 获取年龄阶段详情
    //
    // 
    //
    //Future<GenericResponseDogAgeStageOut> readStageApiBreedAgeStagesGetAgeStageGet({ DogAgeStageBase dogAgeStageBase }) async
    test('test readStageApiBreedAgeStagesGetAgeStageGet', () async {
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

    // 获取年龄阶段总数
    //
    // 
    //
    //Future<GenericResponseInt> readStagesCountApiBreedAgeStagesAgeStagesCountGet() async
    test('test readStagesCountApiBreedAgeStagesAgeStagesCountGet', () async {
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

    // 更新行为指南
    //
    // 
    //
    //Future<GenericResponseDogBehaviorGuideOut> updateGuideApiBreedBehaviorGuidesUpdateBehaviorGuidePost({ DogBehaviorGuideUpdate dogBehaviorGuideUpdate }) async
    test('test updateGuideApiBreedBehaviorGuidesUpdateBehaviorGuidePost', () async {
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

    // 更新训练指南
    //
    // 
    //
    //Future<DogTrainingGuideOut> updateGuideApiBreedTrainingGuidesUpdateTrainingGuideGuideIdPost(int guideId, { DogTrainingGuideUpdate dogTrainingGuideUpdate }) async
    test('test updateGuideApiBreedTrainingGuidesUpdateTrainingGuideGuideIdPost', () async {
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

  });
}
