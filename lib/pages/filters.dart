import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Filters extends StatefulWidget {
  final Map filters;
  Filters({this.filters});
  @override
  _FiltersState createState() => _FiltersState(filters: filters);
}

class _FiltersState extends State<Filters> {
  Map filters;
  _FiltersState({this.filters});
  final specialities = ["Gynacology", "Orthology", "speciality"]
      .map((e) => MultiSelectItem(e, e))
      .toList();
  final facilities = ["facility1", "facility2", "facility3"]
      .map((e) => MultiSelectItem(e, e))
      .toList();
  final insurance =
      ["cashless", "lic", "test"].map((e) => MultiSelectItem(e, e)).toList();
  final workingDays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ].map((e) => MultiSelectItem(e, e)).toList();
  final services = [
    "Cafeteria facility",
    "Emergency Services",
    "Inpatients",
    "Lab Services",
    "Nursing services",
    "Pharmacy",
    "Radiology Imaging",
    "services",
    "Trauma Care"
  ].map((e) => MultiSelectItem(e, e)).toList();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(15),
      contentPadding: EdgeInsets.all(7),
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      title: Text("Filters"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(filters);
            },
            child: Text("OK")),
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CheckboxListTile(
                title: Text("Now Open"),
                value: filters["nowOpen"],
                onChanged: (bool val) {
                  this.setState(() {
                    filters["nowOpen"] = val;
                  });
                }),
            MultiSelectChipField(
              items: specialities,
              title: Text("SPECIALITIES"),
              initialValue: filters["specialities"],
              onTap: (values) {
                setState(() {
                  filters["specialities"] = values;
                });
              },
            ),
            MultiSelectChipField(
              items: facilities,
              title: Text("FACILITIES"),
              initialValue: filters["facilities"],
              onTap: (values) {
                setState(() {
                  filters["facilities"] = values;
                });
              },
            ),
            MultiSelectChipField(
              items: insurance,
              title: Text("INSURANCE"),
              initialValue: filters["insurance"],
              onTap: (values) {
                setState(() {
                  filters["insurance"] = values;
                });
              },
            ),
            MultiSelectChipField(
              items: workingDays,
              title: Text("WORKING DAYS"),
              scroll: false,
              initialValue: filters["workingDays"],
              onTap: (values) {
                setState(() {
                  filters["workingDays"] = values;
                });
              },
            ),
            MultiSelectChipField(
              items: services,
              title: Text("SERVICES"),
              scroll: false,
              initialValue: filters["services"],
              onTap: (values) {
                setState(() {
                  filters["services"] = values;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
