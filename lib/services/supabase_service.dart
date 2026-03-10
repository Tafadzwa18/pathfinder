import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/attraction.dart';
import '../models/category.dart';

class SupabaseService {
  final _client = Supabase.instance.client;

  // Authentication
  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;
  User? get currentUser => _client.auth.currentUser;

  Future<AuthResponse> signUp({required String email, required String password}) async {
    return await _client.auth.signUp(email: email, password: password);
  }

  Future<AuthResponse> signIn({required String email, required String password}) async {
    return await _client.auth.signInWithPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  // Attractions
  Future<List<Attraction>> getAttractions() async {
    final response = await _client.from('attractions').select().eq('is_active', true);
    return (response as List).map((json) => Attraction.fromJson(json)).toList();
  }

  Future<List<Attraction>> getFeaturedAttractions() async {
    final response = await _client.from('attractions').select().eq('is_active', true).eq('is_featured', true);
    return (response as List).map((json) => Attraction.fromJson(json)).toList();
  }

  Future<List<Attraction>> getAttractionsByCategory(String categoryId) async {
    final response = await _client.from('attractions').select().eq('is_active', true).eq('category_id', categoryId);
    return (response as List).map((json) => Attraction.fromJson(json)).toList();
  }

  // Categories
  Future<List<Category>> getCategories() async {
    final response = await _client.from('categories').select();
    return (response as List).map((json) => Category.fromJson(json)).toList();
  }

  // Favorites
  Future<List<Attraction>> getFavorites(String userId) async {
    final response = await _client.from('favorites').select('attraction_id, attractions(*)').eq('user_id', userId);
    return (response as List).map((json) => Attraction.fromJson(json['attractions'])).toList();
  }

  Future<void> addFavorite(String userId, String attractionId) async {
    await _client.from('favorites').insert({'user_id': userId, 'attraction_id': attractionId});
  }

  Future<void> removeFavorite(String userId, String attractionId) async {
    await _client.from('favorites').delete().eq('user_id', userId).eq('attraction_id', attractionId);
  }

  Future<bool> isFavorite(String userId, String attractionId) async {
    final response = await _client.from('favorites').select().eq('user_id', userId).eq('attraction_id', attractionId).maybeSingle();
    return response != null;
  }
}
