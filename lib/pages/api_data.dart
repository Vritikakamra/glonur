import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:glonur/classes/hospital.dart';

Future<List<Hospital>> getHospitalData() async {
  var response =
      await http.get(Uri.https('testapi.io', 'api/aravindh/hospitals'));
  var jsonData = jsonDecode(response.body);
  List<Hospital> hospitals = [];
  for (var h in jsonData) {
    Hospital hosp = Hospital(
        h['name'],
        h['location'],
        h['category'],
        h['open'],
        h['providerType'],
        h['foundedOn'],
        h['specialities'].toList(),
        h['facilities'].toList(),
        h['insurance'].toList(),
        h['workingDays'].toList(),
        h['services'].toList());
    hospitals.add(hosp);
  }
  return hospitals;
}
