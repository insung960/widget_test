import 'package:flutter/material.dart';

class ScreenSelector extends StatefulWidget {
  @override
  _ScreenSelectorState createState() => _ScreenSelectorState();
}

class _ScreenSelectorState extends State<ScreenSelector> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
            title: Text('여기가 제목'),
            ),
        body: Container(
          //child: PointList(psList: pointSetting),
        ));
  }
}

//스크린데이터
class ScData {
  String screenName;
  String imgDirectory;
  bool checked;
}

typedef SingleOnTapCallback = Function(ScData scData);
typedef MultiOnTapCallback = Function(List<ScData> scDataList);

class ScSelector extends StatefulWidget {
  
  final SingleOnTapCallback singleScData;

  final MultiOnTapCallback multiScData;

  final List<ScData> list;

  bool multiSelect = false;

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

  ScSelector({
    this.multiSelect,
    this.singleScData,
    this.multiScData,
    @required this.list,
    this.scrollDirection,
    this.containerBgColor,
    this.selectorWidth,
    this.selectorHeight,
    this.outerPadding,
    this.cardBgColor,
    this.cardWidth,
    this.cardHeight,
    this.innerPadding,
    this.savedBgColor
  });

  @override
  State<StatefulWidget> createState() => _ScSelectorState();
}

class _ScSelectorState extends State<ScSelector> {

  @override
  Widget build(BuildContext context) {
    // 기본값 지정
    if (widget.multiSelect == null){
      widget.multiSelect = true;
    }
    if (widget.scrollDirection == null){
      widget.scrollDirection = Axis.horizontal;
    }
    if (widget.containerBgColor == null){
      widget.containerBgColor = Colors.grey;
    }
    if (widget.selectorWidth == null){
      widget.selectorWidth = 1000;
    }
    if (widget.selectorHeight == null){
      widget.selectorHeight = 300;
    }
    if (widget.outerPadding == null){
      widget.outerPadding = 5;
    }
    if (widget.cardBgColor == null){
      widget.cardBgColor = Colors.black;
    }
    if (widget.cardWidth == null){
      widget.cardWidth = 300;
    }
    if (widget.cardHeight == null){
      widget.cardHeight = 250;
    }
    if (widget.innerPadding == null){
      widget.innerPadding = 5;
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
        
      ),
    );
  }
}