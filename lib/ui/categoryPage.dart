import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../models/categoryList.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  ScrollController _scrollController = ScrollController();
  bool isLoading = true;
  
  List<CategoryPList> cateList = [
    CategoryPList(name: 'Dining', image: "https://images.unsplash.com/photo-1561758033-d89a9ad46330?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTJ8fGZvb2R8ZW58MHwwfDB8fHwy"),
    CategoryPList(name: "Fun", image: "https://images.unsplash.com/photo-1550724026-f20ae6b4a592?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTM0fHxmdW58ZW58MHwwfDB8fHwy"),
    CategoryPList(name: "Shops", image: "https://images.unsplash.com/photo-1559171667-74fe3499b5ba?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fG1hbGx8ZW58MHx8MHx8fDA%3D"),
    CategoryPList(name: "Market", image: "https://images.unsplash.com/photo-1543083477-4f785aeafaa9?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzZ8fG1hcmtldHxlbnwwfDB8MHx8fDI%3D"),
  ];

  @override
  void dispose() {
   _scrollController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    loadCounter();
    super.initState();
  }

  void loadCounter() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,color: Colors.black87,)),
      //   title: Text("Category",style: Theme.of(context).textTheme.titleMedium,),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 20,),
            // SearchBar(
            //   padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal:20)),
            //   leading: Icon(Icons.search_outlined),
            //   hintText: 'Search ...',
            //   hintStyle: MaterialStatePropertyAll(TextStyle(color: Colors.grey[400],fontSize:17)),
            //   elevation: MaterialStatePropertyAll(0),
            // ),
            // SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Categories',style: Theme.of(context).textTheme.headlineSmall,),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: ListView.builder(
                  controller: _scrollController,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cateList.length,
                  itemBuilder: (context,index){
                    return isLoading ? getShimmerCategoryCard() :ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                      title: Container(
                        height: 150,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(blurRadius: 8,color: Colors.grey.shade500)
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network('${cateList[index].image}',fit: BoxFit.cover,),
                              Center(
                                child: Text(
                                  cateList[index].name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 3
                                  ),
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );



  }



  Shimmer getShimmerCategoryCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        title: Container(
          height: 150,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(blurRadius: 8,color: Colors.grey.shade500)
            ],
          ),

        ),
      ),
    );
  }


}
