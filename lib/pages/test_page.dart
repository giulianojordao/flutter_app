import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  var controller = TextEditingController();
  var focusNode = FocusNode();
  var text = 'Hi, touch me!';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return normalWidget(context);
//    return WillPopScope(child: scaffoldWidget(),
//        onWillPop: () async {
//      print('onWillPop');
//      // 返回 true 表示允许返回
//      // 返回 false 表示不允许返回
//      return true;
//    });
  }

  normalWidget(BuildContext context) {
    return _buildSafeAreaTest(context);
  }

  scaffoldWidget() {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      primary: true,
      body: _buildTest(),
    );
  }

  _buildTextFieldTest() {
    return Container(
        // 对齐方式
        alignment: Alignment.bottomCenter,
        // 子 Widget
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 500)),
            TextField(
              autofocus: true,
              focusNode: focusNode,
              decoration: InputDecoration(
                icon: Icon(Icons.add_a_photo),
                labelText: '用户名',
                hintText: '用户名或邮箱',
                counterText: '100',
                filled: true,
                fillColor: Colors.amber,
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.person),
                border: InputBorder.none,
              ),
              textInputAction: TextInputAction.join,
              controller: controller,
            ),
            TextFormField(
              validator: (v) {
                return v.length > 2 ? '不能超过2个字' : null;
              },
            )
          ],
        ));
  }

  _buildTest() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 500,
        color: Colors.blue,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.end,
            crossAxisAlignment: WrapCrossAlignment.center,
            verticalDirection: VerticalDirection.down,
            spacing: 20,
            runSpacing: 5,
            children: <Widget>[
              MyWidget(),
              MyWidget(),
              MyWidget(),
              MyWidget(),
              MyWidget(),
              MyWidget(w: 50.0, h: 50.0),
              MyWidget(),
              MyWidget(),
              MyWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _buildSafeAreaTest(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Column(
        children: <Widget>[
          Listener(
            onPointerUp: (e){
              Navigator.pop(context);
            },
            child: Container(
              height: 80,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white, decoration: TextDecoration.none),
              ),
            ),
          )
          ,
          Container(
            height: 160,
            color: Colors.amber,
            margin: EdgeInsets.only(top: 50),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    child: Container(
                  height: 160,
                  color: Colors.orange,
                )),
                Expanded(
                    child: Opacity(
                  opacity: 0.2,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 160,
                    color: Colors.orange,
                  ),
                )),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class MyWidget extends StatefulWidget {
  var w;

  var h;

  MyWidget({this.w = 80.0, this.h = 80.0}) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyWidget(w, h);
  }
}

class _MyWidget extends State<MyWidget> {
  var w;

  var h;

  _MyWidget(this.w, this.h) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: h,
      width: w,
      color: Colors.amber,
    );
  }
}
