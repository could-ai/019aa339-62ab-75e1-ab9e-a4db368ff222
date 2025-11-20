import 'package:flutter/material.dart';
import 'package:couldai_user_app/data/app_data.dart';
import 'package:couldai_user_app/widgets/search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            title: const Row(
              children: [
                Icon(Icons.book, color: Color(0xFF00A859)),
                SizedBox(width: 8),
                Text(
                  'Pakistan Directory',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.person_outline),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: InkWell(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: GlobalSearchDelegate(),
                    );
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C2C),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade800),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 12),
                        Text(
                          'Search Province, City, Category...',
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                        const Spacer(),
                        const Icon(Icons.mic, color: Color(0xFF00A859)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Province',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AppData.provinces.length,
                    itemBuilder: (context, index) {
                      final province = AppData.provinces[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: _buildProvinceCard(context, province),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProvinceCard(BuildContext context, Province province) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (province.name == 'Islamabad') {
            Navigator.pushNamed(
              context,
              '/categories',
              arguments: {'title': 'Islamabad'},
            );
          } else {
            Navigator.pushNamed(
              context,
              '/cities',
              arguments: province,
            );
          }
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [province.color.withOpacity(0.8), province.color.withOpacity(0.4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 24),
              Icon(province.icon, size: 40, color: Colors.white),
              const SizedBox(width: 24),
              Text(
                province.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
              const SizedBox(width: 24),
            ],
          ),
        ),
      ),
    );
  }
}
