import 'package:auto_route/auto_route.dart';
import 'package:coda/core/router/router.gr.dart';
import 'package:coda/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [SearchRoute(), FavoriteRoute(), SettingsRoute()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: CustomNavigationBar(
            activeIndex: tabsRouter.activeIndex,
            onPressed: (index) {
              setState(() {
                tabsRouter.setActiveIndex(index);
              });
            },
          ),
        );
      },
    );
  }
}
