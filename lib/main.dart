import 'package:flutter/material.dart';

void main() {
  runApp(const SonApp());
}

class SonApp extends StatelessWidget {
  const SonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
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
                              colors: [
                                Colors.purple,
                                Colors.orange,
                                Colors.pink,
                              ],
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

              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                          style: TextStyle(
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
        ),
      ),
    );
  }

  Widget _buildStatColumn(String number, String label) {
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

  Widget _buildStoryCircle(String imageUrl, String title) {
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
