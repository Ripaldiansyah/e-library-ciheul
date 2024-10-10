
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pdf_view_state.freezed.dart';

@unfreezed
class PdfViewState with _$PdfViewState {
  factory PdfViewState({
    @Default(0) int counter,
  }) = _PdfViewState;
}
    
    