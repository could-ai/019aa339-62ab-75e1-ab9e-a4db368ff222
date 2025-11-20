import 'package:flutter/material.dart';
import 'package:couldai_user_app/data/app_data.dart';

class GlobalSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: const Color(0xFF121212),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    final cleanQuery = query.toLowerCase();
    
    if (cleanQuery.isEmpty) {
      return _buildSearchHistory();
    }

    // Filter logic
    final List<Widget> results = [];

    // 1. Check Provinces
    for (var province in AppData.provinces) {
      if (province.name.toLowerCase().contains(cleanQuery)) {
        results.add(_buildResultTile(
          context, 
          province.name, 
          'Province', 
          Icons.map, 
          () {
             if (province.name == 'Islamabad') {
                Navigator.pushNamed(context, '/categories', arguments: {'title': 'Islamabad'});
             } else {
                Navigator.pushNamed(context, '/cities', arguments: province);
             }
          }
        ));
      }
      
      // 2. Check Cities
      for (var city in province.cities) {
        if (city.toLowerCase().contains(cleanQuery)) {
           results.add(_buildResultTile(
            context, 
            city, 
            'City in ${province.name}', 
            Icons.location_city, 
            () {
               Navigator.pushNamed(context, '/categories', arguments: {'title': city, 'province': province.name});
            }
          ));
        }
      }
    }

    // 3. Check Categories
    for (var category in AppData.categories) {
      if (category.name.toLowerCase().contains(cleanQuery)) {
         results.add(_buildResultTile(
            context, 
            category.name, 
            'Category', 
            category.icon, 
            () {
               // Just show snackbar for now as category search is generic
               ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text('Searching for ${category.name} near you...'))
               );
            }
          ));
      }
    }

    if (results.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text('No results found for "$query"', style: const TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    return ListView(children: results);
  }

  Widget _buildSearchHistory() {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Recent Searches', style: TextStyle(color: Colors.grey)),
        ),
        _buildResultTile(context, 'Lahore Hospitals', 'History', Icons.history, () { query = 'Lahore Hospitals'; }),
        _buildResultTile(context, 'Islamabad Schools', 'History', Icons.history, () { query = 'Islamabad Schools'; }),
      ],
    );
  }

  Widget _buildResultTile(BuildContext context, String title, String subtitle, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      onTap: onTap,
    );
  }
}
