import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_library_ciheul/shared/widget/button/button_reusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import '../controller/intro_controller.dart';
import '../state/intro_state.dart';
import 'package:get_it/get_it.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  IntroController controller = IntroController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<IntroController>()) {
      GetIt.I.unregister<IntroController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<IntroController, IntroState>(
        listener: (context, state) {},
        child: BlocBuilder<IntroController, IntroState>(
          builder: (context, state) {
            final bloc = context.read<IntroController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    IntroController controller,
    IntroState state,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Builder(builder: (context) {
                  List<Map<String, dynamic>> intructionItems = [
                    {
                      "photo": "assets/pic1.png",
                      "title": "Membaca dimana saja",
                      "description":
                          "Dengan E-Library Ciheul bisa baca dimana saja",
                    },
                    {
                      "photo": "assets/pic2.png",
                      "title": "Baca Sekarang",
                      "description": "Ayo Baca Buku di E-Library Ciheul",
                    },
                  ];

                  return Column(
                    children: [
                      Expanded(
                        child: CarouselSlider(
                          carouselController: controller.carouselController,
                          options: CarouselOptions(
                            height: 400,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              controller.currentIndex = index;
                              controller.updateState();
                            },
                          ),
                          items: intructionItems.map((item) {
                            return Builder(
                              builder: (BuildContext context) {
                                double screenWidth =
                                    MediaQuery.of(context).size.width;
                                double finalFontSizeTitle = (screenWidth * 0.08)
                                    .clamp(double.minPositive, 30.0);
                                double finalFontSizeDescription =
                                    (screenWidth * 0.04)
                                        .clamp(double.minPositive, 15.0);
                                return Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 300,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(6.0),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              item["photo"],
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(item["title"],
                                        style: TextStyle(
                                          fontSize: finalFontSizeTitle,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(item["description"],
                                        style: TextStyle(
                                          fontSize: finalFontSizeDescription,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ],
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: intructionItems.asMap().entries.map((entry) {
                          return GestureDetector(
                            // onTap: () => controller.carouselController
                            //     .animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? primaryColor
                                          : primaryColor.withOpacity(
                                              0.6,
                                            ))
                                      .withOpacity(
                                          // controller.currentIndex == entry.key
                                          // ? 0.9
                                          0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ButtonReusable(),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              child: Text(
                                "text",
                                style: TextStyle(
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
