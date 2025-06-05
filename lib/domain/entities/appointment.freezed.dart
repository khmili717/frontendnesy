// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Appointment _$AppointmentFromJson(Map<String, dynamic> json) {
  return _Appointment.fromJson(json);
}

/// @nodoc
mixin _$Appointment {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'rdv_id')
  String? get rdvId => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_med')
  DoctorInfo get doctor => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_num_dossier')
  PatientInfo get patient => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get heure => throw _privateConstructorUsedError;
  AppointmentStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'linkedConsultation')
  String? get linkedConsultation => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Appointment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentCopyWith<Appointment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentCopyWith<$Res> {
  factory $AppointmentCopyWith(
          Appointment value, $Res Function(Appointment) then) =
      _$AppointmentCopyWithImpl<$Res, Appointment>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'rdv_id') String? rdvId,
      @JsonKey(name: 'id_med') DoctorInfo doctor,
      @JsonKey(name: 'id_num_dossier') PatientInfo patient,
      String date,
      String heure,
      AppointmentStatus status,
      @JsonKey(name: 'linkedConsultation') String? linkedConsultation,
      DateTime? createdAt,
      DateTime? updatedAt});

  $DoctorInfoCopyWith<$Res> get doctor;
  $PatientInfoCopyWith<$Res> get patient;
}

/// @nodoc
class _$AppointmentCopyWithImpl<$Res, $Val extends Appointment>
    implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rdvId = freezed,
    Object? doctor = null,
    Object? patient = null,
    Object? date = null,
    Object? heure = null,
    Object? status = null,
    Object? linkedConsultation = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      rdvId: freezed == rdvId
          ? _value.rdvId
          : rdvId // ignore: cast_nullable_to_non_nullable
              as String?,
      doctor: null == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as DoctorInfo,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as PatientInfo,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      heure: null == heure
          ? _value.heure
          : heure // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus,
      linkedConsultation: freezed == linkedConsultation
          ? _value.linkedConsultation
          : linkedConsultation // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DoctorInfoCopyWith<$Res> get doctor {
    return $DoctorInfoCopyWith<$Res>(_value.doctor, (value) {
      return _then(_value.copyWith(doctor: value) as $Val);
    });
  }

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PatientInfoCopyWith<$Res> get patient {
    return $PatientInfoCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppointmentImplCopyWith<$Res>
    implements $AppointmentCopyWith<$Res> {
  factory _$$AppointmentImplCopyWith(
          _$AppointmentImpl value, $Res Function(_$AppointmentImpl) then) =
      __$$AppointmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'rdv_id') String? rdvId,
      @JsonKey(name: 'id_med') DoctorInfo doctor,
      @JsonKey(name: 'id_num_dossier') PatientInfo patient,
      String date,
      String heure,
      AppointmentStatus status,
      @JsonKey(name: 'linkedConsultation') String? linkedConsultation,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $DoctorInfoCopyWith<$Res> get doctor;
  @override
  $PatientInfoCopyWith<$Res> get patient;
}

/// @nodoc
class __$$AppointmentImplCopyWithImpl<$Res>
    extends _$AppointmentCopyWithImpl<$Res, _$AppointmentImpl>
    implements _$$AppointmentImplCopyWith<$Res> {
  __$$AppointmentImplCopyWithImpl(
      _$AppointmentImpl _value, $Res Function(_$AppointmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rdvId = freezed,
    Object? doctor = null,
    Object? patient = null,
    Object? date = null,
    Object? heure = null,
    Object? status = null,
    Object? linkedConsultation = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$AppointmentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      rdvId: freezed == rdvId
          ? _value.rdvId
          : rdvId // ignore: cast_nullable_to_non_nullable
              as String?,
      doctor: null == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as DoctorInfo,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as PatientInfo,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      heure: null == heure
          ? _value.heure
          : heure // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus,
      linkedConsultation: freezed == linkedConsultation
          ? _value.linkedConsultation
          : linkedConsultation // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentImpl with DiagnosticableTreeMixin implements _Appointment {
  const _$AppointmentImpl(
      {@JsonKey(name: '_id') this.id,
      @JsonKey(name: 'rdv_id') this.rdvId,
      @JsonKey(name: 'id_med') required this.doctor,
      @JsonKey(name: 'id_num_dossier') required this.patient,
      required this.date,
      required this.heure,
      this.status = AppointmentStatus.enAttente,
      @JsonKey(name: 'linkedConsultation') this.linkedConsultation,
      this.createdAt,
      this.updatedAt});

  factory _$AppointmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey(name: 'rdv_id')
  final String? rdvId;
  @override
  @JsonKey(name: 'id_med')
  final DoctorInfo doctor;
  @override
  @JsonKey(name: 'id_num_dossier')
  final PatientInfo patient;
  @override
  final String date;
  @override
  final String heure;
  @override
  @JsonKey()
  final AppointmentStatus status;
  @override
  @JsonKey(name: 'linkedConsultation')
  final String? linkedConsultation;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Appointment(id: $id, rdvId: $rdvId, doctor: $doctor, patient: $patient, date: $date, heure: $heure, status: $status, linkedConsultation: $linkedConsultation, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Appointment'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('rdvId', rdvId))
      ..add(DiagnosticsProperty('doctor', doctor))
      ..add(DiagnosticsProperty('patient', patient))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('heure', heure))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('linkedConsultation', linkedConsultation))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rdvId, rdvId) || other.rdvId == rdvId) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.heure, heure) || other.heure == heure) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.linkedConsultation, linkedConsultation) ||
                other.linkedConsultation == linkedConsultation) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, rdvId, doctor, patient, date,
      heure, status, linkedConsultation, createdAt, updatedAt);

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentImplCopyWith<_$AppointmentImpl> get copyWith =>
      __$$AppointmentImplCopyWithImpl<_$AppointmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentImplToJson(
      this,
    );
  }
}

