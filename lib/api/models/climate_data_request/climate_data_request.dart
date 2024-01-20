import 'dart:io';

class ClimateDataRequest {
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
  File? signatureDigital;
  File? uploadDocument;

  ClimateDataRequest(
      {this.weatherStationUnderConstruction,
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
      this.signatureDigital,
      this.uploadDocument});
}
