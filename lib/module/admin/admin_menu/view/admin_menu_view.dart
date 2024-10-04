
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/admin_menu_controller.dart';
import '../state/admin_menu_state.dart';
import 'package:get_it/get_it.dart';

class AdminMenuView extends StatefulWidget {
  const AdminMenuView({super.key});

  @override
  State<AdminMenuView> createState() => _AdminMenuViewState();
}

class _AdminMenuViewState extends State<AdminMenuView> {
  AdminMenuController controller = AdminMenuController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminMenuController>()) {
      GetIt.I.unregister<AdminMenuController>();
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
      child: BlocListener<AdminMenuController, AdminMenuState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminMenuController, AdminMenuState>(
          builder: (context, state) {
            final bloc = context.read<AdminMenuController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminMenuController controller,
    AdminMenuState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Menu'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Counter: ${state.counter}',
            style: const TextStyle(fontSize: 24),
          ),
          IconButton(
            onPressed: () => controller.increment(),
            icon: const Icon(
              Icons.add,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
    
    