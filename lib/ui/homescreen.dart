import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shimmer/shimmer.dart';
import '../models/MainCategoryCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int activeindex = 0;

  bool isLoading = true;

  ScrollController _scrollController = ScrollController();

  //carousel images list
  final urlImages = [
    "https://images.unsplash.com/photo-1559076294-ad5d97e1e7c4?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c2hvcHN8ZW58MHx8MHx8fDI%3D",
    "https://images.unsplash.com/photo-1516594798947-e65505dbb29d?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGdyb2NlcnklMjBzdG9yZXxlbnwwfDB8MHx8fDI%3D",
    "https://images.unsplash.com/photo-1470309864661-68328b2cd0a5?auto=format&fit=crop&q=80&w=1770&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1445116572660-236099ec97a0?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2FmZXxlbnwwfDB8MHx8fDI%3D",
  ];

  // main category card images list

  List<MainCategoryCard> categoryList = [
    MainCategoryCard(
        name: "Entertainment and Fun",
        image:
            "https://images.unsplash.com/photo-1582711012153-0ef6ef75d08f?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8RW50ZXJ0YWltZW50JTIwYW5kJTIwZnVufGVufDB8MHwwfHx8Mg%3D%3D"),
    MainCategoryCard(
        name: "Talegaon Delicacies",
        image:
            "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Zm9vZCUyMHJlc3RhdXJhbnR8ZW58MHwwfDB8fHwy"),
    MainCategoryCard(
        name: "Shopping",
        image:
            "https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDN8fGNvdGhlcyUyMHNob3BwaW5nfGVufDB8MHwwfHx8Mg%3D%3D "),
    MainCategoryCard(
        name: "Local Markets",
        image:
            "https://images.unsplash.com/photo-1583258292688-d0213dc5a3a8?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1hcmtldHxlbnwwfDB8MHx8fDI%3D"),
  ];

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
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                isLoading
                    ? getShimmerLoading()
                    : CarouselSlider.builder(
                        itemCount: urlImages.length,
                        itemBuilder: (context, index, realIndex) {
                          final urlimage = urlImages[index];
                          return buildimage(urlimage, index);
                        },
                        options: CarouselOptions(
                          autoPlayAnimationDuration: Duration(seconds: 3),
                            autoPlay: true,
                            height: 140,
                            onPageChanged: (index, reason) {
                              setState(() {
                                activeindex = index;
                              });
                            }),
                      ),
                const SizedBox(
                  height: 12,
                ),
                Center(child: buildindicator()),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child:  isLoading
                      ? getShimmerTextLoading()
                      :Text(
                    'Explore City',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ListView.builder(
                          controller: _scrollController,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: categoryList.length,
                          itemBuilder: (context, index) {
                            return  isLoading ? getShimmerCategoryCard() : ListTile(
                              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                              title: Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 8,
                                        color: Colors.grey.shade500),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    '${categoryList[index].image}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }

                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //image slider
  Widget buildimage(String urlimage, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(horizontal: 0),
        child: Image.network(
          urlimage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

// scroll indicartor
  Widget buildindicator() {
    return AnimatedSmoothIndicator(
        effect: const ScrollingDotsEffect(
          activeDotColor: Colors.black87,
          dotWidth: 6,
          dotHeight: 6,
          spacing: 30,
        ),
        activeIndex: activeindex,
        count: urlImages.length);
  }

// shimmer effect
  Shimmer getShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: urlImages.length,
            itemBuilder: (context, index, realIndex) {
              final urlimage = urlImages[index];
              return buildimage(urlimage, index);
            },
            options: CarouselOptions(
              autoPlay: true,
              height: 140,
              onPageChanged: (index, reason) {
                setState(() {
                  activeindex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 12,),

        ],
      ),
    );
  }


  Shimmer getShimmerCategoryCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        title: Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(blurRadius: 8, color: Colors.grey.shade500)],
          ),
        ),
      ),
    );
  }

  Shimmer getShimmerTextLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 20,
        decoration: BoxDecoration(
          color: Colors.white, // Change the color as needed
          borderRadius: BorderRadius.circular(5), // Adjust the border radius as needed
        ),
      ),
    );
  }

}



