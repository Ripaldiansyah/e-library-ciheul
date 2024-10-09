import 'package:e_library_ciheul/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  MainNavigationController controller = MainNavigationController();
  int selectedIndex = 0;

  updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }

  @override
  void initState() {
    if (GetIt.I.isRegistered<MainNavigationController>()) {
      GetIt.I.unregister<MainNavigationController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<MainNavigationController, MainNavigationState>(
        listener: (context, state) {},
        child: BlocBuilder<MainNavigationController, MainNavigationState>(
          builder: (context, state) {
            final bloc = context.read<MainNavigationController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    MainNavigationController controller,
    MainNavigationState state,
  ) {
    return Scaffold(
        body: SafeArea(
      child: DefaultTabController(
        length: 4,
        initialIndex: selectedIndex,
        child: Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: [
              ExploreBookView(),
              SearchBookView(),
              FavoriteBookView(),
              ProfileView(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: updateIndex,
              type: BottomNavigationBarType.fixed,
              items: List.generate(controller.menus.length, (index) {
                final item = controller.menus[index];
                return BottomNavigationBarItem(
                  icon: Icon(
                    item.icon,
                    color: Color(0xffa9a8a9),
                  ),
                  activeIcon: Icon(
                    item.iconActive,
                    color: primaryColor,
                  ),
                  label: item.label,
                );
              })),
        ),
      ),
    ));
  }
}
