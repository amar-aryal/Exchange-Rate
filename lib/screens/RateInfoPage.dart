import 'package:exchange_rate/models/Rate.dart';
import 'package:exchange_rate/services/api.dart';
import 'package:flutter/material.dart';

class RateInfoPage extends StatefulWidget {
  @override
  _RateInfoPageState createState() => _RateInfoPageState();
}

class _RateInfoPageState extends State<RateInfoPage> {
  TextStyle tstyle = TextStyle(
      fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold);

  Future<Rate> getvalues() {
    return Data().getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exchange Rates (EURO)', style: TextStyle(fontSize: 20.0)),
        centerTitle: true,
        backgroundColor: Color(0xff6014a3),
      ),
      body: FutureBuilder(
        future: getvalues(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;

            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff6014a3), Color(0xff7e2fc4)],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  margin: EdgeInsets.all(10.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('1 ${data.base}', style: tstyle),
                      Text(
                          '${data.rates[currencies[index]].toString()} ${currencies[index]}',
                          style: tstyle)
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
