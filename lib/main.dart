//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'pointSetting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _result = 'a';

  @override
  Widget build(BuildContext context) {
    // ScreenData ('Screen Name' , 'Screen Image Directory')
    List<ScreenData> screenDataList = [];

    for (int i = 1; i < 9; i++) {
      String a = 'screen' + i.toString();
      String b = 'assets/images/screen' + i.toString() + '.png';
      ScreenData scData = ScreenData();
      scData.screenName = a;
      scData.imageDirectory = b;
      //scData.screenUsed = false;
      screenDataList.add(scData);
    }

    print(screenDataList[1].screenName);

    List<bool> _v = [true,false,true,false,true,false];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        
          // 1. 버튼으로 선택
          child: Column(
            children: [
              FloatingActionButton(
                onPressed: () => screenDialog(context, screenDataList),
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () => Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => PointSetting())),
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
            ],
          )

              //2. 스크린셀렉터
              // child: 
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisSize: MainAxisSize.max,
              //   //위젯 호출 부분
              //   children: <Widget>[
              //     ScreenSelector(
              //       screenDataList: screenDataList,
              //       selectedScreen: (selectedList){
              //         setState(() {
              //           _result = selectedList.toString();
              //         });
                        
              //       },
              //     ),
              //     Text("$_result")
              //   ],
              // ),

          // // 2. 스크린셀렉터 콜백
          // child: 
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisSize: MainAxisSize.max,
          //   //위젯 호출 부분
          //   children: <Widget>[
              
          //     // 1. ScreenSelector 호출, 리턴값 확인용
          //     ScreenSelector(
          //       screenDataList: screenDataList,
          //       screenData: (index , screenData){
          //         screenDataList[index].screenUsed = screenData.screenUsed;
          //         _result = screenData.screenUsed.toString();
          //       },
          //       ),
          //     Text("$_result")
          //   ],
          // ),


          // 3. 위젯 Text
          //  child: CheckBox2(
          //    values: _v,  
          //    onTap: (index, value) {
          //      //setState(() {
          //        _v[index] = value;
          //        //});
          //      },
          //     ),
               
               
        ),
      );
  }
}


typedef Checkbox2CallbackOnTap = Function(int index, bool checked);

class CheckBox2 extends StatefulWidget {
  final List<bool> values;
  Checkbox2CallbackOnTap onTap;
  CheckBox2({this.values, this.onTap});
  @override
  _CheckBox2State createState() => _CheckBox2State();
}

class _CheckBox2State extends State<CheckBox2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.values.length,
        itemBuilder: (context, index) {
          return Checkbox(
              value: widget.values[index],
              onChanged: (v) {
                setState(() {
                  widget.onTap(index, v);
                });
              });
        },
      ),
    );
  }
}

// class ScreenData{
//   String screenName;
//   String imageDirectory;
//   bool screenUsed;
// }

class ScreenData {
  String screenName;
  String imageDirectory;
  //ScreenData(this.screenName, this.imageDirectory);
}

// typedef OnTapCallback = Function(int index,ScreenData screenData);

typedef SelectedCallback = Function(List<int> selectedList);

// ignore: must_be_immutable
// class ScreenSelector extends StatefulWidget {
//   //Single / Multi 여부
//   bool multiSelect;

//   // 리턴 값 Callback
//   final OnTapCallback screenData;

//   // 입력 받을 화면 리스트
//   final List<ScreenData> screenDataList;

//   // 스크롤 방향
//   Axis scrollDirection;

//   // 외부속성
//   Color containerBgColor;
//   double selectorWidth;
//   double selectorHeight;
//   double outerPadding;

//   // 내부속성
//   Color cardBgColor;
//   double cardWidth;
//   double cardHeight;
//   double innerPadding;

//   ScreenSelector(
//       {@required this.screenDataList,
//       this.multiSelect,
//       this.screenData,
//       this.cardBgColor,
//       this.cardHeight,
//       this.cardWidth,
//       this.innerPadding,
//       this.outerPadding,
//       this.containerBgColor,
//       this.selectorHeight,
//       this.selectorWidth,
//       this.scrollDirection});

//   @override
//   _ScreenSelectorState createState() => _ScreenSelectorState();
// }

