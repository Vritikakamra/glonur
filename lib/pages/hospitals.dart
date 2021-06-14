import 'package:flutter/material.dart';
import 'package:glonur/classes/hospital.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HospitalList extends StatefulWidget {
  @override
  _HospitalListState createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {
  List hospitalsList;
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
        onPressed: () {},
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
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: hospitalsList.length,
                      itemBuilder: (context, i) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.pink[200]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Column(
                            children: [
                              Row(children: [
                                Icon(
                                  Icons.local_hospital_outlined,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  hospitalsList[i].name,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 25),
                                )
                              ]),
                              Divider(
                                color: Colors.grey[900],
                              ),
                              Row(children: [
                                Icon(Icons.location_on_outlined),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(hospitalsList[i].location,
                                    style: TextStyle(fontSize: 20))
                              ]),
                              Row(children: [
                                Icon(Icons.where_to_vote_outlined),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(hospitalsList[i].category,
                                    style: TextStyle(fontSize: 20)),
                              ]),
                              Row(children: [
                                Icon(Icons.close),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(hospitalsList[i].open,
                                    style: TextStyle(fontSize: 20))
                              ]),
                              Row(children: [
                                Icon(Icons.account_balance_wallet_rounded),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(hospitalsList[i].category,
                                    style: TextStyle(fontSize: 20))
                              ]),
                              Row(children: [
                                Icon(Icons.clean_hands_sharp),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(hospitalsList[i].foundedOn,
                                    style: TextStyle(fontSize: 20))
                              ]),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
