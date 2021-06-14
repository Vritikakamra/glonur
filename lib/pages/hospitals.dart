import 'package:flutter/material.dart';
import 'package:glonur/classes/hospital.dart';
import 'package:glonur/pages/filters.dart';
import 'package:glonur/pages/list_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HospitalList extends StatefulWidget {
  @override
  _HospitalListState createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {
  List hospitalsList, hospList;
  bool nowOpen = false;
  Future getHospitalData() async {
    var response =
        await http.get(Uri.https('testapi.io', 'api/aravindh/hospitals'));
    var jsonData = jsonDecode(response.body);
    List<Hospital> hospitals = [];
    for (var h in jsonData) {
      Hospital hosp = Hospital(h['name'], h['location'], h['category'],
          h['open'], h['providerType'], h['foundedOn']);
      hospitals.add(hosp);
    }
    this.setState(() {
      hospList = hospitals;
      hospitalsList = hospitals;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getHospitalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        onPressed: () async {
          var filters = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return Filters(nowOpen: this.nowOpen);
              });
          setState(() {
            if (filters != null) {
              nowOpen = filters[0];
              if (nowOpen == true)
                hospitalsList.where((hosp) => hosp.open == "Open");
            }
          });
        },
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(),
        label: Text("Filter",
            style: TextStyle(
              color: Colors.black,
            )),
        icon: Icon(
          Icons.filter_alt,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
                padding: EdgeInsets.all(5),
                child: hospitalsList == null
                    ? Text("Loading")
                    : CustomListView(hospitalsList: hospitalsList)),
          ],
        ),
      ),
    );
  }
}
