import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:trip_app/main_pages/home_page/home_page.dart';

import '../../model/welcome_model.dart';
import '../../widget/reusable_middle_app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      body: SizedBox(
        width: width,
        height: height,
        child: PageView.builder(
          controller: pageController,
          scrollDirection: Axis.vertical,
          itemCount: welcomeComponents.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            WelcomeModel current = welcomeComponents[index];
            return SizedBox(
              width: width,
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: width,
                    height: height * 0.4,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.1,
                        top: height * 0.04,
                        right: width * 0.01,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeInRight(
                                child: AppText(
                                  text: current.title,
                                  size: 40,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              FadeInLeft(
                                child: AppText(
                                  text: current.subTitle,
                                  size: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              FadeInUp(
                                delay: const Duration(
                                  milliseconds: 400,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: height * 0.01,
                                  ),
                                  child: SizedBox(
                                    width: width * 0.8,
                                    child: AppText(
                                      text: current.description,
                                      size: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ),
                              ),
                              FadeInUpBig(
                                duration: const Duration(milliseconds: 1100),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: height * 0.08,
                                  ),
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    minWidth: width * 0.3,
                                    height: height * 0.055,
                                    color: Colors.green,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage(),
                                        ),
                                      );
                                    },
                                    child: const AppText(
                                      text: "Let's Go",
                                      size: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: List.generate(
                              3,
                              (indexDots) => GestureDetector(
                                onTap: () {
                                  pageController.animateToPage(
                                    indexDots,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.linear,
                                  );
                                },
                                child: AnimatedContainer(
                                  margin: EdgeInsets.only(
                                    right: width * 0.01,
                                    bottom: height * 0.008,
                                  ),
                                  width: 10,
                                  height: index == indexDots ? 55 : 10,
                                  duration: const Duration(milliseconds: 200),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: index == indexDots
                                        ? Colors.green
                                        : Colors.green.shade300,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  /// Bottom Images
                  FadeInUpBig(
                    duration: const Duration(milliseconds: 1200),
                    child: ShapeOfView(
                      width: width,
                      elevation: 4,
                      height: height * 0.55,
                      shape: DiagonalShape(
                        position: DiagonalPosition.Top,
                        direction: DiagonalDirection.Right,
                        angle: DiagonalAngle.deg(angle: 11),
                      ),
                      child: Image(
                        image: AssetImage(
                          current.imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
