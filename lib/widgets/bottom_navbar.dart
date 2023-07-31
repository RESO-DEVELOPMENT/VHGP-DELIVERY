import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vh_shipper_app/Colors/color.dart';

enum TabItem { home, order, history, transaction, account }

const Map<TabItem, String> tabName = {
  TabItem.home: 'Trang chủ',
  TabItem.order: 'Đơn hàng',
  TabItem.history: 'Lịch sử',
  TabItem.transaction: 'Giao dịch',
  TabItem.account: 'Tài khoản',
};

const Map<TabItem, IconData> tabIcon = {
  TabItem.home: Icons.home,
  TabItem.order: Icons.notes_rounded,
  TabItem.history: Icons.history,
  TabItem.transaction: Icons.account_balance_wallet_outlined,
  TabItem.account: Icons.account_circle_outlined,
};

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
  late final TabItem currentTab;
  late final ValueChanged<TabItem> onSelectTab;

  BottomNavbar({required this.currentTab, required this.onSelectTab});
}

class _BottomNavbarState extends State<BottomNavbar> {
  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(tabIcon[tabItem]),
      label: tabName[tabItem],
    );
  }

  BottomNavigationBarItem _buildNofication(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(tabIcon[tabItem]),
      label: tabName[tabItem],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: IconThemeData(color: MaterialColors.primary),
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.currentTab.index,
      selectedItemColor: MaterialColors.primary,
      items: [
        _buildItem(TabItem.home),
        _buildNofication(TabItem.order),
        _buildItem(TabItem.history),
        _buildNofication(TabItem.transaction),
        _buildItem(TabItem.account),
      ],
      onTap: (index) => widget.onSelectTab(
        TabItem.values[index],
      ),
    );
  }
}
