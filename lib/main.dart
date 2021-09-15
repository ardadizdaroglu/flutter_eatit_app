import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eatit_app/model/restaurant_model.dart';
import 'package:flutter_eatit_app/strings/main_strings.dart';
import 'package:flutter_eatit_app/view_model/main_view_model_imp.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  runApp(MyApp(app:app));
}

class MyApp extends StatelessWidget {
  final FirebaseApp app;

  MyApp({required this.app});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(app:app),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final FirebaseApp app;
  final viewModel = MainViewModelImp();
  MyHomePage({required this.app});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(restaurantText,
        style: GoogleFonts.jetBrainsMono(
            fontWeight: FontWeight.w900, color: Colors.black),),
      backgroundColor: Colors.white,
      elevation: 10,),
      body: FutureBuilder(
        future: viewModel.displayRestaurantList(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator(),);
          else
            {
              var lst = snapshot.data as List<RestaurantModel>;
              return ListView.builder(
                  itemCount: lst.length,
                  itemBuilder: (context, index){
                    return Text(lst[index].name);
                  });
            }
        },
      ),
    );
  }
}
