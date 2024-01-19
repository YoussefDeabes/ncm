import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncm/_base/widgets/base_stateful_widget.dart';
import 'package:flutter/material.dart';
import 'package:ncm/res/assets_path.dart';
import 'package:ncm/res/const_colors.dart';
import 'package:ncm/ui/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:ncm/util/lang/app_localization_keys.dart';
import 'package:ncm/util/ui/feedback_controller.dart';

class DashboardScreen extends BaseStatefulWidget {
  static const String routeName = '/dashboard-screen';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _DashboardScreenState();
}

class _DashboardScreenState extends BaseState<DashboardScreen> {
  late final DashboardBloc _dashboardBlock;

  @override
  void initState() {
    _dashboardBlock = context.read<DashboardBloc>();
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////

  //Main body widget
  Widget _getBody() {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is LoadingState) {
          showMessageLoading(translate(LangKeys.plzWait));
        } else {
          hideMessageLoading();
        }
        if (state is SearchState) {
          showToast("Search clicked");
        }
        if (state is NotificationState) {
          showToast("Notification clicked");
        }
        if (state is ClimateDataRequestState) {
          showToast("Climate Data Request clicked");
        }
        if (state is RequestAWeatherReportState) {
          showToast("Request a weather report clicked");
        }
        if (state is FreeForecastReportState) {
          showToast("Free forecast report request clicked");
        }
        if (state is ViewAllState) {
          showToast("View all clicked");
        }
      },
      builder: (context, state) {
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
                    SizedBox(height: height / 40),
                    _servicesCountCards(),
                    SizedBox(height: height / 40),
                    _servicesTitleRow(),
                    _servicesList(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
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
            InkWell(
              onTap: () {
                _dashboardBlock.add(SearchClickedEvt());
              },
              child: Image.asset(
                AssPath.search,
                scale: 1.2,
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                _dashboardBlock.add(NotificationClickedEvt());
              },
              child: Image.asset(
                AssPath.notificationIcon,
                scale: 1.2,
              ),
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

  //Current forecast details card
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
                SizedBox(height: height / 50),
                const Icon(Icons.wb_cloudy_outlined,
                    size: 130, color: ConstColors.appWhite),
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

  //upcoming week forecast horizontal list
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

  //Services counts cards
  Widget _servicesCountCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _servicesCountCardItem(
            "53", translate(LangKeys.serviceApplied), AssPath.stats01),
        _servicesCountCardItem(
            "33", translate(LangKeys.serviceApproved), AssPath.stats02),
        _servicesCountCardItem(
            "20", translate(LangKeys.serviceRejected), AssPath.stats03),
      ],
    );
  }

  //Services count card image
  Widget _servicesCountCardImage(String image) {
    return SizedBox(
      width: width / 3.6,
      height: height / 6,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }

  //Services count card item
  Widget _servicesCountCardItem(String count, String service, String image) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: Stack(
        children: [
          _servicesCountCardImage(image),
          Column(
            children: [
              SizedBox(
                height: height / 50,
              ),
              _getTextWidget(count,
                  fontWeight: FontWeight.w500,
                  fontSize: 50,
                  color: ConstColors.appWhite),
              SizedBox(
                height: height / 50,
              ),
              Container(
                width: width / 5,
                margin: EdgeInsets.symmetric(horizontal: width / 50),
                child: _getTextWidget(service,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: ConstColors.appWhite),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //Services row
  Widget _servicesTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getTextWidget(translate(LangKeys.services),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ConstColors.appWhite),
        TextButton(
            onPressed: () {
              _dashboardBlock.add(ViewAllClickedEvt());
            },
            child: _getTextWidget(translate(LangKeys.viewAll),
                fontSize: 12, color: ConstColors.appWhite)),
      ],
    );
  }

  //Services List
  Widget _servicesList() {
    return Column(
      children: [
        _serviceItem(
            translate(LangKeys.climateDataRequest),
            AssPath.climateDataIconBig,
            () => _dashboardBlock.add(ClimateDataRequestClickedEvt())),
        _serviceItem(
            translate(LangKeys.requestAWeatherReport),
            AssPath.requestWeatherIcon,
            () => _dashboardBlock.add(RequestAWeatherReportClickedEvt())),
        _serviceItem(
            translate(LangKeys.freeForecastReportRequest),
            AssPath.freeForcastIcon,
            () => _dashboardBlock.add(FreeForecastReportClickedEvt()))
      ],
    );
  }

  //Service item
  Widget _serviceItem(String title, String image, Function() onPressed) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
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
                          image,
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(width: width / 20),
                  SizedBox(
                    width: width / 3,
                    child: _getTextWidget(
                      title,
                      color: ConstColors.appWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: height / 40,
        ),
      ],
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////
}
