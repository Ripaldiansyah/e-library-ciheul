import 'package:e_library_ciheul/core.dart';
import 'package:e_library_ciheul/module/explore_book/view/explore_book_view.dart';
import 'package:e_library_ciheul/shared/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/profile_controller.dart';
import '../state/profile_state.dart';
import 'package:get_it/get_it.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController controller = ProfileController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<ProfileController>()) {
      GetIt.I.unregister<ProfileController>();
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
      child: BlocListener<ProfileController, ProfileState>(
        listener: (context, state) {},
        child: BlocBuilder<ProfileController, ProfileState>(
          builder: (context, state) {
            final bloc = context.read<ProfileController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    ProfileController controller,
    ProfileState state,
  ) {
    controller.totalFavorite();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: state.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: cardBackground,
                  ),
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            DBService.get("name")!,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 180,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 40,
                          offset: Offset(0, 2),
                        ),
                      ],
                      color: cardBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        controller: ScrollController(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Total Buku Saya",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      Text(
                                        "${state.totalMyBook}",
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ).animate().shimmer(duration: 1000.ms),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Total Buku favorite",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      Text(
                                        "${state.totalFavorite}",
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ).animate().shimmer(duration: 1000.ms),
                                    ],
                                  ),
                                  QButton(
                                    label: "Logout",
                                    backgroundColor: Colors.red,
                                    onPressed: () {
                                      controller.logout();
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
