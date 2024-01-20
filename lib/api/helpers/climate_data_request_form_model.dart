const String climateDataRequestForm = 'climate';
const String files = 'files';

class ClimateFields {
  /// All values
  static final List<String> formValues = [
    id,
    weatherStationUnderConstruction,
    listOfWeatherStations,
    stationClassification,
    stationClass,
    proposedStationLocation,
    latitude,
    longitude,
    ownership,
    rent,
    stationType,
    stationAddress,
    delegateName,
    idNumber,
    authorizationReferenceNumber,
    signatureDigital,
    uploadDocument,
  ];
  static final List<String> filesValues = [
    id,
    path,
    idNumber,
  ];

  static const String id = 'id';
  static const String weatherStationUnderConstruction =
      'weather_station_under_construction';
  static const String listOfWeatherStations = 'list_of_weather_stations';
  static const String stationClassification = 'station_classification';
  static const String stationClass = 'station_class';
  static const String proposedStationLocation = 'proposed_station_location';
  static const String latitude = 'latitude';
  static const String longitude = 'longitude';
  static const String ownership = 'ownership';
  static const String rent = 'rent';
  static const String stationType = 'station_type';
  static const String stationAddress = 'station_address';
  static const String delegateName = 'delegate_name';
  static const String idNumber = 'id_number';
  static const String authorizationReferenceNumber =
      'authorization_reference_number';
  static const String signatureDigital = 'signature_digital';
  static const String uploadDocument = 'upload_document';
  static const String path = 'path';
  static const String climateId = 'climate_id';
}

class ClimateDataRequestFormModel {
  int? id;
  int? weatherStationUnderConstruction;
  int? listOfWeatherStations;
  String? stationClassification;
  String? stationClass;
  String? proposedStationLocation;
  double? latitude;
  double? longitude;
  int? ownership;
  int? rent;
  int? stationType;
  String? stationAddress;
  String? delegateName;
  String? idNumber;
  String? authorizationReferenceNumber;

  ClimateDataRequestFormModel({
    this.id,
    this.weatherStationUnderConstruction,
    this.listOfWeatherStations,
    this.stationClassification,
    this.stationClass,
    this.proposedStationLocation,
    this.latitude,
    this.longitude,
    this.ownership,
    this.rent,
    this.stationType,
    this.stationAddress,
    this.delegateName,
    this.idNumber,
    this.authorizationReferenceNumber,
  });

  ClimateDataRequestFormModel copy({
    int? id,
    int? weatherStationUnderConstruction,
    int? listOfWeatherStations,
    String? stationClassification,
    String? stationClass,
    String? proposedStationLocation,
    double? latitude,
    double? longitude,
    int? ownership,
    int? rent,
    int? stationType,
    String? stationAddress,
    String? delegateName,
    String? idNumber,
    String? authorizationReferenceNumber,
  }) =>
      ClimateDataRequestFormModel(
        id: id ?? this.id,
        weatherStationUnderConstruction: weatherStationUnderConstruction ??
            this.weatherStationUnderConstruction,
        listOfWeatherStations:
            listOfWeatherStations ?? this.listOfWeatherStations,
        stationClassification:
            stationClassification ?? this.stationClassification,
        stationClass: stationClass ?? this.stationClass,
        proposedStationLocation:
            proposedStationLocation ?? this.proposedStationLocation,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        ownership: ownership ?? this.ownership,
        rent: rent ?? this.rent,
        stationType: stationType ?? this.stationType,
        stationAddress: stationAddress ?? this.stationAddress,
        delegateName: delegateName ?? delegateName,
        idNumber: idNumber ?? this.idNumber,
        authorizationReferenceNumber:
            authorizationReferenceNumber ?? this.authorizationReferenceNumber,
      );

  static ClimateDataRequestFormModel fromJson(Map<String, Object?> json) =>
      ClimateDataRequestFormModel(
        id: json[ClimateFields.id] as int?,
        weatherStationUnderConstruction:
            json[ClimateFields.weatherStationUnderConstruction] as int?,
        listOfWeatherStations:
            json[ClimateFields.listOfWeatherStations] as int?,
        stationClassification:
            json[ClimateFields.stationClassification] as String?,
        stationClass: json[ClimateFields.stationClass] as String?,
        proposedStationLocation:
            json[ClimateFields.proposedStationLocation] as String?,
        latitude: json[ClimateFields.latitude] as double?,
        longitude: json[ClimateFields.longitude] as double?,
        ownership: json[ClimateFields.ownership] as int?,
        rent: json[ClimateFields.rent] as int?,
        stationType: json[ClimateFields.stationType] as int?,
        stationAddress: json[ClimateFields.stationAddress] as String?,
        delegateName: json[ClimateFields.delegateName] as String?,
        idNumber: json[ClimateFields.idNumber] as String?,
        authorizationReferenceNumber:
            json[ClimateFields.authorizationReferenceNumber] as String?,
      );

  Map<String, Object?> toJson() => {
        ClimateFields.id: id,
        ClimateFields.weatherStationUnderConstruction:
            weatherStationUnderConstruction,
        ClimateFields.listOfWeatherStations: listOfWeatherStations,
        ClimateFields.stationClassification: stationClassification,
        ClimateFields.stationClass: stationClass,
        ClimateFields.proposedStationLocation: proposedStationLocation,
        ClimateFields.latitude: latitude,
        ClimateFields.longitude: longitude,
        ClimateFields.ownership: ownership,
        ClimateFields.rent: rent,
        ClimateFields.stationType: stationType,
        ClimateFields.stationAddress: stationAddress,
        ClimateFields.delegateName: delegateName,
        ClimateFields.idNumber: idNumber,
        ClimateFields.authorizationReferenceNumber:
            authorizationReferenceNumber,
      };
}

class Files {
  int? id;
  String? path;
  int? climateId;

  Files({this.id, this.path, this.climateId});

  Files copy({
    int? id,
    String? path,
    int? climateId,
  }) =>
      Files(
        id: id ?? this.id,
        path: path ?? this.path,
        climateId: climateId ?? this.climateId,
      );

  static Files fromJson(Map<String, Object?> json) => Files(
        id: json[ClimateFields.id] as int?,
        path: json[ClimateFields.path] as String?,
    climateId: json[ClimateFields.climateId] as int?,
      );

  Map<String, Object?> toJson() => {
        ClimateFields.id: id,
        ClimateFields.path: path,
        ClimateFields.climateId: climateId,
      };
}
