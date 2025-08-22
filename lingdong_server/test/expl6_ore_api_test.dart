import 'package:test/test.dart';
import 'package:lingdong_server/lingdong_server.dart';


/// tests for Expl6OreApi
void main() {
  final instance = LingdongServer().getExpl6OreApi();

  group(Expl6OreApi, () {
    // 创建宠物友好场所
    //
    // 创建新的宠物友好场所
    //
    //Future<GenericResponsePlaceResponse> createPlaceApiExplorePlacesPost({ PlaceCreate placeCreate }) async
    test('test createPlaceApiExplorePlacesPost', () async {
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

    // 获取宠物友好场所列表
    //
    // 分页获取所有宠物友好场所
    //
    //Future<GenericResponseListPlaceResponse> getPlacesApiExplorePlacesGet({ int skip, int limit }) async
    test('test getPlacesApiExplorePlacesGet', () async {
      // TODO
    });

  });
}
