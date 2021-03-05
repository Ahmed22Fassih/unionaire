import 'package:flutter/material.dart';

import 'database/serviceData.dart';



class DoneScreen extends StatefulWidget {
  static const routeName = '/doneScreen';

  @override
  _DoneScreenState createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  ServiceData months = ServiceData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: months.fetchMonthsNames(),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: months.months.length,
                      itemBuilder: (ctx, i) => Card(
                        margin: EdgeInsets.only(top: 20 , left: 50 , right: 50),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(months.months[i]),
                          ),
                        ),
                      ),
                    ),
        ));
  }
}
