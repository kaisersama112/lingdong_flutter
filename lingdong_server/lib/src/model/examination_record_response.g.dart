// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'examination_record_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExaminationRecordResponse extends ExaminationRecordResponse {
  @override
  final int petId;
  @override
  final String testType;
  @override
  final Date testDate;
  @override
  final String testInstitution;
  @override
  final String? attendingVet;
  @override
  final BuiltList<String> testItems;
  @override
  final BuiltMap<String, String> testResults;
  @override
  final String? referenceRange;
  @override
  final String? doctorComments;
  @override
  final String? recommendations;
  @override
  final bool? followUpRequired;
  @override
  final Date? nextCheckupDate;
  @override
  final int id;
  @override
  final String createdAt;
  @override
  final String recordDate;

  factory _$ExaminationRecordResponse(
          [void Function(ExaminationRecordResponseBuilder)? updates]) =>
      (ExaminationRecordResponseBuilder()..update(updates))._build();

  _$ExaminationRecordResponse._(
      {required this.petId,
      required this.testType,
      required this.testDate,
      required this.testInstitution,
      this.attendingVet,
      required this.testItems,
      required this.testResults,
      this.referenceRange,
      this.doctorComments,
      this.recommendations,
      this.followUpRequired,
      this.nextCheckupDate,
      required this.id,
      required this.createdAt,
      required this.recordDate})
      : super._();
  @override
  ExaminationRecordResponse rebuild(
          void Function(ExaminationRecordResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExaminationRecordResponseBuilder toBuilder() =>
      ExaminationRecordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExaminationRecordResponse &&
        petId == other.petId &&
        testType == other.testType &&
        testDate == other.testDate &&
        testInstitution == other.testInstitution &&
        attendingVet == other.attendingVet &&
        testItems == other.testItems &&
        testResults == other.testResults &&
        referenceRange == other.referenceRange &&
        doctorComments == other.doctorComments &&
        recommendations == other.recommendations &&
        followUpRequired == other.followUpRequired &&
        nextCheckupDate == other.nextCheckupDate &&
        id == other.id &&
        createdAt == other.createdAt &&
        recordDate == other.recordDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, petId.hashCode);
    _$hash = $jc(_$hash, testType.hashCode);
    _$hash = $jc(_$hash, testDate.hashCode);
    _$hash = $jc(_$hash, testInstitution.hashCode);
    _$hash = $jc(_$hash, attendingVet.hashCode);
    _$hash = $jc(_$hash, testItems.hashCode);
    _$hash = $jc(_$hash, testResults.hashCode);
    _$hash = $jc(_$hash, referenceRange.hashCode);
    _$hash = $jc(_$hash, doctorComments.hashCode);
    _$hash = $jc(_$hash, recommendations.hashCode);
    _$hash = $jc(_$hash, followUpRequired.hashCode);
    _$hash = $jc(_$hash, nextCheckupDate.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, recordDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExaminationRecordResponse')
          ..add('petId', petId)
          ..add('testType', testType)
          ..add('testDate', testDate)
          ..add('testInstitution', testInstitution)
          ..add('attendingVet', attendingVet)
          ..add('testItems', testItems)
          ..add('testResults', testResults)
          ..add('referenceRange', referenceRange)
          ..add('doctorComments', doctorComments)
          ..add('recommendations', recommendations)
          ..add('followUpRequired', followUpRequired)
          ..add('nextCheckupDate', nextCheckupDate)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('recordDate', recordDate))
        .toString();
  }
}

