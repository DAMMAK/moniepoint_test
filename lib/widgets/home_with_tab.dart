import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teamapt/shared/utils/color.dart';
import 'package:teamapt/text_view.dart';
import 'package:teamapt/widgets/home.dart';

class HomeWithTab extends StatefulWidget {
  const HomeWithTab({Key? key}) : super(key: key);

  @override
  State<HomeWithTab> createState() => _HomeWithTabState();
}

class _HomeWithTabState extends State<HomeWithTab> {
  late int _selectedIndex;

  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = 0;
  }

  static final List<NavItemData> _pages = [
    NavItemData(
      title: "Home",
      page: const Home(),
      selectedIcon: "home.svg",
      unselectedIcon: "home.svg",
    ),
    NavItemData(
      title: "Voucher",
      page: Container(),
      selectedIcon: "ticket.svg",
      unselectedIcon: "ticket.svg",
    ),
    NavItemData(
      title: "Wallet",
      page: Container(),
      selectedIcon: "emptywallet.svg",
      unselectedIcon: "emptywallet.svg",
    ),
    NavItemData(
      title: "Setting",
      page: Container(),
      selectedIcon: "setting.svg",
      unselectedIcon: "setting.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages.map((e) => e.page).toList(),
      ),
      bottomNavigationBar: Container(
        height: 90.h,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _pages.length,
            (index) => NavItem(
                title: _pages[index].title,
                index: index,
                selectedIcon: _pages[index].selectedIcon,
                unSelectedIcon: _pages[index].unselectedIcon,
                selectedIndex: _selectedIndex,
                onTap: () {}),
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    Key? key,
    required this.index,
    required this.selectedIndex,
    this.onTap,
    this.title = '',
    this.selectedIcon,
    this.unSelectedIcon,
  }) : super(key: key);

  final int index;
  final int selectedIndex;
  final VoidCallback? onTap;
  final String title;

  final String? selectedIcon;
  final String? unSelectedIcon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.grey,
        customBorder: const CircleBorder(),
        child: Container(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/$selectedIcon",
                height: 30.h,
                width: 30.h,
                fit: BoxFit.scaleDown,
              ),
              2.verticalSpace,
              TextView(
                text: title,
                color: selectedIndex == index
                    ? AppColor.textColor
                    : const Color(0xffA7B8BF),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavItemData {
  final String title;
  final Widget page;
  final String selectedIcon;
  final String unselectedIcon;

  NavItemData({
    required this.title,
    required this.page,
    required this.selectedIcon,
    required this.unselectedIcon,
  });
}
