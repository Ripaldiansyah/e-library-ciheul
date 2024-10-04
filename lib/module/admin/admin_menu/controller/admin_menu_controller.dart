
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/admin_menu_state.dart';
import 'package:e_library_ciheul/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminMenuController extends Cubit<AdminMenuState> implements IBlocBase {
  AdminMenuController() : super(AdminMenuState());

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

  increment() {
    state.counter++;
    emit(state.copyWith());
  }
}
    
      
    