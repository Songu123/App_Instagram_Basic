import 'package:flutter/material.dart';

void main() {
  runApp(const SonApp());
}

class SonApp extends StatefulWidget {
  const SonApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SonAppState();
  }
}

class _SonAppState extends State<SonApp> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

// MÀN HÌNH 1: HOME (Feed)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: i == 0 ? Colors.red : Colors.grey[300],
                      ),
                      if (i == 0)
                        const CircleAvatar(
                          radius: 37,
                          backgroundColor: Colors.red,
                        ),
                      const SizedBox(height: 5),
                      Text(i == 0 ? 'Your Story' : 'User $i'),
                    ],
                  ),
                );
              },
            ),
          ),
          // Các bài post
          ...List.generate(
            10,
            (i) => Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const CircleAvatar(),
                    title: Text('son_dep_trai_$i'),
                    trailing: const Icon(Icons.more_vert),
                  ),
                  Container(
                    height: 350,
                    color: Colors.primaries[i % Colors.primaries.length],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(Icons.favorite_border),
                        SizedBox(width: 15),
                        Icon(Icons.comment),
                        SizedBox(width: 15),
                        Icon(Icons.send),
                        Spacer(),
                        Icon(Icons.bookmark_border),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text('Được thích bởi 999 người khác'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// MÀN HÌNH 2: SEARCH (Feed)
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        padding: const EdgeInsets.all(2),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: 60,
        itemBuilder: (context, i) {
          return Container(
            color: Colors.primaries[i % Colors.primaries.length],
          );
        },
      ),
    );
  }
}

// MÀN HÌNH 3: PROFILE (Feed)
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Phần HEADER + AVATAR + SỐ LIỆU
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.purple, Colors.orange, Colors.pink],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 42,
                      backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/3289620/pexels-photo-3289620.jpeg',
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn('128', 'Posts'),
                      _buildStatColumn('5.2K', 'Followers'),
                      _buildStatColumn('320', 'Following'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Tên + bio
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sơn đẹp trai nhất Team',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Flutter Intern cực mạnh',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Text(
                  '20 tuổi * 1m75 * Độc thân',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Text(
                  'Món yêu thích: Phở, Bún bò',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          // Nút Edit Profile
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: Text('Edit Profile'),
              ),
            ),
          ),

          SizedBox(height: 15),

          // Story Hightlights (4 ô tròn ngang)
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 15),
              children: [
                _buildStoryCircle(
                  'https://images.pexels.com/photos/2703181/pexels-photo-2703181.jpeg',
                  'Food',
                ),
                _buildStoryCircle(
                  'https://images.pexels.com/photos/5473391/pexels-photo-5473391.jpeg',
                  'Code',
                ),
                _buildStoryCircle(
                  'https://images.pexels.com/photos/4505269/pexels-photo-4505269.jpeg',
                  'Gym',
                ),
                _buildStoryCircle(
                  'https://images.pexels.com/photos/995978/pexels-photo-995978.jpeg',
                  'Travel',
                ),
              ],
            ),
          ),

          // THAY TOÀN BỘ ĐOẠN NÀY (từ Expanded tới hết GridView)
          SizedBox(
            height:
                MediaQuery.of(context).size.height * 0.5, // hoặc 500, tùy em
            child: GridView.builder(
              physics:
                  const BouncingScrollPhysics(), // tắt cuộn của GridView vì SingleChildScrollView đã cuộn rồi
              shrinkWrap:
                  false, // quan trọng: bảo GridView chỉ chiếm đúng không gian nó cần
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildStatColumn(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(color: Colors.grey[700])),
      ],
    );
  }

  static Widget _buildStoryCircle(String imageUrl, String title) {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          CircleAvatar(radius: 34, backgroundImage: NetworkImage(imageUrl)),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