abstract class _Appointment implements Appointment {
  const factory _Appointment(
      {@JsonKey(name: '_id') final String? id,
      @JsonKey(name: 'rdv_id') final String? rdvId,
      @JsonKey(name: 'id_med') required final DoctorInfo doctor,
      @JsonKey(name: 'id_num_dossier') required final PatientInfo patient,
      required final String date,
      required final String heure,
      final AppointmentStatus status,
      @JsonKey(name: 'linkedConsultation') final String? linkedConsultation,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$AppointmentImpl;

  factory _Appointment.fromJson(Map<String, dynamic> json) =
      _$AppointmentImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(name: 'rdv_id')
  String? get rdvId;
  @override
  @JsonKey(name: 'id_med')
  DoctorInfo get doctor;
  @override
  @JsonKey(name: 'id_num_dossier')
  PatientInfo get patient;
  @override
  String get date;
  @override
  String get heure;
  @override
  AppointmentStatus get status;
  @override
  @JsonKey(name: 'linkedConsultation')
  String? get linkedConsultation;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentImplCopyWith<_$AppointmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoctorAppointment _$DoctorAppointmentFromJson(Map<String, dynamic> json) {
  return _DoctorAppointment.fromJson(json);
}

/// @nodoc
mixin _$DoctorAppointment {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'rdv_id')
  String? get rdvId => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_med')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_num_dossier')
  PatientInfo get patient => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get heure => throw _privateConstructorUsedError;
  AppointmentStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'linkedConsultation')
  String? get linkedConsultation => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DoctorAppointment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorAppointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorAppointmentCopyWith<DoctorAppointment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorAppointmentCopyWith<$Res> {
  factory $DoctorAppointmentCopyWith(
          DoctorAppointment value, $Res Function(DoctorAppointment) then) =
      _$DoctorAppointmentCopyWithImpl<$Res, DoctorAppointment>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'rdv_id') String? rdvId,
      @JsonKey(name: 'id_med') String doctorId,
      @JsonKey(name: 'id_num_dossier') PatientInfo patient,
      String date,
      String heure,
      AppointmentStatus status,
      @JsonKey(name: 'linkedConsultation') String? linkedConsultation,
      DateTime? createdAt,
      DateTime? updatedAt});

  $PatientInfoCopyWith<$Res> get patient;
}

/// @nodoc
class _$DoctorAppointmentCopyWithImpl<$Res, $Val extends DoctorAppointment>
    implements $DoctorAppointmentCopyWith<$Res> {
  _$DoctorAppointmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorAppointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rdvId = freezed,
    Object? doctorId = null,
    Object? patient = null,
    Object? date = null,
    Object? heure = null,
    Object? status = null,
    Object? linkedConsultation = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      rdvId: freezed == rdvId
          ? _value.rdvId
          : rdvId // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as PatientInfo,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      heure: null == heure
          ? _value.heure
          : heure // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus,
      linkedConsultation: freezed == linkedConsultation
          ? _value.linkedConsultation
          : linkedConsultation // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of DoctorAppointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PatientInfoCopyWith<$Res> get patient {
    return $PatientInfoCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DoctorAppointmentImplCopyWith<$Res>
    implements $DoctorAppointmentCopyWith<$Res> {
  factory _$$DoctorAppointmentImplCopyWith(_$DoctorAppointmentImpl value,
          $Res Function(_$DoctorAppointmentImpl) then) =
      __$$DoctorAppointmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'rdv_id') String? rdvId,
      @JsonKey(name: 'id_med') String doctorId,
      @JsonKey(name: 'id_num_dossier') PatientInfo patient,
      String date,
      String heure,
      AppointmentStatus status,
      @JsonKey(name: 'linkedConsultation') String? linkedConsultation,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $PatientInfoCopyWith<$Res> get patient;
}

