import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';


class SideWidget extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideWidget({
    super.key, 
    required this.scaffoldKey
  });

  @override
  State<SideWidget> createState() => _SideWidgetState();
}

class _SideWidgetState extends State<SideWidget> {

  int navDraweIndex = 0;

  @override
  Widget build(BuildContext context) {

    final bool hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDraweIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDraweIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text('Main'),
        ),

        ...appMenuItems
        .sublist(0,3)
        .map((item) =>  NavigationDrawerDestination(
                                icon: Icon(item.icon), 
                                label: Text(item.title)
                            ),
        ),

        const Padding(padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
        child: Divider(),
        ),

        const Padding(padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
        child: Text('More options'),
        ),

         ...appMenuItems
        .sublist(3)
        .map((item) =>  NavigationDrawerDestination(
                                icon: Icon(item.icon), 
                                label: Text(item.title)
                            ),
        ),

      ]
    );
  }
}