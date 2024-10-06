import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import '../state/intro_state.dart';
import 'package:e_library_ciheul/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class IntroController extends Cubit<IntroState> implements IBlocBase {
  IntroController() : super(IntroState());

  @override
  void initState() {}

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  updateState() {
    emit(state.copyWith());
  }

  int currentIndex = 0;
  final CarouselSliderController carouselController =
      CarouselSliderController();

  login() {
    Get.to(LoginView());
  }
}
