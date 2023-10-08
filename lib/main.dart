import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled131/secondfile.dart';
import 'cubit/bloc_observer.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'generated/l10n.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const MyHomePage(title: 'Flutter Demo Home Page ' ),
    );}}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();}

class _MyHomePageState extends State<MyHomePage> {
  var x = TextEditingController();

  var user =TextEditingController();
  var  password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text( 'S.of(context).hellowworld'  ),), //widget.title +
      body:
      Center(  child: ListView(
        children: [
          SizedBox(height: 100,),
          FlutterLogo(size: 80,),
          // Text('0'),
          // OverflowBar(children: [ElevatedButton(onPressed: (){}, child: Icon(Icons.add)),
          //   ElevatedButton(onPressed: (){}, child: Icon(Icons.remove),)],),
     Counter(),
          SizedBox(height: 80,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller:user ,
              decoration: const InputDecoration(
                filled: true,
                labelText: '  Username',
              ),
            ),
          ),
// spacer
          const SizedBox(height: 12.0),
// [Password]
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller:password ,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
          ),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: [
              // TODO: Add buttons (101)
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  user.clear();
                  password.clear();
                  // TODO: Clear the text fields (101)
                },),
              // TODO: Add an elevation to NEXT (103)
              // TODO: Add a beveled rectangular border to NEXT (103)
              ElevatedButton(
                child: Mytext(label: "Next",),
                onPressed: () {
                  Navigator.push(  context  ,
                      MaterialPageRoute(builder: (context) =>
                          Mysecondscreen(data: "Welcome ${user.text}"
                            ,passdata: password.text,
                          ) ,
                      )  );
                  // TODO: Show the next page (101)
                },),],
          ),
        ], ) ,)
      ,);}}
class Mytext extends StatelessWidget {
  var label;
  Mytext({this.label,  super.key});
  @override
  Widget build(BuildContext context) {
    return Text("$label");
  }}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
      create: (BuildContext context) => CounterCubit(),
        child:  BlocConsumer <CounterCubit , CounterState> (
    listener: (context , state) {},
    builder: (context , state) {

            return  OverflowBar(children: [Text('${CounterCubit.get(context).counter}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            OverflowBar(children: [
              ElevatedButton(onPressed: (){
                CounterCubit.get(context).pluse();
              }, child: Icon(Icons.add)),
            ElevatedButton(onPressed: (){CounterCubit.get(context).minus();}, child: Icon(Icons.remove)),],),
    ],);}
            ));
    }
  }
