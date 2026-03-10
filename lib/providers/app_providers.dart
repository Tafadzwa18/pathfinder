import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/attraction.dart';
import '../models/category.dart';
import '../services/supabase_service.dart';

final supabaseServiceProvider = Provider((ref) => SupabaseService());

final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  return ref.watch(supabaseServiceProvider).getCategories();
});

final attractionsProvider = FutureProvider<List<Attraction>>((ref) async {
  return ref.watch(supabaseServiceProvider).getAttractions();
});

final featuredAttractionsProvider = FutureProvider<List<Attraction>>((ref) async {
  return ref.watch(supabaseServiceProvider).getFeaturedAttractions();
});

final categoryFilterProvider = StateProvider<String?>((ref) => null);

final filteredAttractionsProvider = FutureProvider<List<Attraction>>((ref) async {
  final categoryId = ref.watch(categoryFilterProvider);
  if (categoryId == null) {
    return ref.watch(attractionsProvider.future);
  }
  return ref.watch(supabaseServiceProvider).getAttractionsByCategory(categoryId);
});

final favoritesProvider = FutureProvider<List<Attraction>>((ref) async {
  final service = ref.watch(supabaseServiceProvider);
  final user = service.currentUser;
  if (user == null) return [];
  return service.getFavorites(user.id);
});
