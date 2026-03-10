import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/app_providers.dart';
import '../widgets/attraction_card.dart';
import '../utils/theme.dart';
import 'attraction_details_screen.dart';

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attractions = ref.watch(filteredAttractionsProvider);
    final categories = ref.watch(categoriesProvider);
    final selectedCategoryId = ref.watch(categoryFilterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Norton'),
      ),
      body: Column(
        children: [
          // Category Filters
          SizedBox(
            height: 60,
            child: categories.when(
              data: (data) => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                scrollDirection: Axis.horizontal,
                itemCount: data.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: const Text('All'),
                        selected: selectedCategoryId == null,
                        onSelected: (_) => ref.read(categoryFilterProvider.notifier).state = null,
                        selectedColor: AppTheme.primaryColor.withOpacity(0.2),
                        checkmarkColor: AppTheme.primaryColor,
                      ),
                    );
                  }
                  final category = data[index - 1];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(category.name),
                      selected: selectedCategoryId == category.id,
                      onSelected: (_) => ref.read(categoryFilterProvider.notifier).state = category.id,
                      selectedColor: AppTheme.primaryColor.withOpacity(0.2),
                      checkmarkColor: AppTheme.primaryColor,
                    ),
                  );
                },
              ),
              loading: () => const SizedBox(),
              error: (err, stack) => const SizedBox(),
            ),
          ),

          // Attractions Grid
          Expanded(
            child: attractions.when(
              data: (data) => GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final attraction = data[index];
                  return AttractionCard(
                    attraction: attraction,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AttractionDetailsScreen(attraction: attraction),
                        ),
                      );
                    },
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => const Center(child: Text('Error loading attractions')),
            ),
          ),
        ],
      ),
    );
  }
}
