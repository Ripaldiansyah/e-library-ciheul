import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/main_navigation_state.dart';
import 'package:e_library_ciheul/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class MainNavigationController extends Cubit<MainNavigationState>
    implements IBlocBase {
  MainNavigationController() : super(MainNavigationState());

  @override
  void initState() {
    //initState event
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  List menus = [
    (
      icon: Icons.explore_outlined,
      label: "Explore",
      iconActive: Icons.explore,
    ),
    (
      icon: Icons.search,
      label: "Search",
      iconActive: Icons.search_sharp,
    ),
    (
      icon: Icons.favorite_outline,
      label: "Favorite",
      iconActive: Icons.favorite,
    ),
    (
      icon: Icons.person_outline,
      label: "Profile",
      iconActive: Icons.person,
    ),
  ];
}
