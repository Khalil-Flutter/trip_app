import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../../details_page/details_page.dart';
import '../../model/category_model.dart';
import '../../model/people_also_like_model.dart';
import '../../model/tab_bar_model.dart';
import '../../navigation_pages/main_wrapper.dart';
import '../../widget/painter.dart';
import '../../widget/reusable_middle_app_text.dart';
import 'components/tab_view_child.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController;
  final EdgeInsetsGeometry padding =
      const EdgeInsets.symmetric(horizontal: 10.0);

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: _buildAppBar(Size.fromHeight(height)),
        body: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: padding,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    delay: const Duration(milliseconds: 300),
                    child: const AppText(
                      text: "Top Tours",
                      size: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    child: const AppText(
                      text: "For Your Request",
                      size: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: height * 0.01, top: height * 0.02),
                      child: TextField(
                        style: GoogleFonts.ubuntu(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 240, 240, 240),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.filter_alt_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          hintStyle: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          hintText: "Discover City",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 600),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      width: width,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          labelPadding: EdgeInsets.only(
                            left: width * 0.05,
                            right: width * 0.05,
                          ),
                          controller: tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: const CircleTabBarIndicator(
                            color: Colors.green,
                            radius: 4,
                          ),
                          tabs: const [
                            Tab(
                              text: "Places",
                            ),
                            Tab(
                              text: "Inspiration",
                            ),
                            Tab(
                              text: "Popular",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 700),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: height * 0.01,
                      ),
                      width: width,
                      height: height * 0.4,
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: tabController,
                        children: [
                          TabViewChild(
                            list: places,
                          ),
                          TabViewChild(
                            list: inspiration,
                          ),
                          TabViewChild(
                            list: popular,
                          ),
                        ],
                      ),
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(
                      milliseconds: 800,
                    ),
                    child: const MiddleAppText(
                      text: "Find More",
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 900),
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.01),
                      width: width,
                      height: height * 0.13,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryComponents.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          Category current = categoryComponents[index];
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                width: width * 0.16,
                                height: height * 0.07,
                                decoration: BoxDecoration(
                                  color:
                                      Colors.deepPurpleAccent.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image(
                                    image: AssetImage(
                                      current.image,
                                    ),
                                  ),
                                ),
                              ),
                              AppText(
                                text: current.name,
                                size: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1000),
                    child: const MiddleAppText(text: "People Also Like"),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1100),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: height * 0.01,
                      ),
                      width: width,
                      height: height * 0.68,
                      child: ListView.builder(
                        itemCount: peopleAlsoLikeModel.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          PeopleAlsoLikeModel current =
                              peopleAlsoLikeModel[index];
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  personData: current,
                                  tabData: null,
                                  isCameFromPersonSection: true,
                                ),
                              ),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(8.0),
                              width: width,
                              height: height * 0.15,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag: current.day,
                                    child: Container(
                                      margin: const EdgeInsets.all(8.0),
                                      width: width * 0.28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            current.image,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: width * 0.02,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * 0.035,
                                        ),
                                        AppText(
                                          text: current.title,
                                          size: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        SizedBox(
                                          height: height * 0.005,
                                        ),
                                        AppText(
                                          text: current.location,
                                          size: 14,
                                          color: Colors.black.withOpacity(0.5),
                                          fontWeight: FontWeight.w300,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: height * 0.015,
                                          ),
                                          child: AppText(
                                            text: "${current.day} Day",
                                            size: 14,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize _buildAppBar(Size size) {
    return PreferredSize(
      preferredSize: Size.fromHeight(
        (size.height * 0.09),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 5,
              ),
              child: GestureDetector(
                onTap: (() => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainWrapper(),
                      ),
                    )),
                child: const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://instagram.fkhi2-3.fna.fbcdn.net/v/t51.2885-19/349551797_585882216945796_7697025146854591604_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fkhi2-3.fna.fbcdn.net&_nc_cat=104&_nc_ohc=Ge5SLnoVSBQAX8ZSZzv&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfCFdpr7Xy421tlTGwL-Rg79kzvaMCbetFcoYaqg8Fp__g&oe=64F57D5E&_nc_sid=8b3546"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