class ExaminationRecordResponseBuilder
    implements
        Builder<ExaminationRecordResponse, ExaminationRecordResponseBuilder> {
  _$ExaminationRecordResponse? _$v;

  int? _petId;
  int? get petId => _$this._petId;
  set petId(int? petId) => _$this._petId = petId;

  String? _testType;
  String? get testType => _$this._testType;
  set testType(String? testType) => _$this._testType = testType;

  Date? _testDate;
  Date? get testDate => _$this._testDate;
  set testDate(Date? testDate) => _$this._testDate = testDate;

  String? _testInstitution;
  String? get testInstitution => _$this._testInstitution;
  set testInstitution(String? testInstitution) =>
      _$this._testInstitution = testInstitution;

  String? _attendingVet;
  String? get attendingVet => _$this._attendingVet;
  set attendingVet(String? attendingVet) => _$this._attendingVet = attendingVet;

  ListBuilder<String>? _testItems;
  ListBuilder<String> get testItems =>
      _$this._testItems ??= ListBuilder<String>();
  set testItems(ListBuilder<String>? testItems) =>
      _$this._testItems = testItems;

  MapBuilder<String, String>? _testResults;
  MapBuilder<String, String> get testResults =>
      _$this._testResults ??= MapBuilder<String, String>();
  set testResults(MapBuilder<String, String>? testResults) =>
      _$this._testResults = testResults;

  String? _referenceRange;
  String? get referenceRange => _$this._referenceRange;
  set referenceRange(String? referenceRange) =>
      _$this._referenceRange = referenceRange;

  String? _doctorComments;
  String? get doctorComments => _$this._doctorComments;
  set doctorComments(String? doctorComments) =>
      _$this._doctorComments = doctorComments;

  String? _recommendations;
  String? get recommendations => _$this._recommendations;
  set recommendations(String? recommendations) =>
      _$this._recommendations = recommendations;

  bool? _followUpRequired;
  bool? get followUpRequired => _$this._followUpRequired;
  set followUpRequired(bool? followUpRequired) =>
      _$this._followUpRequired = followUpRequired;

  Date? _nextCheckupDate;
  Date? get nextCheckupDate => _$this._nextCheckupDate;
  set nextCheckupDate(Date? nextCheckupDate) =>
      _$this._nextCheckupDate = nextCheckupDate;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _recordDate;
  String? get recordDate => _$this._recordDate;
  set recordDate(String? recordDate) => _$this._recordDate = recordDate;

  ExaminationRecordResponseBuilder() {
    ExaminationRecordResponse._defaults(this);
  }

  ExaminationRecordResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _petId = $v.petId;
      _testType = $v.testType;
      _testDate = $v.testDate;
      _testInstitution = $v.testInstitution;
      _attendingVet = $v.attendingVet;
      _testItems = $v.testItems.toBuilder();
      _testResults = $v.testResults.toBuilder();
      _referenceRange = $v.referenceRange;
      _doctorComments = $v.doctorComments;
      _recommendations = $v.recommendations;
      _followUpRequired = $v.followUpRequired;
      _nextCheckupDate = $v.nextCheckupDate;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _recordDate = $v.recordDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExaminationRecordResponse other) {
    _$v = other as _$ExaminationRecordResponse;
  }

  @override
  void update(void Function(ExaminationRecordResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExaminationRecordResponse build() => _build();

  _$ExaminationRecordResponse _build() {
    _$ExaminationRecordResponse _$result;
    try {
      _$result = _$v ??
          _$ExaminationRecordResponse._(
            petId: BuiltValueNullFieldError.checkNotNull(
                petId, r'ExaminationRecordResponse', 'petId'),
            testType: BuiltValueNullFieldError.checkNotNull(
                testType, r'ExaminationRecordResponse', 'testType'),
            testDate: BuiltValueNullFieldError.checkNotNull(
                testDate, r'ExaminationRecordResponse', 'testDate'),
            testInstitution: BuiltValueNullFieldError.checkNotNull(
                testInstitution,
                r'ExaminationRecordResponse',
                'testInstitution'),
            attendingVet: attendingVet,
            testItems: testItems.build(),
            testResults: testResults.build(),
            referenceRange: referenceRange,
            doctorComments: doctorComments,
            recommendations: recommendations,
            followUpRequired: followUpRequired,
            nextCheckupDate: nextCheckupDate,
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ExaminationRecordResponse', 'id'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'ExaminationRecordResponse', 'createdAt'),
            recordDate: BuiltValueNullFieldError.checkNotNull(
                recordDate, r'ExaminationRecordResponse', 'recordDate'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'testItems';
        testItems.build();
        _$failedField = 'testResults';
        testResults.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ExaminationRecordResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
