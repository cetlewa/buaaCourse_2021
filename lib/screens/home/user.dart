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

var _sortAscending = true;

class _BuildUserBodyState extends State<BuildUserBody> {
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
                  sortColumnIndex: 2,
                  sortAscending: _sortAscending,
                  columns: [
                    DataColumn(label: Text('姓名')),
                    DataColumn(label: Text('性别')),
                    DataColumn(
                        label: Text('学号'),
                        numeric: true,
                        onSort: (int columnIndex, bool ascending){
                          setState(() {
                            _sortAscending = ascending;
                            if(ascending){
                              data.sort((a, b) => a.sid.compareTo(b.sid));
                            }else {
                              data.sort((a, b) => b.sid.compareTo(a.sid));
                            }
                          });
                        }),
                  ],
                  rows: data.map((user) {
                    return DataRow(cells: [
                      DataCell(Text('${user.name}')),
                      DataCell(Text('${user.gender}')),
                      DataCell(Text('${user.sid}')),
                    ]);
                  }).toList()),
          ),

          // Expanded(
          //   child: Text(
          //     "line1",
          //     style: new TextStyle(
          //       fontSize: 32.0,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

}

class BuildUserBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BuildUserBodyState();
  }


}

class UserInfo {
  UserInfo(this.name, this.gender, this.sid);

  final String name;
  final String gender;
  final int sid;
}

List<UserInfo> data=[
  UserInfo("蔡明生", "女", 19373533),
  UserInfo("刘博一", "男", 19373427),
  UserInfo("曾育群", "男", 19373630),
  UserInfo("朱祖坤", "男", 19373529),
];

