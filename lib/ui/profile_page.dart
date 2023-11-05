import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,color: Colors.black87,)),
        title: Text("My Profile",style: Theme.of(context).textTheme.titleMedium,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                ),
                child:Stack(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.person,size: 40,),
                      ),
                    ),
                    Positioned(
                        right: 10,
                        left: 50,
                        top: 100,
                      child: Icon(Icons.add_a_photo_outlined),
                    ),
                    
                  ],
                )
              ),

              Text('Name'),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              Text('Email'),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              Text('Mobile'),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              Text('City'),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 40,),
              Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 50,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.purple),
                          foregroundColor: MaterialStatePropertyAll(Colors.white),
                        ),
                      onPressed: (){},
                      child: Text('Back')),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
