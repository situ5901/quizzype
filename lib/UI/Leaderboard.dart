import 'package:flutter/material.dart';

void main() {
  runApp(Leaderboard());
}

class Leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leaderboard',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white), // arrow color white
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Leaderboard', style: TextStyle(color: Colors.white)), // title color white
          backgroundColor: Colors.blue, // title background color blue
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity, // full width
              padding: EdgeInsets.all(16), // add some padding
              color: Colors.red, // background color red
              child: Text(
                "FINAL RESULT OUT AT",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ), // added Text widget
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Rank')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Score')),
                DataColumn(label: Text('Time')),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text('1')),
                    DataCell(Text('✨John Doe')),
                    DataCell(Text('1000')),
                    DataCell(Text('10:45')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('2')),
                    DataCell(Text('✨Jane ')),
                    DataCell(Text('900')),
                    DataCell(Text('11:10')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('3')),
                    DataCell(Text('✨Bob ')),
                    DataCell(Text('850')),
                    DataCell(Text('10:50')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('4')),
                    DataCell(Text('✨Alice')),
                    DataCell(Text('800')),
                    DataCell(Text('11:20')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}