// class _ScreenSelectorState extends State<ScreenSelector> {
//   //사용 카드색상
//   Color realCardColor = Colors.black;

//   @override
//   Widget build(BuildContext context) {
//     //기본값 지정
//     if (widget.containerBgColor == null) {
//       widget.containerBgColor = Colors.grey;
//     }
//     if (widget.selectorHeight == null) {
//       widget.selectorHeight = 200;
//     }
//     if (widget.selectorWidth == null) {
//       widget.selectorWidth = 1800;
//     }
//     if (widget.outerPadding == null) {
//       widget.outerPadding = 10;
//     }

//     if (widget.cardBgColor == null) {
//       widget.cardBgColor = Colors.white60;
//     }
//     if (widget.cardHeight == null) {
//       widget.cardHeight = 100;
//     }
//     if (widget.cardWidth == null) {
//       widget.cardWidth = 250;
//     }
//     if (widget.innerPadding == null) {
//       widget.innerPadding = 20;
//     }

//     if (widget.scrollDirection == null) {
//       widget.scrollDirection = Axis.horizontal;
//     }
//     if (widget.multiSelect == null) {
//       widget.multiSelect = true;
//     }
//     realCardColor = widget.cardBgColor;

//     return Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(8.0)),
//           color: widget.containerBgColor,
//         ),
//         height: widget.selectorHeight,
//         width: widget.selectorWidth,
//         child: ListView.builder(
//           itemCount: widget.screenDataList.length,
//           scrollDirection: widget.scrollDirection,
//           itemBuilder: (context, index) {
//             if(widget.screenDataList[index].screenUsed = false){
//               realCardColor = Colors.redAccent;
//             }
//             return InkWell(
              
//                 onTap: () {
//                   if(!widget.screenDataList[index].screenUsed){
//                     widget.screenDataList[index].screenUsed =true;
//                     setState(() {});
//                   }
//                   else{
//                     widget.screenDataList[index].screenUsed = false;
//                     setState(() {});
//                   }
//                   setState(() {
//                     widget.screenData(index ,widget.screenDataList[index]);
//                   });
                  
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.all(widget.outerPadding),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       color: realCardColor,
//                     ),
//                     height: widget.cardHeight,
//                     width: widget.cardWidth,
//                     child: Padding(
//                       padding: EdgeInsets.all(widget.innerPadding),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             flex: 7,
//                             child:
//                                 //이미지
//                                 SizedBox(
//                                     child: Image(
//                               image: AssetImage(
//                                   widget.screenDataList[index].imageDirectory
//                                   ),
//                               fit: BoxFit.contain,
//                             )),
//                           ),
//                           Expanded(
//                               flex: 3,
//                               child: FittedBox(
//                                 child: Text(
//                                     widget.screenDataList[index].screenName),
//                                 fit: BoxFit.contain,
//                               ))
//                         ],
//                       ),
//                     ),
//                   ),
//                 ));
//           },
//         ));
//   }
// }

// ignore: must_be_immutable
class ScreenSelector extends StatefulWidget {
  //Single / Multi 여부
  bool multiSelect;

  // 리턴 값 Callback
  final SelectedCallback selectedScreen;

  // 입력 받을 화면 리스트
  final List<ScreenData> screenDataList;

  // 스크롤 방향
  Axis scrollDirection;

  // 외부속성
  Color containerBgColor;
  double selectorWidth;
  double selectorHeight;
  double outerPadding;

  // 내부속성
  Color cardBgColor;
  double cardWidth;
  double cardHeight;
  double innerPadding;

  Color savedBgColor;

  ScreenSelector(
      {@required this.screenDataList,
      this.multiSelect,
      this.selectedScreen,
      this.cardBgColor,
      this.cardHeight,
      this.cardWidth,
      this.innerPadding,
      this.outerPadding,
      this.containerBgColor,
      this.selectorHeight,
      this.selectorWidth,
      this.scrollDirection});

  @override
  _ScreenSelectorState createState() => _ScreenSelectorState();
}

class _ScreenSelectorState extends State<ScreenSelector> {
  // 반환 리스트
  List<int> selectedList = [];

