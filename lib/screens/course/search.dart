import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Search();

}

class _Search extends State<Search>{
  TextEditingController _searchController = TextEditingController();
  bool _switchSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择您想要搜索的内容"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Switch(
                    value: _switchSelected,
                    onChanged:(value){
                      setState(() {
                        _switchSelected=value;
                      });
                    },
                  ),
                  _switchSelected ? Text("课程相关搜索") : Text("教师相关搜索") ,
                ],
              ),
              Card(
                child: TextField(
                  controller: _searchController,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 93, 93, 93)),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 126, 126, 126),
                      ),
                      onPressed: () {
                        _searchController.text = "";
                      },
                    ),
                  ),
                ),
              ),
              Container(
                height: 45.0,
                margin: EdgeInsets.only(top: 20.0),
                child: SizedBox.expand(
                  child: RaisedButton(
                    onPressed: _searchCourse,
                    color: Colors.blue,
                    child: const Text(
                      "进行搜索",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _searchCourse() {
    Navigator.of(context).pushNamed("search_result_page", arguments: _switchSelected.toString() + "&" + _searchController.text);
  }
}