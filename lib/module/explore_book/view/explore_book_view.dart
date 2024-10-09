import 'package:e_library_ciheul/module/explore_book/widget/add_new.dart';
import 'package:e_library_ciheul/module/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import '../controller/explore_book_controller.dart';
import '../state/explore_book_state.dart';
import 'package:get_it/get_it.dart';

class ExploreBookView extends StatefulWidget {
  const ExploreBookView({super.key});

  @override
  State<ExploreBookView> createState() => _ExploreBookViewState();
}

class _ExploreBookViewState extends State<ExploreBookView> {
  ExploreBookController controller = ExploreBookController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<ExploreBookController>()) {
      GetIt.I.unregister<ExploreBookController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.initState(),
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
      child: BlocListener<ExploreBookController, ExploreBookState>(
        listener: (context, state) {},
        child: BlocBuilder<ExploreBookController, ExploreBookState>(
          builder: (context, state) {
            final bloc = context.read<ExploreBookController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    ExploreBookController controller,
    ExploreBookState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Book'),
      ),
      body: state.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                SingleChildScrollView(
                  controller: ScrollController(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Builder(builder: (context) {
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 3.0,
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                ),
                                itemCount: state.categories!.length,
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  var item = state.categories![index];
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            8.0,
                                          ),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            item.image,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              item.label,
                                              style: const TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(99.0),
                      ),
                      color: primaryColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        controller.clicked();
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ),
                  ),
                ),
                if (state.isClicked)
                  Positioned(
                    right: 40,
                    bottom: 70,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 24,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AddNew(
                            label: "Tambah Buku",
                            onPressed: () {
                              controller.uploadBook();
                            },
                          ),
                          AddNew(
                            label: "Tambah Kategori",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ).animate().scaleY(duration: 100.ms),
                  ),
              ],
            ),
    );
  }
}