  @override
  Widget build(BuildContext context) {
    //기본값 지정
    if (widget.containerBgColor == null) {
      widget.containerBgColor = Colors.grey;
    }
    if (widget.selectorHeight == null) {
      widget.selectorHeight = 200;
    }
    if (widget.selectorWidth == null) {
      widget.selectorWidth = 1800;
    }
    if (widget.outerPadding == null) {
      widget.outerPadding = 10;
    }

    if (widget.cardBgColor == null) {
      widget.cardBgColor = Colors.white60;
    }
    if (widget.cardHeight == null) {
      widget.cardHeight = 100;
    }
    if (widget.cardWidth == null) {
      widget.cardWidth = 250;
    }
    if (widget.innerPadding == null) {
      widget.innerPadding = 20;
    }

    if (widget.scrollDirection == null) {
      widget.scrollDirection = Axis.horizontal;
    }
    if (widget.multiSelect == null) {
      widget.multiSelect = true;
    }
    widget.savedBgColor = widget.cardBgColor;

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: widget.containerBgColor,
        ),
        height: widget.selectorHeight,
        width: widget.selectorWidth,
        child: ListView.builder(
          itemCount: widget.screenDataList.length,
          scrollDirection: widget.scrollDirection,
          itemBuilder: (context, index) {
            if (selectedList.contains(index)) {
              widget.savedBgColor = Colors.greenAccent[400];
            } else {
              widget.savedBgColor = widget.cardBgColor;
            }

            return InkWell(
                onTap: () {
                  //single Select
                  if (!widget.multiSelect) {
                    //이전에 누른값 초기화
                    selectedList = [];
                    selectedList.add(index);
                    selectedList = widget.selectedScreen(selectedList);
                    setState(() {});
                  }

                  // Multi Select
                  else {
                    // 예외 : 같은 카드 중복클릭시 리스트에서 제거
                    if (selectedList.contains(index)) {
                      selectedList.remove(index);
                      widget.selectedScreen(selectedList);
                      setState(() {});
                    } else {
                      selectedList.add(index);
                      selectedList.sort();
                      widget.selectedScreen(selectedList);
                      setState(() {});
                    }
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(widget.outerPadding),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: widget.savedBgColor,
                    ),
                    //color: widget.cardBgColor,
                    height: widget.cardHeight,
                    width: widget.cardWidth,
                    child: Padding(
                      padding: EdgeInsets.all(widget.innerPadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 7,
                            child:
                                //이미지
                                SizedBox(
                                    child: Image(
                              image: AssetImage(
                                  widget.screenDataList[index].imageDirectory),
                              fit: BoxFit.contain,
                            )),
                          ),
                          Expanded(
                              flex: 3,
                              child: FittedBox(
                                child: Text(
                                    widget.screenDataList[index].screenName),
                                fit: BoxFit.contain,
                              ))
                        ],
                      ),
                    ),
                  ),
                ));
          },
        ));
  }
}

Future screenDialog(
    BuildContext context, List<ScreenData> screenDataList) async {
  String _result = '';
  List<int> returnList = [];
  return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text('Screen Select'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ScreenSelector(
                    screenDataList: screenDataList,

                    // 리스트뷰 높이
                    selectorHeight: 200,
                    // 리스트뷰 너비
                    selectorWidth: 1000,
                    // 카드 높이
                    cardHeight: 180,
                    // 카드 너비
                    cardWidth: 220,
                    // 리스트뷰-카드 패딩
                    outerPadding: 7,
                    // 카드 - 이미지 패딩
                    innerPadding: 5,
                    // 리스트뷰 색상
                    containerBgColor: Colors.grey,
                    // 카드 색상
                    cardBgColor: Colors.white60,
                    // 다중선택 여부
                    multiSelect: true,
                    // 스크롤 방향
                    scrollDirection: Axis.horizontal,
                    selectedScreen: (selectedList) {
                      setState(() {
                        _result = selectedList.toString();
                      });
                      returnList = selectedList;
                      return selectedList;
                    }),
                Text("$_result")
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  // **** Select한 스크린 index 리스트 값 전달하는 부분****
                  //setup.list = returnList;
                  Navigator.of(context).pop();
                },
                child: Text('확인'),
              )
            ],
          );
        });
      });
}
