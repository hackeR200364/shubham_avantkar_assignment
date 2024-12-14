import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shubham_avantkar_assignment/models/projects_model.dart';
import 'package:shubham_avantkar_assignment/providers/options_provider.dart';
import 'package:shubham_avantkar_assignment/providers/projects_provider.dart';
import 'package:shubham_avantkar_assignment/providers/theme_provider.dart';
import 'package:shubham_avantkar_assignment/styles.dart';
import 'package:shubham_avantkar_assignment/utilities/greeting_generator.dart';
import 'package:shubham_avantkar_assignment/utilities/time_difference.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../utilities/option_list.dart';
import '../widgets/option_widgets.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  List<ProjectModel> projects = [
    ProjectModel(
      name: "Project Bedrock",
      image: "assets/bedrock.webp",
      index: 0,
    ),
    ProjectModel(
      name: "Project Atlas",
      image: "assets/atlas.webp",
      index: 1,
    ),
  ];
  DateTime date = DateTime.now();
  GlobalKey key = GlobalKey();
  int progress = 16;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      Provider.of<ProjectsProvider>(context, listen: false)
          .changeIndex(pageController.page?.toInt() ?? 0);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: ((parentCtx, parentProvider, parentChild) {
      return Scaffold(
        backgroundColor: parentProvider.themeColors.appBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: parentProvider.themeColors.appBackgroundColor,
          leading: const Row(
            children: [
              SizedBox(width: 12),
              CircleAvatar(
                radius: 22,
                foregroundImage: AssetImage("assets/profile.jpg"),
              ),
            ],
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                generateGreeting(),
                style: const TextStyle(
                  color: AppColors.fadedTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Shubham!",
                style: TextStyle(
                  color: parentProvider.themeColors.optionColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            Stack(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: parentProvider.themeColors.appBackgroundColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.fadedTextColor.withOpacity(0.4),
                        offset: const Offset(0, 0),
                        blurRadius: 10,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.notifications_none_rounded,
                    color: parentProvider.themeColors.optionColor,
                    size: 25,
                  ),
                ),
                Positioned(
                  right: 5,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: AppColors.optionBtnColor1,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                ),
                height: MediaQuery.of(context).size.height /
                    (MediaQuery.of(context).size.height /
                        MediaQuery.of(context).size.width) *
                    1.42,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        key: key,
                        children: options.map((option) {
                          return OptionWidget(
                              themeColors: parentProvider.themeColors,
                              option:
                                  option); // Or any other widget you want to display
                        }).toList(),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      // flex: MediaQuery.of(context).size.width < 380 ? 2 : 1,
                      child: Consumer<OptionsProvider>(
                          builder: ((ctx, provider, child) {
                        switch (provider.selectedOption) {
                          case 0:
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: parentProvider
                                          .themeColors.appBackgroundColor,
                                      borderRadius: BorderRadius.circular(15),
                                      border: MediaQuery.of(context)
                                                  .platformBrightness ==
                                              Brightness.light
                                          ? Border.all(
                                              color: AppColors.fadedTextColor
                                                  .withOpacity(0.4),
                                              width: 1.5,
                                            )
                                          : GradientBoxBorder(
                                              gradient:
                                                  AppColors.menuActiveGradient,
                                              width: 1.5,
                                            ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Daily Progress",
                                          style: TextStyle(
                                            color: parentProvider
                                                .themeColors.textColor,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          "From all projects",
                                          style: TextStyle(
                                            color: AppColors.fadedTextColor,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Column(
                                          children: [
                                            SleekCircularSlider(
                                              appearance:
                                                  CircularSliderAppearance(
                                                size: 130,
                                                customColors:
                                                    CustomSliderColors(
                                                  dynamicGradient: true,
                                                  dotColor:
                                                      AppColors.progressColor,
                                                  trackColor:
                                                      AppColors.fadedTextColor,
                                                  progressBarColors: [
                                                    AppColors.optionBtnColor2,
                                                    AppColors.optionBtnColor1,
                                                    AppColors.progressColor
                                                        .withOpacity(0.4),
                                                  ],
                                                ),
                                                customWidths:
                                                    CustomSliderWidths(
                                                  progressBarWidth: 8,
                                                  trackWidth: 8,
                                                  handlerSize: 6,
                                                ),
                                              ),
                                              min: 0,
                                              max: 100,
                                              initialValue: 90,
                                              innerWidget: ((val) {
                                                return Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: AppColors
                                                            .progressColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Text(
                                                        date.day.toString(),
                                                        style: TextStyle(
                                                          color: parentProvider
                                                              .themeColors
                                                              .appBackgroundColor,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      DateFormat("MMM")
                                                          .format(date),
                                                      style: TextStyle(
                                                          color: parentProvider
                                                              .themeColors
                                                              .textColor),
                                                    ),
                                                    const SizedBox(height: 10),
                                                  ],
                                                );
                                              }),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                              decoration: BoxDecoration(
                                                color:
                                                    AppColors.optionBtnColor1,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Expanded(
                                                        child: Text(
                                                          "0%",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .fadedTextColor2,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "90%",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width <
                                                                    400
                                                                ? 20
                                                                : 25,
                                                            color: AppColors
                                                                .appBackgroundColor,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),
                                                      const Expanded(
                                                        child: Text(
                                                          "100%",
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .fadedTextColor2,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Based on Reports",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .fadedTextColor2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 4.2,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: parentProvider
                                        .themeColors.appBackgroundColor,
                                    borderRadius: BorderRadius.circular(15),
                                    border: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.light
                                        ? Border.all(
                                            color: AppColors.fadedTextColor
                                                .withOpacity(0.4),
                                            width: 1.5,
                                          )
                                        : GradientBoxBorder(
                                            gradient:
                                                AppColors.menuActiveGradient,
                                            width: 1.5,
                                          ),
                                  ),
                                  child: Column(
                                    children: [
                                      Flexible(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      AppColors.fadedTextColor2,
                                                ),
                                                child: const Icon(
                                                  Icons.access_time_rounded,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    DateFormat("MMMM")
                                                        .format(date),
                                                    style: TextStyle(
                                                      color: parentProvider
                                                          .themeColors
                                                          .textColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      "${daysUntilEndOfMonth()} Days Remaining",
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: const TextStyle(
                                                        color: AppColors
                                                            .fadedTextColor,
                                                        fontSize: 17,
                                                        overflow:
                                                            TextOverflow.clip,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Expanded(
                                        child: GridView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 10),
                                          itemBuilder: ((ctx, idx) {
                                            return Container(
                                              height: 9,
                                              width: 9,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: idx < progress
                                                    ? null
                                                    : AppColors.fadedTextColor2,
                                                gradient: idx < progress
                                                    ? const LinearGradient(
                                                        colors: [
                                                          AppColors
                                                              .optionBtnColor1,
                                                          AppColors
                                                              .optionBtnColor2,
                                                        ],
                                                      )
                                                    : null,
                                              ),
                                            );
                                          }),
                                          itemCount: DateTime(
                                                  date.year, date.month + 1, 0)
                                              .day,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          default:
                            return Center(
                              child: Text(
                                options[provider.selectedOption].head,
                                style: TextStyle(
                                    color:
                                        parentProvider.themeColors.textColor),
                              ),
                            );
                        }
                      })),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      child: LayoutBuilder(builder: (context, constraint) {
                        final maxWidth = constraint.maxWidth;
                        return PageView.builder(
                            allowImplicitScrolling: true,
                            controller: pageController,
                            itemCount: projects.length,
                            itemBuilder: (_, index) {
                              final project = projects[index];
                              final child = Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            project.image,
                                          ), // Use project image
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 15),
                                    child: Text(
                                      project.name,
                                      // Display project title
                                      style: TextStyle(
                                        color: parentProvider
                                            .themeColors.textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              );

                              return AnimatedBuilder(
                                  animation: pageController,
                                  builder: (_, __) {
                                    final ratioX =
                                        pageController.offset / maxWidth / 0.7 -
                                            index;

                                    final scale = 1 - ratioX.abs() * 0.23;
                                    final verticalOffset = 130 *
                                        (1 - scale); // Adjust vertical offset

                                    return Transform.translate(
                                      offset: Offset(0, verticalOffset),
                                      child: Transform.scale(
                                        scale: 0.93,
                                        child: child,
                                      ),
                                    );
                                  });
                            });
                      }),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Consumer<ProjectsProvider>(
                        builder: ((ctx, provider, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: projects.map((e) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  gradient: provider.currentIndex == e.index
                                      ? AppColors.menuActiveGradient
                                      : AppColors.projectInActiveGradient,
                                  shape: BoxShape.circle,
                                ),
                              );
                            }).toList(),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      );
    }));
  }
}
