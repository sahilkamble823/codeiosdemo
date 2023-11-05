
import 'package:explorer/ui/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 227, 227),
      body: Center(
        child: SpinKitCircle(
          itemBuilder: (context,index){
          return HomeScreen();
          },
          color: Colors.purple,),
      ),
    );
  }
}
