import 'package:flutter/material.dart';

void main() {
  runApp(const KurdAiDesignApp());
}

class KurdAiDesignApp extends StatelessWidget {
  const KurdAiDesignApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kurd AI Design',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7C3AED),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> designs = [
    {
      'title': 'دیزاینی گوڵ',
      'category': 'کەژاوە',
      'icon': Icons.local_florist,
      'color': Color(0xFFE11D48),
    },
    {
      'title': 'نەخشەی کوردی',
      'category': 'جل و بەرگ',
      'icon': Icons.auto_awesome,
      'color': Color(0xFF7C3AED),
    },
    {
      'title': 'نەخشەی سادە',
      'category': 'ئۆڵمە',
      'icon': Icons.grid_3x3,
      'color': Color(0xFF2563EB),
    },
    {
      'title': 'دیزاینی زێڕین',
      'category': 'جلی ئاهەنگ',
      'icon': Icons.workspace_premium,
      'color': Color(0xFFD97706),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7FA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kurd AI Design',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              Text(
                'خەیاطی • ئۆڵمە • دیزاین',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        body: _buildBody(),
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'سەرەتا',
            ),
            NavigationDestination(
              icon: Icon(Icons.palette_outlined),
              selectedIcon: Icon(Icons.palette),
              label: 'دیزاین',
            ),
            NavigationDestination(
              icon: Icon(Icons.folder_outlined),
              selectedIcon: Icon(Icons.folder),
              label: 'فایلەکان',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'پڕۆفایل',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (currentIndex == 1) return _designsPage();
    if (currentIndex == 2) return _filesPage();
    if (currentIndex == 3) return _profilePage();
    return _homePage();
  }

  Widget _homePage() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF7C3AED),
                Color(0xFF2563EB),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kurd AI Design',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'دیزاینە جوانەکانت لە یەک شوێن دروست بکە.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'خزمەتگوزارییەکان',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _serviceCard(
                Icons.auto_awesome,
                'دروستکردنی دیزاین',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _serviceCard(
                Icons.upload_file,
                'فایلی ئۆڵمە',
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'دیزاینە نوێکان',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: designs.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return _designCard(designs[index]);
          },
        ),
      ],
    );
  }

  Widget _serviceCard(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: const Color(0xFF7C3AED),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _designCard(Map<String, dynamic> design) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            design['icon'],
            size: 70,
            color: design['color'],
          ),
          const SizedBox(height: 12),
          Text(
            design['title'],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            design['category'],
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _designsPage() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'هەموو دیزاینەکان',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 15),
        ...designs.map(
          (design) => Card(
            child: ListTile(
              leading: Icon(
                design['icon'],
                color: design['color'],
              ),
              title: Text(design['title']),
              subtitle: Text(design['category']),
              trailing: const Icon(Icons.chevron_left),
            ),
          ),
        ),
      ],
    );
  }

  Widget _filesPage() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.folder_open,
            size: 80,
            color: Color(0xFF7C3AED),
          ),
          SizedBox(height: 15),
          Text(
            'هێشتا هیچ فایلێک نییە',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'دەتوانین دواتر فایلەکانی DST زیاد بکەین.',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _profilePage() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 45,
            child: Icon(Icons.person, size: 50),
          ),
          SizedBox(height: 15),
          Text(
            'Kurd AI Design',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
