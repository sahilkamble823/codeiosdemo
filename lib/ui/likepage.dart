import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/categoryList.dart';
import '../models/favlist.dart';
class LikedPage extends StatefulWidget {
  const LikedPage({super.key});

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  int activeindex = 0;
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Favourites',style: Theme.of(context).textTheme.headlineSmall,),
            ),
            SizedBox(height: 20,),
            SizedBox(height: 10,),
           

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
