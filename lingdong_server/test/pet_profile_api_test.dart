import 'package:test/test.dart';
import 'package:lingdong_server/lingdong_server.dart';


/// tests for PetProfileApi
void main() {
  final instance = LingdongServer().getPetProfileApi();

  group(PetProfileApi, () {
    // 创建就诊记录
    //
    // 创建就诊记录
    //
    //Future<GenericResponseConsultationResponse> createConsultationRecordApiPetCreateConsultationRecordPost({ ConsultationCreate consultationCreate }) async
    test('test createConsultationRecordApiPetCreateConsultationRecordPost', () async {
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

    // 创建体检记录
    //
    // 创建体检记录
    //
    //Future<GenericResponseExaminationRecordResponse> createExaminationRecordApiPetCreateExaminationRecordPost({ ExaminationRecordCreate examinationRecordCreate }) async
    test('test createExaminationRecordApiPetCreateExaminationRecordPost', () async {
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

    // 创建其他健康记录
    //
    // 创建其他健康记录
    //
    //Future<GenericResponseOtherHealthRecordResponse> createOtherHealthRecordApiPetCreateOtherHealthRecordPost({ OtherHealthRecordCreate otherHealthRecordCreate }) async
    test('test createOtherHealthRecordApiPetCreateOtherHealthRecordPost', () async {
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

    // 创建疫苗接种记录
    //
    // 创建疫苗接种记录
    //
    //Future<GenericResponseVaccinationRecordResponse> createVaccinationRecordApiPetCreateVaccinationRecordPost({ VaccinationRecordCreate vaccinationRecordCreate }) async
    test('test createVaccinationRecordApiPetCreateVaccinationRecordPost', () async {
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

    // 删除就诊记录
    //
    // 删除就诊记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteConsultationRecordApiPetDeleteConsultationRecordRecordIdPost(int recordId) async
    test('test deleteConsultationRecordApiPetDeleteConsultationRecordRecordIdPost', () async {
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

    // 删除体检记录
    //
    // 删除体检记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteExaminationRecordApiPetDeleteExaminationRecordRecordIdPost(int recordId) async
    test('test deleteExaminationRecordApiPetDeleteExaminationRecordRecordIdPost', () async {
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

    // 删除其他健康记录
    //
    // 删除其他健康记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteOtherHealthRecordApiPetDeleteOtherHealthRecordRecordIdPost(int recordId) async
    test('test deleteOtherHealthRecordApiPetDeleteOtherHealthRecordRecordIdPost', () async {
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

    // 删除体重记录
    //
    // 删除体重记录(逻辑删除)
    //
    //Future<GenericResponseDict> deleteWeightRecordApiPetDeleteWeightRecordRecordIdPost(int recordId) async
    test('test deleteWeightRecordApiPetDeleteWeightRecordRecordIdPost', () async {
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

    // 根据宠物ID获取就诊记录列表（分页）
    //
    // 根据宠物ID获取就诊记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponseDict> getConsultationRecordsByPetApiPetGetConsultationRecordsByPetPetIdGet(int petId, { int skip, int size }) async
    test('test getConsultationRecordsByPetApiPetGetConsultationRecordsByPetPetIdGet', () async {
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

    // 根据宠物ID获取驱虫记录列表（分页）
    //
    // 根据宠物ID获取驱虫记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponseDict> getDewormingRecordsByPetApiPetGetDewormingRecordsByPetPetIdGet(int petId, { int skip, int size }) async
    test('test getDewormingRecordsByPetApiPetGetDewormingRecordsByPetPetIdGet', () async {
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

    // 根据宠物ID获取体检记录列表（分页）
    //
    // 根据宠物ID获取体检记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponseDict> getExaminationRecordsByPetApiPetGetExaminationRecordsByPetPetIdGet(int petId, { int skip, int size }) async
    test('test getExaminationRecordsByPetApiPetGetExaminationRecordsByPetPetIdGet', () async {
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

    // 根据宠物ID获取美容养护记录列表（分页）
    //
    // 根据宠物ID获取美容养护记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponseDict> getGroomingRecordsByPetApiPetGetGroomingRecordsByPetPetIdGet(int petId, { int skip, int size }) async
    test('test getGroomingRecordsByPetApiPetGetGroomingRecordsByPetPetIdGet', () async {
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

    // 根据宠物ID获取其他健康记录列表（分页）
    //
    // 根据宠物ID获取其他健康记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponseDict> getOtherHealthRecordsByPetApiPetGetOtherHealthRecordsByPetPetIdGet(int petId, { int skip, int size }) async
    test('test getOtherHealthRecordsByPetApiPetGetOtherHealthRecordsByPetPetIdGet', () async {
      // TODO
    });

    // 根据宠物ID获取疫苗接种记录列表（分页）
    //
    // 根据宠物ID获取疫苗接种记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponseDict> getVaccinationRecordsByPetApiPetGetVaccinationRecordsByPetPetIdGet(int petId, { int skip, int size }) async
    test('test getVaccinationRecordsByPetApiPetGetVaccinationRecordsByPetPetIdGet', () async {
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

    // 根据宠物ID获取体重记录列表（分页）
    //
    // 根据宠物ID获取体重记录列表（分页） - pet_id: 宠物ID - skip: 跳过的记录数，默认为0 - size: 每页记录数，默认为10
    //
    //Future<GenericResponseDict> getWeightRecordsByPetApiPetGetWeightRecordsByPetPetIdGet(int petId, { int skip, int size }) async
    test('test getWeightRecordsByPetApiPetGetWeightRecordsByPetPetIdGet', () async {
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

    // 获取单个宠物档案
    //
    // 
    //
    //Future<GenericResponsePetResponse> readPetApiPetProfilePetIdGet(int petId) async
    test('test readPetApiPetProfilePetIdGet', () async {
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

    // 更新就诊记录
    //
    // 更新就诊记录
    //
    //Future<GenericResponseConsultationResponse> updateConsultationRecordApiPetUpdateConsultationRecordRecordIdPost(int recordId, { ConsultationCreate consultationCreate }) async
    test('test updateConsultationRecordApiPetUpdateConsultationRecordRecordIdPost', () async {
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

    // 更新体检记录
    //
    // 更新体检记录
    //
    //Future<GenericResponseExaminationRecordResponse> updateExaminationRecordApiPetUpdateExaminationRecordRecordIdPost(int recordId, { ExaminationRecordCreate examinationRecordCreate }) async
    test('test updateExaminationRecordApiPetUpdateExaminationRecordRecordIdPost', () async {
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

    // 更新其他健康记录
    //
    // 更新其他健康记录
    //
    //Future<GenericResponseOtherHealthRecordResponse> updateOtherHealthRecordApiPetUpdateOtherHealthRecordRecordIdPost(int recordId, { OtherHealthRecordCreate otherHealthRecordCreate }) async
    test('test updateOtherHealthRecordApiPetUpdateOtherHealthRecordRecordIdPost', () async {
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

    // 更新体重记录
    //
    // 更新体重记录
    //
    //Future<GenericResponseWeightRecordResponse> updateWeightRecordApiPetUpdateWeightRecordRecordIdPost(int recordId, { WeightRecordCreate weightRecordCreate }) async
    test('test updateWeightRecordApiPetUpdateWeightRecordRecordIdPost', () async {
      // TODO
    });

  });
}