/// @nodoc
class __$$DoctorAppointmentImplCopyWithImpl<$Res>
    extends _$DoctorAppointmentCopyWithImpl<$Res, _$DoctorAppointmentImpl>
    implements _$$DoctorAppointmentImplCopyWith<$Res> {
  __$$DoctorAppointmentImplCopyWithImpl(_$DoctorAppointmentImpl _value,
      $Res Function(_$DoctorAppointmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorAppointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rdvId = freezed,
    Object? doctorId = null,
    Object? patient = null,
    Object? date = null,
    Object? heure = null,
    Object? status = null,
    Object? linkedConsultation = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DoctorAppointmentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      rdvId: freezed == rdvId
          ? _value.rdvId
          : rdvId // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as PatientInfo,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      heure: null == heure
          ? _value.heure
          : heure // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus,
      linkedConsultation: freezed == linkedConsultation
          ? _value.linkedConsultation
          : linkedConsultation // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorAppointmentImpl
    with DiagnosticableTreeMixin
    implements _DoctorAppointment {
  const _$DoctorAppointmentImpl(
      {@JsonKey(name: '_id') this.id,
      @JsonKey(name: 'rdv_id') this.rdvId,
      @JsonKey(name: 'id_med') required this.doctorId,
      @JsonKey(name: 'id_num_dossier') required this.patient,
      required this.date,
      required this.heure,
      this.status = AppointmentStatus.enAttente,
      @JsonKey(name: 'linkedConsultation') this.linkedConsultation,
      this.createdAt,
      this.updatedAt});

  factory _$DoctorAppointmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorAppointmentImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey(name: 'rdv_id')
  final String? rdvId;
  @override
  @JsonKey(name: 'id_med')
  final String doctorId;
  @override
  @JsonKey(name: 'id_num_dossier')
  final PatientInfo patient;
  @override
  final String date;
  @override
  final String heure;
  @override
  @JsonKey()
  final AppointmentStatus status;
  @override
  @JsonKey(name: 'linkedConsultation')
  final String? linkedConsultation;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DoctorAppointment(id: $id, rdvId: $rdvId, doctorId: $doctorId, patient: $patient, date: $date, heure: $heure, status: $status, linkedConsultation: $linkedConsultation, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DoctorAppointment'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('rdvId', rdvId))
      ..add(DiagnosticsProperty('doctorId', doctorId))
      ..add(DiagnosticsProperty('patient', patient))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('heure', heure))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('linkedConsultation', linkedConsultation))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorAppointmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rdvId, rdvId) || other.rdvId == rdvId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.heure, heure) || other.heure == heure) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.linkedConsultation, linkedConsultation) ||
                other.linkedConsultation == linkedConsultation) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, rdvId, doctorId, patient,
      date, heure, status, linkedConsultation, createdAt, updatedAt);

  /// Create a copy of DoctorAppointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorAppointmentImplCopyWith<_$DoctorAppointmentImpl> get copyWith =>
      __$$DoctorAppointmentImplCopyWithImpl<_$DoctorAppointmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorAppointmentImplToJson(
      this,
    );
  }
}

abstract class _DoctorAppointment implements DoctorAppointment {
  const factory _DoctorAppointment(
      {@JsonKey(name: '_id') final String? id,
      @JsonKey(name: 'rdv_id') final String? rdvId,
      @JsonKey(name: 'id_med') required final String doctorId,
      @JsonKey(name: 'id_num_dossier') required final PatientInfo patient,
      required final String date,
      required final String heure,
      final AppointmentStatus status,
      @JsonKey(name: 'linkedConsultation') final String? linkedConsultation,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$DoctorAppointmentImpl;

  factory _DoctorAppointment.fromJson(Map<String, dynamic> json) =
      _$DoctorAppointmentImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(name: 'rdv_id')
  String? get rdvId;
  @override
  @JsonKey(name: 'id_med')
  String get doctorId;
  @override
  @JsonKey(name: 'id_num_dossier')
  PatientInfo get patient;
  @override
  String get date;
  @override
  String get heure;
  @override
  AppointmentStatus get status;
  @override
  @JsonKey(name: 'linkedConsultation')
  String? get linkedConsultation;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of DoctorAppointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorAppointmentImplCopyWith<_$DoctorAppointmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoctorInfo _$DoctorInfoFromJson(Map<String, dynamic> json) {
  return _DoctorInfo.fromJson(json);
}

/// @nodoc
mixin _$DoctorInfo {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String get prenom => throw _privateConstructorUsedError;
  int get cin => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  /// Serializes this DoctorInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorInfoCopyWith<DoctorInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorInfoCopyWith<$Res> {
  factory $DoctorInfoCopyWith(
          DoctorInfo value, $Res Function(DoctorInfo) then) =
      _$DoctorInfoCopyWithImpl<$Res, DoctorInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String nom,
      String prenom,
      int cin,
      String role});
}

/// @nodoc
class _$DoctorInfoCopyWithImpl<$Res, $Val extends DoctorInfo>
    implements $DoctorInfoCopyWith<$Res> {
  _$DoctorInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nom = null,
    Object? prenom = null,
    Object? cin = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      prenom: null == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String,
      cin: null == cin
          ? _value.cin
          : cin // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorInfoImplCopyWith<$Res>
    implements $DoctorInfoCopyWith<$Res> {
  factory _$$DoctorInfoImplCopyWith(
          _$DoctorInfoImpl value, $Res Function(_$DoctorInfoImpl) then) =
      __$$DoctorInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String nom,
      String prenom,
      int cin,
      String role});
}

