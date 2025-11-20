import 'package:flutter/material.dart';
import 'package:couldai_user_app/data/app_data.dart';
import 'package:couldai_user_app/widgets/search_delegate.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final province = ModalRoute.of(context)!.settings.arguments as Province;

    return Scaffold(
      appBar: AppBar(
        title: Text(province.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: GlobalSearchDelegate());
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: province.cities.length,
        itemBuilder: (context, index) {
          final city = province.cities[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
                child: Icon(Icons.location_on, color: Theme.of(context).primaryColor),
              ),
              title: Text(
                city,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/categories',
                  arguments: {'title': city, 'province': province.name},
                );
              },
            ),
          );
        },
      ),
    );
  }
}
