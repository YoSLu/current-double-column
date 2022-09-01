///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'week2_interactive_oo_abgame.dart';
import 'dart:core';
import 'package:myapp_online/main.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AB game demo",
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'ab game : 古早小遊戲'),
    );
  }
}  //會改變的如顏色、加法器

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();  //stateful透過createstate產生東西
}//不改變的如固定文字

class _MyHomePageState extends State<MyHomePage>  {
  var gamebox = ABGame3();
  late String s = gamebox.get_answer();
  TextEditingController controller = TextEditingController();

  late List<String> the_guess = <String>[];
  String mediator = '';

  late String display = gamebox.result;
  String ans = '????????';
  late int counter = gamebox.maxtime;

  @override
  void activate() {
    // TODO: implement activate
    super.activate();
  }

  void tester(){
    if (controller.text != null){
      if (counter > 0){
        setState(() {
          display = gamebox.getResult(controller.text, s);
          mediator = controller.text + ' : ' + '$display' + '\n';
          the_guess.add(mediator);
          counter--;
        });
      }
      else {
        setState(() {
          display = 'you fail!';
        });
      }
    }
    controller.text = '';
  }

  void answer(){
    setState(() {
      ans = s;
    });
  }

  void replay (){
    setState(() {
      s = gamebox.get_answer();
      display = '已重開新局';
      counter = gamebox.maxtime;
      ans = '????????';
      the_guess = <String>[];
    });
  }

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    return super == other;
  }

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffc1f8df),
appBar:
AppBar(
elevation:4,
centerTitle:true,
automaticallyImplyLeading: false,
backgroundColor:Color(0xfff6fb8b),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
title:Text(
"AB game:數學小遊戲",
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:20,
color:Color(0xff000000),
),
),
leading: Icon(
Icons.arrow_back,
color:Color(0xff212435),
size:24,
),
),
body:Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Expanded(
flex: 1,
child: SingleChildScrollView(
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Text(
"玩家猜電腦隨機生成的三位數\nＡ＝數字與位置正確\nＢ＝數字正確、位置錯誤",
textAlign: TextAlign.justify,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),

SizedBox(
height:MediaQuery.of(context).size.height * 0.05,
width:16,
),
TextField(
controller:controller,
obscureText:false,
textAlign:TextAlign.center,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:0
),
),
focusedBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:0
),
),
enabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:0
),
),
hintText:"我想猜...",
hintStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
filled:true,
fillColor:Color(0xfff1f1fd),
isDense:true,
contentPadding:EdgeInsets.fromLTRB(12, 8, 12, 8),
prefixIcon:Icon(Icons.login,color:Color(0xff212435),size:24),
),
),

SizedBox(
height:16,
width:16,
),
MaterialButton(
onPressed:tester,
color:Color(0xffffffff),
elevation:30,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
side:BorderSide(color:Color(0xff808080),width:1),
),
padding:EdgeInsets.symmetric(horizontal: 16, vertical: 8),
child:Text("猜猜看", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xff000000),
height:40,
minWidth:140,
),
MaterialButton(
onPressed:answer,
color:Color(0xffffffff),
elevation:30,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
side:BorderSide(color:Color(0xff808080),width:1),
),
padding:EdgeInsets.symmetric(horizontal: 16, vertical: 8),
child:Text("看答案", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xff000000),
height:40,
minWidth:140,
),
MaterialButton(
onPressed:replay,
color:Color(0xffffffff),
elevation:30,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
side:BorderSide(color:Color(0xff808080),width:1),
),
padding:EdgeInsets.symmetric(horizontal: 16, vertical: 8),
child:Text("開新局", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xff000000),
height:40,
minWidth:140,
),

SizedBox(
height:MediaQuery.of(context).size.height * 0.05,
width:16,
),
],),),),

Expanded(
flex: 1,
child:
Align(
alignment:Alignment.center,
child:
ListView(
scrollDirection: Axis.vertical,
padding:EdgeInsets.zero,
shrinkWrap:true,
physics:ScrollPhysics(),
children:[

Align(
alignment:Alignment.center,
child:Text(
"$display",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:20,
color:Color(0xff000000),
),
),
),
Align(
alignment:Alignment.center,
child:Text(
"答案是 $ans",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:20,
color:Color(0xff000000),
),
),
),

SizedBox(
height:16,
width:MediaQuery.of(context).size.width * 0.02,
),
Align(
alignment:Alignment.center,
child:Text(
"你剩下$counter次機會",
textAlign: TextAlign.left,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:18,
color:Color(0xff000000),
),
),
),

SizedBox(
height:MediaQuery.of(context).size.height * 0.05,
width:16,
),
Align(
alignment:Alignment.center,
child:Text(
'$the_guess',
textAlign: TextAlign.center,
overflow:TextOverflow.visible,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:20,
color:Color(0xff000000),
),
),
),
],),),),
],),
)
;}
}