/// @nodoc
class __$$DoctorInfoImplCopyWithImpl<$Res>
    extends _$DoctorInfoCopyWithImpl<$Res, _$DoctorInfoImpl>
    implements _$$DoctorInfoImplCopyWith<$Res> {
  __$$DoctorInfoImplCopyWithImpl(
      _$DoctorInfoImpl _value, $Res Function(_$DoctorInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nom = null,
    Object? prenom = null,
    Object? cin = null,
    Object? role = null,
  }) {
    return _then(_$DoctorInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      prenom: null == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String,
      cin: null == cin
          ? _value.cin
          : cin // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorInfoImpl with DiagnosticableTreeMixin implements _DoctorInfo {
  const _$DoctorInfoImpl(
      {@JsonKey(name: '_id') this.id,
      required this.nom,
      required this.prenom,
      required this.cin,
      required this.role});

  factory _$DoctorInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorInfoImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String nom;
  @override
  final String prenom;
  @override
  final int cin;
  @override
  final String role;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DoctorInfo(id: $id, nom: $nom, prenom: $prenom, cin: $cin, role: $role)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DoctorInfo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nom', nom))
      ..add(DiagnosticsProperty('prenom', prenom))
      ..add(DiagnosticsProperty('cin', cin))
      ..add(DiagnosticsProperty('role', role));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.cin, cin) || other.cin == cin) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nom, prenom, cin, role);

  /// Create a copy of DoctorInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorInfoImplCopyWith<_$DoctorInfoImpl> get copyWith =>
      __$$DoctorInfoImplCopyWithImpl<_$DoctorInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorInfoImplToJson(
      this,
    );
  }
}

abstract class _DoctorInfo implements DoctorInfo {
  const factory _DoctorInfo(
      {@JsonKey(name: '_id') final String? id,
      required final String nom,
      required final String prenom,
      required final int cin,
      required final String role}) = _$DoctorInfoImpl;

  factory _DoctorInfo.fromJson(Map<String, dynamic> json) =
      _$DoctorInfoImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String get nom;
  @override
  String get prenom;
  @override
  int get cin;
  @override
  String get role;

  /// Create a copy of DoctorInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorInfoImplCopyWith<_$DoctorInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientInfo _$PatientInfoFromJson(Map<String, dynamic> json) {
  return _PatientInfo.fromJson(json);
}

/// @nodoc
mixin _$PatientInfo {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'nom_patient')
  String? get nomPatient => throw _privateConstructorUsedError;
  @JsonKey(name: 'pren_patient')
  String? get prenPatient => throw _privateConstructorUsedError;
  @JsonKey(name: 'cin_cnam')
  int? get cinCnam => throw _privateConstructorUsedError;
  int? get tel => throw _privateConstructorUsedError;

  /// Serializes this PatientInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientInfoCopyWith<PatientInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientInfoCopyWith<$Res> {
  factory $PatientInfoCopyWith(
          PatientInfo value, $Res Function(PatientInfo) then) =
      _$PatientInfoCopyWithImpl<$Res, PatientInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'nom_patient') String? nomPatient,
      @JsonKey(name: 'pren_patient') String? prenPatient,
      @JsonKey(name: 'cin_cnam') int? cinCnam,
      int? tel});
}

/// @nodoc
class _$PatientInfoCopyWithImpl<$Res, $Val extends PatientInfo>
    implements $PatientInfoCopyWith<$Res> {
  _$PatientInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nomPatient = freezed,
    Object? prenPatient = freezed,
    Object? cinCnam = freezed,
    Object? tel = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nomPatient: freezed == nomPatient
          ? _value.nomPatient
          : nomPatient // ignore: cast_nullable_to_non_nullable
              as String?,
      prenPatient: freezed == prenPatient
          ? _value.prenPatient
          : prenPatient // ignore: cast_nullable_to_non_nullable
              as String?,
      cinCnam: freezed == cinCnam
          ? _value.cinCnam
          : cinCnam // ignore: cast_nullable_to_non_nullable
              as int?,
      tel: freezed == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientInfoImplCopyWith<$Res>
    implements $PatientInfoCopyWith<$Res> {
  factory _$$PatientInfoImplCopyWith(
          _$PatientInfoImpl value, $Res Function(_$PatientInfoImpl) then) =
      __$$PatientInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'nom_patient') String? nomPatient,
      @JsonKey(name: 'pren_patient') String? prenPatient,
      @JsonKey(name: 'cin_cnam') int? cinCnam,
      int? tel});
}

