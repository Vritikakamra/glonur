import 'package:flutter/material.dart';
import 'package:glonur/classes/hosp_filters.dart';
import 'package:glonur/classes/hospital.dart';
import 'package:glonur/pages/filters.dart';
import 'package:glonur/pages/api_data.dart';
import 'package:glonur/pages/settings.dart';

class HospitalList extends StatefulWidget {
  @override
  _HospitalListState createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {
  Map filtersMap = getFilters();
  List<Hospital> hospitalsList, filteredList;
  Widget appBarTitle = Text("Glonur");
  Icon actionIcon = Icon(Icons.search);
  @override
  void initState() {
    super.initState();
    getHospitalData().then((hospList) => {
          setState(() {
            hospitalsList = hospList;
            filteredList = hospitalsList;
          })
        });
  }

  void searching(value) {
    setState(() {
      filteredList = hospitalsList
          .where((hosp) =>
              hosp.name.toLowerCase().contains(value.toLowerCase()) ||
              hosp.location.toLowerCase().contains(value.toLowerCase()) ||
              hosp.category.toLowerCase().contains(value.toLowerCase()) ||
              hosp.open.toLowerCase().contains(value.toLowerCase()) ||
              hosp.providerType.toLowerCase().contains(value.toLowerCase()) ||
              hosp.foundedOn.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        centerTitle: true,
        actions: [
          IconButton(
              icon: actionIcon,
              onPressed: () {
                setState(() {
                  if (this.actionIcon.icon == Icons.search) {
                    this.actionIcon =
                        new Icon(Icons.close, color: Colors.white);
                    this.appBarTitle = TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          hintText: "Search...",
                          hintStyle: new TextStyle(color: Colors.white)),
                      onChanged: (val) {
                        searching(val);
                      },
                    );
                  } else {
                    filteredList = hospitalsList;
                    this.actionIcon = Icon(
                      Icons.search,
                      color: Colors.white,
                    );
                    this.appBarTitle = Text(
                      "Glonur",
                      style: new TextStyle(color: Colors.white),
                    );
                  }
                });
              }),
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
        ],
      ),
      drawer: Settings(),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        onPressed: () async {
          var filters = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return Filters(filters: filtersMap);
              });
          setState(() {
            if (filters != null) {
              filtersMap = filters;
              print(filtersMap);
              if (filtersMap["specialities"].length == 1 &&
                  filtersMap["facilities"].length == 1 &&
                  filtersMap["insurance"].length == 1 &&
                  filtersMap["workingDays"].length == 1 &&
                  filtersMap["services"].length == 1) {
                filteredList = hospitalsList;
              } else {
                if (filtersMap["nowOpen"] == true)
                  filteredList = hospitalsList
                      .where((hosp) =>
                          (hosp.specialities.any((element) =>
                                  filtersMap["specialities"]
                                      .contains(element)) ||
                              hosp.facilities.any((element) =>
                                  filtersMap["facilities"].contains(element)) ||
                              hosp.insurance.any((element) =>
                                  filtersMap["insurance"].contains(element)) ||
                              hosp.workingDays.any((element) =>
                                  filtersMap["workingDays"]
                                      .contains(element)) ||
                              hosp.services.any((element) => filtersMap["services"].contains(element))) &&
                          hosp.open == "Open")
                      .toList();
                else
                  filteredList = hospitalsList
                      .where((hosp) =>
                          hosp.specialities.any((element) =>
                              filtersMap["specialities"].contains(element)) ||
                          hosp.facilities.any((element) =>
                              filtersMap["facilities"].contains(element)) ||
                          hosp.insurance.any((element) =>
                              filtersMap["insurance"].contains(element)) ||
                          hosp.workingDays.any((element) =>
                              filtersMap["workingDays"].contains(element)) ||
                          hosp.services.any((element) =>
                              filtersMap["services"].contains(element)))
                      .toList();
              }
              print(filteredList.length);
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
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(5),
                child: filteredList == null
                    ? Text("Loading")
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: filteredList.length,
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
                                  FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      filteredList[i].name,
                                      style: TextStyle(color: Colors.red),
                                    ),
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
                                  Text(filteredList[i].location,
                                      style: TextStyle(fontSize: 20))
                                ]),
                                Row(children: [
                                  Icon(Icons.where_to_vote_outlined),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(filteredList[i].category,
                                      style: TextStyle(fontSize: 20)),
                                ]),
                                Row(children: [
                                  Icon(Icons.close),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(filteredList[i].open,
                                      style: TextStyle(fontSize: 20))
                                ]),
                                Row(children: [
                                  Icon(Icons.account_balance_wallet_rounded),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      filteredList[i].providerType,
                                    ),
                                  )
                                ]),
                                Row(children: [
                                  Icon(Icons.clean_hands_sharp),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(filteredList[i].foundedOn,
                                      style: TextStyle(fontSize: 20))
                                ]),
                              ],
                            ),
                          );
                        },
                      )),
          ],
        ),
      ),
    );
  }
}
