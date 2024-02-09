import 'package:alibi_shop/values/imageurls.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_cubit.freezed.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryState.data(ImageUrls.all));
  changeCategory(String categoryName) {
    if (categoryName == "Все") {
      emit(const CategoryState.data(ImageUrls.all));
    } else if (categoryName == "Одежда") {
      emit(const CategoryState.data(ImageUrls.sweetShirts));
    } else if (categoryName == "Куртка") {
      emit(const CategoryState.data(ImageUrls.jackets));
    } else if (categoryName == "Рубашки") {
      emit(const CategoryState.data(ImageUrls.shirts));
    } else if (categoryName == "Толстовки и трикотаж") {
      emit(const CategoryState.data(ImageUrls.sweetShirts));
    }
  }
}
