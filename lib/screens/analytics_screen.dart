import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:intl/intl.dart';
import 'package:shubham_avantkar_assignment/styles.dart';
import 'package:shubham_avantkar_assignment/utilities/greeting_generator.dart';
import 'package:shubham_avantkar_assignment/utilities/time_difference.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../models/options_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<OptionModel> options = [
    OptionModel(head: 'DPR', selected: false, nav: '/dpr'),
    OptionModel(head: 'Cash OutFlow', selected: false, nav: '/cash_outflow'),
    OptionModel(head: 'Cash InFlow', selected: false, nav: '/cash_inflow'),
    OptionModel(
        head: 'Material Issues', selected: false, nav: '/material_issues'),
    OptionModel(
        head: 'M Reconciliation', selected: false, nav: '/m_reconciliation'),
    OptionModel(
        head: 'Material Reciept', selected: false, nav: '/material_receipt'),
    OptionModel(head: 'Go to Dashboard', selected: false, nav: '/dashboard'),
  ];
  DateTime date = DateTime.now();
  GlobalKey key = GlobalKey();
  int progress = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        leading: Row(
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
              style: TextStyle(
                color: AppColors.fadedTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Shubham!",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: AppColors.notiBtnColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_none_rounded,
              size: 25,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 10,
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height /
                  (MediaQuery.of(context).size.height /
                      MediaQuery.of(context).size.width) *
                  1.42,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      key: key,
                      children: options.map((option) {
                        return OptionWidget(
                            option:
                                option); // Or any other widget you want to display
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    flex: MediaQuery.of(context).size.width < 380 ? 2 : 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.appBackgroundColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  // Spread radius
                                  blurRadius: 5,
                                  // Blur radius
                                  offset: Offset(
                                      0, 3), // Offset in the x and y direction
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Daily Progress",
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "From all projects",
                                  style: TextStyle(
                                    color: AppColors.fadedTextColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Column(
                                  children: [
                                    SleekCircularSlider(
                                      appearance: CircularSliderAppearance(
                                        size: 130,
                                        customColors: CustomSliderColors(
                                          dynamicGradient: true,
                                          dotColor: AppColors.progressColor,
                                          trackColor: AppColors.optionBtnColor2
                                              .withOpacity(0.55),
                                          progressBarColors: [
                                            AppColors.optionBtnColor2,
                                            AppColors.optionBtnColor1,
                                            AppColors.progressColor
                                                .withOpacity(0.4),
                                          ],
                                        ),
                                        customWidths: CustomSliderWidths(
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
                                              padding: EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                color: AppColors.progressColor,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Text(
                                                date.day.toString(),
                                                style: TextStyle(
                                                  color: AppColors
                                                      .appBackgroundColor,
                                                ),
                                              ),
                                            ),
                                            Text(
                                                DateFormat("MMM").format(date)),
                                            SizedBox(height: 10),
                                          ],
                                        );
                                      }),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: AppColors.optionBtnColor1,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "0%",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: AppColors
                                                        .fadedTextColor2,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "90%",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .width <
                                                                400
                                                            ? 20
                                                            : 25,
                                                    color: AppColors
                                                        .appBackgroundColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "100%",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: AppColors
                                                        .fadedTextColor2,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Based on Reports",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color:
                                                    AppColors.fadedTextColor2,
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
                        SizedBox(height: 15),
                        Container(
                          height: MediaQuery.of(context).size.height / 4.2,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: AppColors.appBackgroundColor,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                // Spread radius
                                blurRadius: 5,
                                // Blur radius
                                offset: Offset(
                                    0, 3), // Offset in the x and y direction
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.fadedTextColor2,
                                      ),
                                      child: Icon(
                                        Icons.access_time_rounded,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            DateFormat("MMMM").format(date),
                                            style: TextStyle(
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              "${daysUntilEndOfMonth()} Days Remaining",
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                color: AppColors.fadedTextColor,
                                                fontSize: 17,
                                                overflow: TextOverflow.clip,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 10),
                                  itemBuilder: ((ctx, idx) {
                                    return Container(
                                      height: 9,
                                      width: 9,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: idx < progress
                                            ? null
                                            : AppColors.fadedTextColor2,
                                        gradient: idx < progress
                                            ? LinearGradient(
                                                colors: [
                                                  AppColors.progressColor,
                                                  AppColors.optionBtnColor1,
                                                ],
                                              )
                                            : null,
                                      ),
                                    );
                                  }),
                                  itemCount:
                                      DateTime(date.year, date.month + 1, 0)
                                          .day,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OptionWidget extends StatefulWidget {
  OptionWidget({
    super.key,
    required this.option,
  });

  OptionModel option;

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        log(MediaQuery.of(context).size.width.toString());
        setState(() {
          widget.option.selected = !widget.option.selected;
          if (widget.option.selected) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
        });
      }),
      child: AnimatedBuilder(
        animation: _animation,
        builder: ((ctx, child) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 18),
            // margin: EdgeInsets.only(top: 20),
            height: 50,
            decoration: BoxDecoration(
              // color: AppColors.transparent,
              border: widget.option.selected
                  ? Border.all(color: AppColors.transparent)
                  : GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.optionBtnColor1
                              .withOpacity(1 - _animation.value),
                          AppColors.optionBtnColor2
                              .withOpacity(1 - _animation.value),
                        ],
                      ),
                      width: 1.5,
                    ),
              borderRadius: BorderRadius.circular(16),
              gradient: widget.option.selected
                  ? LinearGradient(colors: [
                      AppColors.optionBtnColor1.withOpacity(_animation.value),
                      AppColors.optionBtnColor2.withOpacity(_animation.value),
                    ])
                  : null,
            ),
            child: Row(
              children: [
                Builder(
                  builder: ((ctx) {
                    if (MediaQuery.of(context).size.width < 400) {
                      return Expanded(
                        child: OptionText(head: widget.option.head),
                      );
                    } else {
                      return Text(
                        widget.option.head,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.black,
                        ),
                      );
                    }
                  }),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: widget.option.selected ? 18 : 22,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class OptionText extends StatelessWidget {
  const OptionText({
    super.key,
    required this.head,
  });

  final String head;

  @override
  Widget build(BuildContext context) {
    return Text(
      head,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: AppColors.black,
      ),
    );
  }
}
