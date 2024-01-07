class AirPortsModel {
  String? countryIataCode;
  String? countryName;
  String? cityName;
  String? cityIataCode;
  List<Airports>? airports;

  AirPortsModel(
      {this.countryIataCode,
      this.countryName,
      this.cityName,
      this.cityIataCode,
      this.airports});

  AirPortsModel.fromJson(Map<String, dynamic> json) {
    countryIataCode = json['countryIataCode'] ?? "";
    countryName = json['countryName'] ?? "";
    cityName = json['cityName'] ?? "";
    cityIataCode = json['cityIataCode'] ?? "";
    if (json['airports'] != null) {
      airports = <Airports>[];
      json['airports'].forEach((v) {
        airports!.add(Airports.fromJson(v));
      });
    } else {
      airports = <Airports>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['countryIataCode'] = countryIataCode;
    data['countryName'] = countryName;
    data['cityName'] = cityName;
    data['cityIataCode'] = cityIataCode;
    if (airports != null) {
      data['airports'] = airports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Airports {
  String? airportName;
  String? airportIataCode;

  Airports({this.airportName, this.airportIataCode});

  Airports.fromJson(Map<String, dynamic> json) {
    airportName = json['airportName'] ?? "";
    airportIataCode = json['airportIataCode'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['airportName'] = airportName;
    data['airportIataCode'] = airportIataCode;
    return data;
  }
}