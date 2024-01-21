import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncm/_base/widgets/base_stateful_widget.dart';
import 'package:flutter/material.dart';
import 'package:ncm/res/assets_path.dart';
import 'package:ncm/res/const_colors.dart';
import 'package:ncm/res/const_values.dart';
import 'package:ncm/ui/screens/services/bloc/services_bloc.dart';
import 'package:ncm/ui/widgets/widgets.dart';
import 'package:ncm/util/lang/app_localization_keys.dart';
import 'package:ncm/util/ui/feedback_controller.dart';

class ServicesScreen extends BaseStatefulWidget {
  static const String routeName = '/services-screen';

  const ServicesScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _ServicesScreenState();
}

class _ServicesScreenState extends BaseState<ServicesScreen> {
  late final ServicesBloc _servicesBloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // final ExpansionTileController _expansionTileController =
  //     ExpansionTileController();
  bool weatherStationUnderConstructionChecked = false;
  bool listOfWeatherStationChecked = false;
  bool ownershipChecked = false;
  bool rentChecked = false;
  bool expanded = false;

  @override
  void initState() {
    _servicesBloc = context.read<ServicesBloc>();
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

  Widget _getBody() {
    return BlocConsumer<ServicesBloc, ServicesState>(
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
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Stack(
            children: [
              getBackgroundImage(width: width, height: height),
              Container(
                height: height,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
                    _headerRow(),
                    getTextWidget(translate(LangKeys.apply),
                        fontWeight: FontWeight.w700, fontSize: 20),
                    SizedBox(height: height / 60),
                    getTextWidget(translate(LangKeys.climateDataRequest),
                        fontWeight: FontWeight.w500, fontSize: 14),
                    SizedBox(height: height / 50),
                    _getFormCard(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
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
                _servicesBloc.add(SearchClickedEvt());
              },
              child: Image.asset(
                AssPath.search,
                scale: 1.2,
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                _servicesBloc.add(NotificationClickedEvt());
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

  Widget _getFormCard() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(18.0),
          ),
          child: Form(
            key: _formKey,
            child: Container(
              color: ConstColors.appWhite.withOpacity(0.2),
              padding: EdgeInsets.symmetric(vertical: height / 50),
              child: Column(
                children: [
                  ExpansionTile(
                    // controller: _expansionTileController,
                    title: getTextWidget(translate(LangKeys.stationDetails),
                        fontWeight: FontWeight.w500),
                    onExpansionChanged: (val) {
                      setState(() {
                        expanded = !expanded;
                      });
                    },
                    trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(height),
                      child: Container(
                          color: ConstColors.appWhite,
                          padding: const EdgeInsets.only(bottom: 10),
                          alignment: AlignmentDirectional.center,
                          width: 40,
                          height: 40,
                          child: getTextWidget(expanded ? "-" : "+",
                              fontSize: 30, color: ConstColors.app)),
                    ),
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              activeColor: ConstColors.app.withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: ConstColors.app.withOpacity(0.2)),
                                  borderRadius: BorderRadius.circular(4)),
                              value: weatherStationUnderConstructionChecked,
                              onChanged: (val) {
                                setState(() {
                                  weatherStationUnderConstructionChecked =
                                      !weatherStationUnderConstructionChecked;
                                });
                              }),
                          getTextWidget(
                              translate(
                                  LangKeys.weatherStationUnderConstruction),
                              fontSize: 14)
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              activeColor: ConstColors.app.withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: ConstColors.app.withOpacity(0.2)),
                                  borderRadius: BorderRadius.circular(4)),
                              value: listOfWeatherStationChecked,
                              onChanged: (val) {
                                setState(() {
                                  listOfWeatherStationChecked =
                                      !listOfWeatherStationChecked;
                                });
                              }),
                          getTextWidget(
                              translate(LangKeys.listOfWeatherStations),
                              fontSize: 14)
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              label: getTextWidget(
                                  translate(LangKeys.stationClassification),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                          onSaved: (value) {},
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              label: getTextWidget(
                                  translate(LangKeys.stationClass),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                          onSaved: (value) {},
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              label: getTextWidget(
                                  translate(LangKeys.proposedStationLocation),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                          onSaved: (value) {},
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.location_on_outlined,
                                color: ConstColors.appWhite,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              label: getTextWidget(
                                  translate(LangKeys.stationCoordinates),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                          onSaved: (value) {},
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.centerStart,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: getTextWidget(translate(LangKeys.titleDeedType),
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  activeColor: ConstColors.app.withOpacity(0.2),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color:
                                              ConstColors.app.withOpacity(0.2)),
                                      borderRadius: BorderRadius.circular(4)),
                                  value: ownershipChecked,
                                  onChanged: (val) {
                                    setState(() {
                                      ownershipChecked = !ownershipChecked;
                                    });
                                  }),
                              getTextWidget(translate(LangKeys.ownership),
                                  fontSize: 14)
                            ],
                          ),
                          SizedBox(width: width / 10),
                          Row(
                            children: [
                              Checkbox(
                                  activeColor: ConstColors.app.withOpacity(0.2),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color:
                                              ConstColors.app.withOpacity(0.2)),
                                      borderRadius: BorderRadius.circular(4)),
                                  value: rentChecked,
                                  onChanged: (val) {
                                    setState(() {
                                      rentChecked = !rentChecked;
                                    });
                                  }),
                              getTextWidget(translate(LangKeys.rent),
                                  fontSize: 14)
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: ConstColors.appWhite,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              label: getTextWidget(
                                  translate(LangKeys.stationType),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                          onSaved: (value) {},
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: TextFormField(
                          maxLines: 5,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              label: getTextWidget(
                                  translate(LangKeys.stationAddress),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                          onSaved: (value) {},
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.centerStart,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: getTextWidget(translate(LangKeys.delegation),
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              label: getTextWidget(
                                  translate(LangKeys.delegateName),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                          onSaved: (value) {},
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              label: getTextWidget(translate(LangKeys.idNumber),
                                  fontWeight: FontWeight.w500, fontSize: 14)),
                          onSaved: (value) {},
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              label: getTextWidget(
                                  translate(LangKeys.authReferenceNumber),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                          onSaved: (value) {},
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.attach_file_outlined,
                                color: ConstColors.appWhite,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              label: getTextWidget(
                                  translate(LangKeys.signatureDigital),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                          onSaved: (value) {},
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.attach_file_outlined,
                                color: ConstColors.appWhite,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: ConstColors.app),
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              label: getTextWidget(
                                  translate(LangKeys.uploadDocument),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                          onSaved: (value) {},
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: getTextWidget(translate(LangKeys.applicantDetails)),
                    trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(height),
                      child: Container(
                          color: ConstColors.appWhite,
                          padding: const EdgeInsets.only(bottom: 10),
                          alignment: AlignmentDirectional.center,
                          width: 40,
                          height: 40,
                          child: getTextWidget("+",
                              fontSize: 30, color: ConstColors.app)),
                    ),
                  ),
                  ExpansionTile(
                    title: getTextWidget(translate(LangKeys.nationalAddress)),
                    trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(height),
                      child: Container(
                          color: ConstColors.appWhite,
                          padding: const EdgeInsets.only(bottom: 10),
                          alignment: AlignmentDirectional.center,
                          width: 40,
                          height: 40,
                          child: getTextWidget("+",
                              fontSize: 30, color: ConstColors.app)),
                    ),
                  ),
                  ExpansionTile(
                    title: getTextWidget(translate(LangKeys.contactDetails)),
                    trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(height),
                      child: Container(
                          color: ConstColors.appWhite,
                          padding: const EdgeInsets.only(bottom: 10),
                          alignment: AlignmentDirectional.center,
                          width: 40,
                          height: 40,
                          child: getTextWidget("+",
                              fontSize: 30, color: ConstColors.app)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: height / 50),
        TextButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isDismissible: true,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  )),
                  builder: (context) {
                    return SizedBox(
                      height: height * 0.70,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              translate(LangKeys.termsAndConditions),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: ConstColors.app),
                            ),
                            const SizedBox(height: 20),
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                ConstValues.terms,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 14, color: ConstColors.app),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: getTextWidget(translate(LangKeys.termsAndConditions),
                fontSize: 14, fontWeight: FontWeight.w500)),
        SizedBox(height: height / 80),
        SizedBox(
            width: width,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(ConstColors.secondary)),
              child: getTextWidget(translate(LangKeys.submit),
                  fontWeight: FontWeight.w700, fontSize: 16),
            )),
        SizedBox(height: height / 50),
      ],
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////
}
