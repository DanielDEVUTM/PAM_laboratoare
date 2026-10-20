import 'package:flutter_bloc/flutter_bloc.dart';

/// Id-urile produselor favorite.
class FavoritesCubit extends Cubit<Set<String>> {
  FavoritesCubit([Set<String>? initial]) : super(initial ?? const {});

  bool isFavorite(String id) => state.contains(id);

  void toggle(String id) {
    final next = {...state};
    if (!next.remove(id)) next.add(id);
    emit(next);
  }

  void remove(String id) => emit({...state}..remove(id));
}
