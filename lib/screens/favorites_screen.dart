import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/app_providers.dart';
import '../widgets/attraction_card.dart';
import '../utils/theme.dart';
import 'attraction_details_screen.dart';
import 'auth_screen.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final user = ref.watch(supabaseServiceProvider).currentUser;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Favorites')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite_border, size: 64, color: AppTheme.textSecondary),
              const SizedBox(height: 16),
              const Text('Sign in to see your favorites'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AuthScreen()),
                  );
                },
                child: const Text('Sign In'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Your Favorites')),
      body: favorites.when(
        data: (data) => data.isEmpty
            ? const Center(child: Text('You haven\'t saved any favorites yet.'))
            : GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return AttractionCard(
                    attraction: data[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AttractionDetailsScreen(attraction: data[index]),
                        ),
                      );
                    },
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => const Center(child: Text('Error loading favorites')),
      ),
    );
  }
}
