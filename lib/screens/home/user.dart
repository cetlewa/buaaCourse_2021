import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuildUserBody(),
    );
  }
}

class BuildUserBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(32.0),
      child: new Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Icon(
                Icons.account_circle_outlined,
                color: Colors.blueGrey,
                size: 100.0,
              ),
            ),
          ),
          Expanded(
            flex: 2,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('姓名')),
                  DataColumn(label: Text('性别')),
                  DataColumn(label: Text('学号')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('蔡明生')),
                    DataCell(Text('女')),
                    DataCell(Text('19373533')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('刘博一')),
                    DataCell(Text('男')),
                    DataCell(Text('19373427')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('曾育群')),
                    DataCell(Text('男')),
                    DataCell(Text('19373630')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('朱祖坤')),
                    DataCell(Text('男')),
                    DataCell(Text('19373529')),
                  ]),
                ],
              ),
          ),
          // Expanded(
          //   child: Text(
          //     "line1",
          //     style: new TextStyle(
          //       fontSize: 32.0,
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: Text("line2"),
          // ),
          // Expanded(
          //   child: Text("line3"),
          // ),
          // Expanded(
          //   child: Text("line4"),
          // ),
        ],
      ),
    );
  }
}
