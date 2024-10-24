import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>>{
  FiltersNotifier()
    : super({
        Filter.glutenFree : false,
        Filter.lactoseFree : false,
        Filter.vegetarian : false,
        Filter.vegan : false,
      });

  void setFilters(Map<Filter,bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive; // not allowed => mutuating state
    state = {
      //copies existing maps key-value pairs into new map
      ...state,
      filter: isActive,
    }; 
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);