/// @nodoc
class __$$PatientInfoImplCopyWithImpl<$Res>
    extends _$PatientInfoCopyWithImpl<$Res, _$PatientInfoImpl>
    implements _$$PatientInfoImplCopyWith<$Res> {
  __$$PatientInfoImplCopyWithImpl(
      _$PatientInfoImpl _value, $Res Function(_$PatientInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nomPatient = freezed,
    Object? prenPatient = freezed,
    Object? cinCnam = freezed,
    Object? tel = freezed,
  }) {
    return _then(_$PatientInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nomPatient: freezed == nomPatient
          ? _value.nomPatient
          : nomPatient // ignore: cast_nullable_to_non_nullable
              as String?,
      prenPatient: freezed == prenPatient
          ? _value.prenPatient
          : prenPatient // ignore: cast_nullable_to_non_nullable
              as String?,
      cinCnam: freezed == cinCnam
          ? _value.cinCnam
          : cinCnam // ignore: cast_nullable_to_non_nullable
              as int?,
      tel: freezed == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientInfoImpl with DiagnosticableTreeMixin implements _PatientInfo {
  const _$PatientInfoImpl(
      {@JsonKey(name: '_id') this.id,
      @JsonKey(name: 'nom_patient') this.nomPatient,
      @JsonKey(name: 'pren_patient') this.prenPatient,
      @JsonKey(name: 'cin_cnam') this.cinCnam,
      this.tel});

  factory _$PatientInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientInfoImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey(name: 'nom_patient')
  final String? nomPatient;
  @override
  @JsonKey(name: 'pren_patient')
  final String? prenPatient;
  @override
  @JsonKey(name: 'cin_cnam')
  final int? cinCnam;
  @override
  final int? tel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PatientInfo(id: $id, nomPatient: $nomPatient, prenPatient: $prenPatient, cinCnam: $cinCnam, tel: $tel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PatientInfo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nomPatient', nomPatient))
      ..add(DiagnosticsProperty('prenPatient', prenPatient))
      ..add(DiagnosticsProperty('cinCnam', cinCnam))
      ..add(DiagnosticsProperty('tel', tel));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nomPatient, nomPatient) ||
                other.nomPatient == nomPatient) &&
            (identical(other.prenPatient, prenPatient) ||
                other.prenPatient == prenPatient) &&
            (identical(other.cinCnam, cinCnam) || other.cinCnam == cinCnam) &&
            (identical(other.tel, tel) || other.tel == tel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nomPatient, prenPatient, cinCnam, tel);

  /// Create a copy of PatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientInfoImplCopyWith<_$PatientInfoImpl> get copyWith =>
      __$$PatientInfoImplCopyWithImpl<_$PatientInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientInfoImplToJson(
      this,
    );
  }
}

abstract class _PatientInfo implements PatientInfo {
  const factory _PatientInfo(
      {@JsonKey(name: '_id') final String? id,
      @JsonKey(name: 'nom_patient') final String? nomPatient,
      @JsonKey(name: 'pren_patient') final String? prenPatient,
      @JsonKey(name: 'cin_cnam') final int? cinCnam,
      final int? tel}) = _$PatientInfoImpl;

  factory _PatientInfo.fromJson(Map<String, dynamic> json) =
      _$PatientInfoImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(name: 'nom_patient')
  String? get nomPatient;
  @override
  @JsonKey(name: 'pren_patient')
  String? get prenPatient;
  @override
  @JsonKey(name: 'cin_cnam')
  int? get cinCnam;
  @override
  int? get tel;

  /// Create a copy of PatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientInfoImplCopyWith<_$PatientInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateAppointmentRequest _$CreateAppointmentRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateAppointmentRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateAppointmentRequest {
  String get idMed => throw _privateConstructorUsedError;
  String get idNumDossier => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get heure => throw _privateConstructorUsedError;
  AppointmentStatus? get status => throw _privateConstructorUsedError;

  /// Serializes this CreateAppointmentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateAppointmentRequestCopyWith<CreateAppointmentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAppointmentRequestCopyWith<$Res> {
  factory $CreateAppointmentRequestCopyWith(CreateAppointmentRequest value,
          $Res Function(CreateAppointmentRequest) then) =
      _$CreateAppointmentRequestCopyWithImpl<$Res, CreateAppointmentRequest>;
  @useResult
  $Res call(
      {String idMed,
      String idNumDossier,
      String date,
      String heure,
      AppointmentStatus? status});
}

/// @nodoc
class _$CreateAppointmentRequestCopyWithImpl<$Res,
        $Val extends CreateAppointmentRequest>
    implements $CreateAppointmentRequestCopyWith<$Res> {
  _$CreateAppointmentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMed = null,
    Object? idNumDossier = null,
    Object? date = null,
    Object? heure = null,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      idMed: null == idMed
          ? _value.idMed
          : idMed // ignore: cast_nullable_to_non_nullable
              as String,
      idNumDossier: null == idNumDossier
          ? _value.idNumDossier
          : idNumDossier // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      heure: null == heure
          ? _value.heure
          : heure // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateAppointmentRequestImplCopyWith<$Res>
    implements $CreateAppointmentRequestCopyWith<$Res> {
  factory _$$CreateAppointmentRequestImplCopyWith(
          _$CreateAppointmentRequestImpl value,
          $Res Function(_$CreateAppointmentRequestImpl) then) =
      __$$CreateAppointmentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idMed,
      String idNumDossier,
      String date,
      String heure,
      AppointmentStatus? status});
}

