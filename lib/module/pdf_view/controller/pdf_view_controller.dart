
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/pdf_view_state.dart';
import 'package:e_library_ciheul/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class PdfViewController extends Cubit<PdfViewState> implements IBlocBase {
  PdfViewController() : super(PdfViewState());

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
    
      
    