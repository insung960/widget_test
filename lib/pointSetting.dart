import 'package:flutter/material.dart';

class PointSettingData {
  String pointName;
  String tagName;
}

TextEditingController _textController = new TextEditingController();

class PointSetting extends StatefulWidget {
  @override
  _PointSettingState createState() => _PointSettingState();
}

class _PointSettingState extends State<PointSetting> {
  //Setup setup;
  List<PointSettingData> pointSetting = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 20; i++) {
      PointSettingData pSData = PointSettingData();
      pSData.pointName = 'pointName' + (i + 1).toString();
      pSData.tagName = 'pointName' + (i + 1).toString();
      pointSetting.add(pSData);
    }

    return Scaffold(
        appBar: AppBar(
            title: Row(
          children: [
            Text('여기가 제목'),
            Expanded(flex: 6, child: Container()),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.white),
              height: 34,
              width: 100,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: TextField(
                  autofocus: true,
                  controller: _textController,
                  textAlignVertical: TextAlignVertical.center,
                  onSubmitted: (v) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: "검색",
                  ),
                ),
              ),
            ),
          ],
        )),
        body: Container(
          child: PointList(psList: pointSetting),
        ));
  }
}

//----------------------------------------------------------------------------------------------

// ignore: must_be_immutable
class PointList extends StatefulWidget {
  List<PointSettingData> psList;

  PointList({this.psList});

  @override
  _PointListState createState() => _PointListState();
}

class _PointListState extends State<PointList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.psList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return InkWell(
              //Dialog 생성
              onTap: (){
                pointSettingDialog(context, widget.psList[index].pointName, widget.psList[index].tagName);
              },
              child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text('$index'),
                ),
                title: Row(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(widget.psList[index].pointName),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(widget.psList[index].tagName),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Divider()
            ],
          ));
        },
      ),
    );

    /*
    return Container(
      child: ListView.builder(
        itemCount: widget.psList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index){
          return InkWell(
            child: ListTile.(

              leading: CircleAvatar(
                child: Text('$index'),
              ),
              title: Text(widget.psList[index].pointName),
              trailing: Text(widget.psList[index].tagName),
            ),
          );
        },
      ),
    );
    */
  }
}

Future pointSettingDialog(BuildContext context, String pointName, String tagName) async{
  return await showDialog(
    context: context,
    barrierDismissible:  false,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          title: Text('포인트 설정'),
          insetPadding: const EdgeInsets.symmetric(horizontal: 10),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(pointName),
              TextField(
                //controller: ,
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                //setup의 Map에 저장하는 부분
                Navigator.of(context).pop();
              },
              child: Text('저장')
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소')
            )
          ],
        );
        }
      );
    }
  );
}
