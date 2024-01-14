import 'package:ncm/_base/widgets/base_stateful_widget.dart';
import 'package:ncm/res/assets_path.dart';
import 'package:ncm/res/const_colors.dart';
import 'package:ncm/ui/screens/dashboard/dashboard_screen.dart';
import 'package:ncm/ui/screens/more/more_screen.dart';
import 'package:ncm/ui/screens/services/services_screen.dart';
import 'package:ncm/ui/screens/settings/settings_screen.dart';
import 'package:ncm/util/ui/screen_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends BaseStatefulWidget {
  static const String routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    Future.delayed(Duration.zero, () {
      setState(() {
        int? index = ModalRoute.of(context)?.settings.arguments as int? ??
            _tabController?.index;
        _tabController!.animateTo(index ?? 0);
      });
    });
    exitFullScreen();
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _getBottomNavigation(),
      body: _getBody(),
    );
  }

  ///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////

  /// Bottom navigation items
  Widget _getBottomNavigation() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: ConstColors.disabled, spreadRadius: 0, blurRadius: 15),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45.0),
          topRight: Radius.circular(45.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: ConstColors.bottomNavNotSelected,
          backgroundColor: ConstColors.bottomNavBackground,
          currentIndex: _tabController!.index,
          onTap: onBottomItemSelected,
          showSelectedLabels: true,
          items: [
            getCustomBottomNavigationBarItem(
              unSelectedImagePath: AssPath.dashboardActive,
              imagePath: AssPath.dashboard,
              label: "Dashboard",
            ),
            getCustomBottomNavigationBarItem(
              unSelectedImagePath: AssPath.serviceActive,
              imagePath: AssPath.serviceActive,
              label: "Services",
            ),
            getCustomBottomNavigationBarItem(
              unSelectedImagePath: AssPath.settingsInactive,
              imagePath: AssPath.settingsInactive,
              label: "Settings",
            ),
            getCustomBottomNavigationBarItem(
              unSelectedImagePath: AssPath.more,
              imagePath: AssPath.more,
              label: "More",
            ),
          ],
        ),
      ),
    );
  }

  // Getting screen based on selected bottom navigation item
  Widget _getBody() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: const [
        DashboardScreen(),
        ServicesScreen(),
        SettingsScreen(),
        MoreScreen(),
      ],
    );
  }

  ///////////////////////////////////////////////////////////
/////////////////// Helper methods ////////////////////////
///////////////////////////////////////////////////////////
  /// Change current index to index of selected item
  void onBottomItemSelected(int index) {
    setState(() {
      _tabController!.animateTo(index);
    });
  }

  BottomNavigationBarItem getCustomBottomNavigationBarItem({
    required String unSelectedImagePath,
    required String imagePath,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        unSelectedImagePath,
        height: 35,
        color: ConstColors.textGrey,
      ),
      label: label,
      activeIcon: Image.asset(
        imagePath,
        height: 35,
        color: ConstColors.app,
      ),
    );
  }
}
