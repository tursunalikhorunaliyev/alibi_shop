import 'package:alibi_shop/values/imageurls.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_cubit.freezed.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryState.data(ImageUrls.all));
  changeCategory(String categoryName) {
    if (categoryName == "All") {
      emit(const CategoryState.data(ImageUrls.all));
    } else if (categoryName == "Clothing") {
      emit(const CategoryState.data(ImageUrls.sweetShirts));
    } else if (categoryName == "Jacket") {
      emit(const CategoryState.data(ImageUrls.jackets));
    } else if (categoryName == "Shirts") {
      emit(const CategoryState.data(ImageUrls.shirts));
    } else if (categoryName == "Sweetshirts") {
      emit(const CategoryState.data(ImageUrls.sweetShirts));
    }
  }
}
