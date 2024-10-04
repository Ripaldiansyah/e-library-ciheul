import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import 'package:injectable/injectable.dart';
import 'package:carousel_slider/carousel_controller.dart';

@singleton
class SplashController extends Cubit<SplashState> implements IBlocBase {
  SplashController() : super(SplashState());

  @override
  void initState() {
    login();
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  login() {
    Future.delayed(Duration(seconds: 4), () {
      Get.offAll(IntroView());
    });
  }
}
