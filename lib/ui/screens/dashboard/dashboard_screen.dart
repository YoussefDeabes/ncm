import 'package:ncm/_base/widgets/base_stateful_widget.dart';
import 'package:flutter/material.dart';
import 'package:ncm/res/assets_path.dart';
import 'package:ncm/res/const_colors.dart';
import 'package:ncm/util/lang/app_localization_keys.dart';

class DashboardScreen extends BaseStatefulWidget {
  static const String routeName = '/dashboard-screen';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _DashboardScreenState();
}

class _DashboardScreenState extends BaseState<DashboardScreen> {
  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////

  Widget _getBody() {
    return Stack(
      children: [
        _getBackgroundImage(),
        SingleChildScrollView(
          child: Container(
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                _headerRow(),
                _getTextWidget(translate(LangKeys.hi),
                    color: ConstColors.appWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
                _getTextWidget("${translate(LangKeys.welcome)} User",
                    color: ConstColors.appWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                SizedBox(height: height / 80),
                _getClimateDetailsCard(),
                SizedBox(
                  height: height / 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: width / 3.6,
                            height: height / 6,
                            child: Image.asset(
                              AssPath.stats01,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: height / 50,
                              ),
                              Text(
                                "53",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 50,
                                    color: ConstColors.appWhite),
                              ),
                              SizedBox(
                                height: height / 50,
                              ),
                              Container(
                                width: width / 5,
                                margin: EdgeInsets.symmetric(
                                    horizontal: width / 50),
                                child: Text(
                                  "Service Applied",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: ConstColors.appWhite),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: width / 3.6,
                            height: height / 6,
                            child: Image.asset(
                              AssPath.stats02,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: height / 50,
                              ),
                              Text(
                                "33",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 50,
                                    color: ConstColors.appWhite),
                              ),
                              SizedBox(
                                height: height / 50,
                              ),
                              Container(
                                width: width / 5,
                                margin: EdgeInsets.symmetric(
                                    horizontal: width / 50),
                                child: Text(
                                  "Service Approved",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: ConstColors.appWhite),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: width / 3.6,
                            height: height / 6,
                            child: Image.asset(
                              AssPath.stats03,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: height / 50,
                              ),
                              Text(
                                "20",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 50,
                                    color: ConstColors.appWhite),
                              ),
                              SizedBox(
                                height: height / 50,
                              ),
                              Container(
                                width: width / 5,
                                margin: EdgeInsets.symmetric(
                                    horizontal: width / 50),
                                child: Text(
                                  "Service Rejected",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: ConstColors.appWhite),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Services",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: ConstColors.appWhite),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 12, color: ConstColors.appWhite),
                        )),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          color: ConstColors.appWhite.withOpacity(0.2),
                          height: height / 7,
                          width: width,
                          child: Row(
                            children: [
                              SizedBox(width: width / 20),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                    height: height / 10,
                                    color: ConstColors.appWhite,
                                    child: Image.asset(
                                      AssPath.climateDataIconBig,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              SizedBox(width: width / 20),
                              Container(
                                width: width / 3,
                                child: Text(
                                  "Climate data request",
                                  style: TextStyle(
                                    color: ConstColors.appWhite,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    InkWell(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          color: ConstColors.appWhite.withOpacity(0.2),
                          height: height / 7,
                          width: width,
                          child: Row(
                            children: [
                              SizedBox(width: width / 20),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                    height: height / 10,
                                    color: ConstColors.appWhite,
                                    child: Image.asset(
                                        AssPath.requestWeatherIcon)),
                              ),
                              SizedBox(width: width / 20),
                              Container(
                                width: width / 3,
                                child: Text(
                                  "Climate data request",
                                  style: TextStyle(
                                    color: ConstColors.appWhite,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    InkWell(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          color: ConstColors.appWhite.withOpacity(0.2),
                          height: height / 7,
                          width: width,
                          child: Row(
                            children: [
                              SizedBox(width: width / 20),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                    height: height / 10,
                                    color: ConstColors.appWhite,
                                    child:
                                        Image.asset(AssPath.freeForcastIcon)),
                              ),
                              SizedBox(width: width / 20),
                              Container(
                                width: width / 3,
                                child: Text(
                                  "Climate data request",
                                  style: TextStyle(
                                    color: ConstColors.appWhite,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //Main background image
  Widget _getBackgroundImage() {
    return Image.asset(
      AssPath.mainBg,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }

  //Logo, search and notification icon row
  Widget _headerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AssPath.logoMobile,
        ),
        Row(
          children: [
            Image.asset(
              AssPath.search,
              scale: 1.2,
            ),
            const SizedBox(width: 20),
            Image.asset(
              AssPath.notificationIcon,
              scale: 1.2,
            )
          ],
        ),
      ],
    );
  }

  //Get any text with optional params
  Widget _getTextWidget(String text,
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }

  Widget _getClimateDetailsCard() {
    return Center(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(18.0),
        ),
        child: Container(
          color: ConstColors.appWhite.withOpacity(0.2),
          padding: EdgeInsets.only(top: height / 80),
          child: Center(
            child: Column(
              children: [
                _getTextWidget("Wed, August 06", color: ConstColors.appWhite),
                _getTextWidget("Riyadh, Saudi Arabia",
                    color: ConstColors.appWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
                SizedBox(height: height / 40),
                Image.asset(
                  AssPath.weatherIcon01,
                  color: ConstColors.appWhite,
                  scale: 0.3,
                ),
                const SizedBox(height: 10),
                _getTextWidget("Partly Cloud", color: ConstColors.appWhite),
                const SizedBox(height: 10),
                _getTextWidget("27°",
                    color: ConstColors.appWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 50),
                SizedBox(height: height / 50),
                _upcomingClimateDetailsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _upcomingClimateDetailsList() {
    return Container(
      alignment: AlignmentDirectional.center,
      width: width,
      height: height / 10,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Image.asset(
                AssPath.weatherIcon02,
              ),
              SizedBox(height: height / 50),
              _getTextWidget(translate(LangKeys.thu),
                  color: ConstColors.appWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 14)
            ],
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              Image.asset(
                AssPath.weatherIcon02,
              ),
              SizedBox(height: height / 50),
              _getTextWidget(translate(LangKeys.fri),
                  color: ConstColors.appWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 14)
            ],
          ),
          SizedBox(width: 20),
          Column(
            children: [
              Image.asset(
                AssPath.weatherIcon01,
                scale: 1.5,
              ),
              SizedBox(height: height / 50),
              _getTextWidget(translate(LangKeys.sat),
                  color: ConstColors.appWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 14)
            ],
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              Image.asset(
                AssPath.weatherIcon02,
              ),
              SizedBox(height: height / 45),
              _getTextWidget(translate(LangKeys.sun),
                  color: ConstColors.appWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 14)
            ],
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              Image.asset(
                AssPath.weatherIcon06,
                scale: 1.7,
              ),
              SizedBox(height: height / 50),
              _getTextWidget(translate(LangKeys.mon),
                  color: ConstColors.appWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 14)
            ],
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              Image.asset(
                AssPath.weatherIcon05,
                scale: 1.5,
              ),
              SizedBox(height: height / 55),
              _getTextWidget(translate(LangKeys.fri),
                  color: ConstColors.appWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 14)
            ],
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              Image.asset(
                AssPath.weatherIcon05,
                scale: 1.5,
              ),
              SizedBox(height: height / 55),
              _getTextWidget(translate(LangKeys.sat),
                  color: ConstColors.appWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 14)
            ],
          ),
        ],
      ),
    );
  }
///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////
}