/// @nodoc
class __$$CreateAppointmentRequestImplCopyWithImpl<$Res>
    extends _$CreateAppointmentRequestCopyWithImpl<$Res,
        _$CreateAppointmentRequestImpl>
    implements _$$CreateAppointmentRequestImplCopyWith<$Res> {
  __$$CreateAppointmentRequestImplCopyWithImpl(
      _$CreateAppointmentRequestImpl _value,
      $Res Function(_$CreateAppointmentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMed = null,
    Object? idNumDossier = null,
    Object? date = null,
    Object? heure = null,
    Object? status = freezed,
  }) {
    return _then(_$CreateAppointmentRequestImpl(
      idMed: null == idMed
          ? _value.idMed
          : idMed // ignore: cast_nullable_to_non_nullable
              as String,
      idNumDossier: null == idNumDossier
          ? _value.idNumDossier
          : idNumDossier // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      heure: null == heure
          ? _value.heure
          : heure // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateAppointmentRequestImpl
    with DiagnosticableTreeMixin
    implements _CreateAppointmentRequest {
  const _$CreateAppointmentRequestImpl(
      {required this.idMed,
      required this.idNumDossier,
      required this.date,
      required this.heure,
      this.status});

  factory _$CreateAppointmentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateAppointmentRequestImplFromJson(json);

  @override
  final String idMed;
  @override
  final String idNumDossier;
  @override
  final String date;
  @override
  final String heure;
  @override
  final AppointmentStatus? status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateAppointmentRequest(idMed: $idMed, idNumDossier: $idNumDossier, date: $date, heure: $heure, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreateAppointmentRequest'))
      ..add(DiagnosticsProperty('idMed', idMed))
      ..add(DiagnosticsProperty('idNumDossier', idNumDossier))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('heure', heure))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAppointmentRequestImpl &&
            (identical(other.idMed, idMed) || other.idMed == idMed) &&
            (identical(other.idNumDossier, idNumDossier) ||
                other.idNumDossier == idNumDossier) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.heure, heure) || other.heure == heure) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idMed, idNumDossier, date, heure, status);

  /// Create a copy of CreateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAppointmentRequestImplCopyWith<_$CreateAppointmentRequestImpl>
      get copyWith => __$$CreateAppointmentRequestImplCopyWithImpl<
          _$CreateAppointmentRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateAppointmentRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateAppointmentRequest implements CreateAppointmentRequest {
  const factory _CreateAppointmentRequest(
      {required final String idMed,
      required final String idNumDossier,
      required final String date,
      required final String heure,
      final AppointmentStatus? status}) = _$CreateAppointmentRequestImpl;

  factory _CreateAppointmentRequest.fromJson(Map<String, dynamic> json) =
      _$CreateAppointmentRequestImpl.fromJson;

  @override
  String get idMed;
  @override
  String get idNumDossier;
  @override
  String get date;
  @override
  String get heure;
  @override
  AppointmentStatus? get status;

  /// Create a copy of CreateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateAppointmentRequestImplCopyWith<_$CreateAppointmentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateAppointmentRequest _$UpdateAppointmentRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateAppointmentRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateAppointmentRequest {
  String? get idMed => throw _privateConstructorUsedError;
  String? get idNumDossier => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get heure => throw _privateConstructorUsedError;
  AppointmentStatus? get status => throw _privateConstructorUsedError;

  /// Serializes this UpdateAppointmentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateAppointmentRequestCopyWith<UpdateAppointmentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateAppointmentRequestCopyWith<$Res> {
  factory $UpdateAppointmentRequestCopyWith(UpdateAppointmentRequest value,
          $Res Function(UpdateAppointmentRequest) then) =
      _$UpdateAppointmentRequestCopyWithImpl<$Res, UpdateAppointmentRequest>;
  @useResult
  $Res call(
      {String? idMed,
      String? idNumDossier,
      String? date,
      String? heure,
      AppointmentStatus? status});
}

/// @nodoc
class _$UpdateAppointmentRequestCopyWithImpl<$Res,
        $Val extends UpdateAppointmentRequest>
    implements $UpdateAppointmentRequestCopyWith<$Res> {
  _$UpdateAppointmentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMed = freezed,
    Object? idNumDossier = freezed,
    Object? date = freezed,
    Object? heure = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      idMed: freezed == idMed
          ? _value.idMed
          : idMed // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumDossier: freezed == idNumDossier
          ? _value.idNumDossier
          : idNumDossier // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      heure: freezed == heure
          ? _value.heure
          : heure // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateAppointmentRequestImplCopyWith<$Res>
    implements $UpdateAppointmentRequestCopyWith<$Res> {
  factory _$$UpdateAppointmentRequestImplCopyWith(
          _$UpdateAppointmentRequestImpl value,
          $Res Function(_$UpdateAppointmentRequestImpl) then) =
      __$$UpdateAppointmentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? idMed,
      String? idNumDossier,
      String? date,
      String? heure,
      AppointmentStatus? status});
}

/// @nodoc
class __$$UpdateAppointmentRequestImplCopyWithImpl<$Res>
    extends _$UpdateAppointmentRequestCopyWithImpl<$Res,
        _$UpdateAppointmentRequestImpl>
    implements _$$UpdateAppointmentRequestImplCopyWith<$Res> {
  __$$UpdateAppointmentRequestImplCopyWithImpl(
      _$UpdateAppointmentRequestImpl _value,
      $Res Function(_$UpdateAppointmentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMed = freezed,
    Object? idNumDossier = freezed,
    Object? date = freezed,
    Object? heure = freezed,
    Object? status = freezed,
  }) {
    return _then(_$UpdateAppointmentRequestImpl(
      idMed: freezed == idMed
          ? _value.idMed
          : idMed // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumDossier: freezed == idNumDossier
          ? _value.idNumDossier
          : idNumDossier // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      heure: freezed == heure
          ? _value.heure
          : heure // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateAppointmentRequestImpl
    with DiagnosticableTreeMixin
    implements _UpdateAppointmentRequest {
  const _$UpdateAppointmentRequestImpl(
      {this.idMed, this.idNumDossier, this.date, this.heure, this.status});

  factory _$UpdateAppointmentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateAppointmentRequestImplFromJson(json);

  @override
  final String? idMed;
  @override
  final String? idNumDossier;
  @override
  final String? date;
  @override
  final String? heure;
  @override
  final AppointmentStatus? status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UpdateAppointmentRequest(idMed: $idMed, idNumDossier: $idNumDossier, date: $date, heure: $heure, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UpdateAppointmentRequest'))
      ..add(DiagnosticsProperty('idMed', idMed))
      ..add(DiagnosticsProperty('idNumDossier', idNumDossier))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('heure', heure))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAppointmentRequestImpl &&
            (identical(other.idMed, idMed) || other.idMed == idMed) &&
            (identical(other.idNumDossier, idNumDossier) ||
                other.idNumDossier == idNumDossier) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.heure, heure) || other.heure == heure) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idMed, idNumDossier, date, heure, status);

  /// Create a copy of UpdateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAppointmentRequestImplCopyWith<_$UpdateAppointmentRequestImpl>
      get copyWith => __$$UpdateAppointmentRequestImplCopyWithImpl<
          _$UpdateAppointmentRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateAppointmentRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateAppointmentRequest implements UpdateAppointmentRequest {
  const factory _UpdateAppointmentRequest(
      {final String? idMed,
      final String? idNumDossier,
      final String? date,
      final String? heure,
      final AppointmentStatus? status}) = _$UpdateAppointmentRequestImpl;

  factory _UpdateAppointmentRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateAppointmentRequestImpl.fromJson;

  @override
  String? get idMed;
  @override
  String? get idNumDossier;
  @override
  String? get date;
  @override
  String? get heure;
  @override
  AppointmentStatus? get status;

  /// Create a copy of UpdateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateAppointmentRequestImplCopyWith<_$UpdateAppointmentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateAppointmentResponse _$CreateAppointmentResponseFromJson(
    Map<String, dynamic> json) {
  return _CreateAppointmentResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateAppointmentResponse {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'rdv_id')
  String? get rdvId => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_med')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_num_dossier')
  String get patientId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get heure => throw _privateConstructorUsedError;
  AppointmentStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'linkedConsultation')
  String? get linkedConsultation => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CreateAppointmentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateAppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateAppointmentResponseCopyWith<CreateAppointmentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAppointmentResponseCopyWith<$Res> {
  factory $CreateAppointmentResponseCopyWith(CreateAppointmentResponse value,
          $Res Function(CreateAppointmentResponse) then) =
      _$CreateAppointmentResponseCopyWithImpl<$Res, CreateAppointmentResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'rdv_id') String? rdvId,
      @JsonKey(name: 'id_med') String doctorId,
      @JsonKey(name: 'id_num_dossier') String patientId,
      String date,
      String heure,
      AppointmentStatus status,
      @JsonKey(name: 'linkedConsultation') String? linkedConsultation,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$CreateAppointmentResponseCopyWithImpl<$Res,
        $Val extends CreateAppointmentResponse>
    implements $CreateAppointmentResponseCopyWith<$Res> {
  _$CreateAppointmentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateAppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rdvId = freezed,
    Object? doctorId = null,
    Object? patientId = null,
    Object? date = null,
    Object? heure = null,
    Object? status = null,
    Object? linkedConsultation = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      rdvId: freezed == rdvId
          ? _value.rdvId
          : rdvId // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      heure: null == heure
          ? _value.heure
          : heure // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus,
      linkedConsultation: freezed == linkedConsultation
          ? _value.linkedConsultation
          : linkedConsultation // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateAppointmentResponseImplCopyWith<$Res>
    implements $CreateAppointmentResponseCopyWith<$Res> {
  factory _$$CreateAppointmentResponseImplCopyWith(
          _$CreateAppointmentResponseImpl value,
          $Res Function(_$CreateAppointmentResponseImpl) then) =
      __$$CreateAppointmentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'rdv_id') String? rdvId,
      @JsonKey(name: 'id_med') String doctorId,
      @JsonKey(name: 'id_num_dossier') String patientId,
      String date,
      String heure,
      AppointmentStatus status,
      @JsonKey(name: 'linkedConsultation') String? linkedConsultation,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$CreateAppointmentResponseImplCopyWithImpl<$Res>
    extends _$CreateAppointmentResponseCopyWithImpl<$Res,
        _$CreateAppointmentResponseImpl>
    implements _$$CreateAppointmentResponseImplCopyWith<$Res> {
  __$$CreateAppointmentResponseImplCopyWithImpl(
      _$CreateAppointmentResponseImpl _value,
      $Res Function(_$CreateAppointmentResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateAppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rdvId = freezed,
    Object? doctorId = null,
    Object? patientId = null,
    Object? date = null,
    Object? heure = null,
    Object? status = null,
    Object? linkedConsultation = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CreateAppointmentResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      rdvId: freezed == rdvId
          ? _value.rdvId
          : rdvId // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      heure: null == heure
          ? _value.heure
          : heure // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus,
      linkedConsultation: freezed == linkedConsultation
          ? _value.linkedConsultation
          : linkedConsultation // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateAppointmentResponseImpl
    with DiagnosticableTreeMixin
    implements _CreateAppointmentResponse {
  const _$CreateAppointmentResponseImpl(
      {@JsonKey(name: '_id') this.id,
      @JsonKey(name: 'rdv_id') this.rdvId,
      @JsonKey(name: 'id_med') required this.doctorId,
      @JsonKey(name: 'id_num_dossier') required this.patientId,
      required this.date,
      required this.heure,
      this.status = AppointmentStatus.enAttente,
      @JsonKey(name: 'linkedConsultation') this.linkedConsultation,
      this.createdAt,
      this.updatedAt});

  factory _$CreateAppointmentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateAppointmentResponseImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey(name: 'rdv_id')
  final String? rdvId;
  @override
  @JsonKey(name: 'id_med')
  final String doctorId;
  @override
  @JsonKey(name: 'id_num_dossier')
  final String patientId;
  @override
  final String date;
  @override
  final String heure;
  @override
  @JsonKey()
  final AppointmentStatus status;
  @override
  @JsonKey(name: 'linkedConsultation')
  final String? linkedConsultation;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateAppointmentResponse(id: $id, rdvId: $rdvId, doctorId: $doctorId, patientId: $patientId, date: $date, heure: $heure, status: $status, linkedConsultation: $linkedConsultation, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreateAppointmentResponse'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('rdvId', rdvId))
      ..add(DiagnosticsProperty('doctorId', doctorId))
      ..add(DiagnosticsProperty('patientId', patientId))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('heure', heure))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('linkedConsultation', linkedConsultation))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAppointmentResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rdvId, rdvId) || other.rdvId == rdvId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.heure, heure) || other.heure == heure) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.linkedConsultation, linkedConsultation) ||
                other.linkedConsultation == linkedConsultation) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, rdvId, doctorId, patientId,
      date, heure, status, linkedConsultation, createdAt, updatedAt);

  /// Create a copy of CreateAppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAppointmentResponseImplCopyWith<_$CreateAppointmentResponseImpl>
      get copyWith => __$$CreateAppointmentResponseImplCopyWithImpl<
          _$CreateAppointmentResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateAppointmentResponseImplToJson(
      this,
    );
  }
}

abstract class _CreateAppointmentResponse implements CreateAppointmentResponse {
  const factory _CreateAppointmentResponse(
      {@JsonKey(name: '_id') final String? id,
      @JsonKey(name: 'rdv_id') final String? rdvId,
      @JsonKey(name: 'id_med') required final String doctorId,
      @JsonKey(name: 'id_num_dossier') required final String patientId,
      required final String date,
      required final String heure,
      final AppointmentStatus status,
      @JsonKey(name: 'linkedConsultation') final String? linkedConsultation,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$CreateAppointmentResponseImpl;

  factory _CreateAppointmentResponse.fromJson(Map<String, dynamic> json) =
      _$CreateAppointmentResponseImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(name: 'rdv_id')
  String? get rdvId;
  @override
  @JsonKey(name: 'id_med')
  String get doctorId;
  @override
  @JsonKey(name: 'id_num_dossier')
  String get patientId;
  @override
  String get date;
  @override
  String get heure;
  @override
  AppointmentStatus get status;
  @override
  @JsonKey(name: 'linkedConsultation')
  String? get linkedConsultation;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of CreateAppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateAppointmentResponseImplCopyWith<_$CreateAppointmentResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
