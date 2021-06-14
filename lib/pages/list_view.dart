import 'package:flutter/material.dart';
import 'package:glonur/classes/hospital.dart';

class CustomListView extends StatefulWidget {
  final hospitalsList;
  CustomListView({@required this.hospitalsList});
  @override
  _CustomListViewState createState() => _CustomListViewState(hospitalsList);
}

class _CustomListViewState extends State<CustomListView> {
  List<Hospital> hospitalsList;
  _CustomListViewState(this.hospitalsList);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: hospitalsList.length,
      itemBuilder: (context, i) {
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.pink[200]),
              borderRadius: BorderRadius.all(Radius.circular(5))),
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
                    hospitalsList[i].name,
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
                Text(hospitalsList[i].location, style: TextStyle(fontSize: 20))
              ]),
              Row(children: [
                Icon(Icons.where_to_vote_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(hospitalsList[i].category, style: TextStyle(fontSize: 20)),
              ]),
              Row(children: [
                Icon(Icons.close),
                SizedBox(
                  width: 10,
                ),
                Text(hospitalsList[i].open, style: TextStyle(fontSize: 20))
              ]),
              Row(children: [
                Icon(Icons.account_balance_wallet_rounded),
                SizedBox(
                  width: 10,
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    hospitalsList[i].providerType,
                  ),
                )
              ]),
              Row(children: [
                Icon(Icons.clean_hands_sharp),
                SizedBox(
                  width: 10,
                ),
                Text(hospitalsList[i].foundedOn, style: TextStyle(fontSize: 20))
              ]),
            ],
          ),
        );
      },
    ));
  }
}
