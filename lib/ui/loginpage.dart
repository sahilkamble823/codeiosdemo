import 'package:explorer/ui/signupPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //icon logo
                Image(
                  height:150,
                  width: 200,
                  image: AssetImage('assets/images/signupbg.png'),
                ),
                SizedBox(height: 40,),
                Text('Welcome !',style: Theme.of(context).textTheme.headlineSmall,),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      hintText: 'Email',
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      hintText: 'Password',
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('Login',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white,letterSpacing: 2),),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('New user?'),
                      GestureDetector(
                        onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                        },
                        child: Text('Register here',style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
