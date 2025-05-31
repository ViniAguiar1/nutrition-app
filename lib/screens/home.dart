import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'weekly_meal_plan.dart'; // Import the WeeklyMealPlanScreen
import 'materiais.dart'; // Import the MateriaisScreen
import 'chat.dart'; // Import the ChatScreen
import 'prescricoes.dart'; // Import the PrescricoesScreen
import 'receitas.dart'; // Import the ReceitasScreen
import 'consultation_history.dart'; // Import the ConsultationHistoryScreen
import 'updates.dart'; // Import the UpdatesScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _carouselController = PageController();
  int _currentCarouselPage = 0;
  bool _showFullDiet = false;
  String _appointmentStatus = "Pendente"; // Initial status of the appointment

  final List<Map<String, String>> _carouselItems = [
    {
      "title": "Bem-vindo!",
      "description": "Estamos felizes em tê-lo aqui, Vinicius!",
    },
    {
      "title": "Atualizações",
      "description": "Confira as novidades e atualizações do app.",
    },
    {
      "title": "Metas",
      "description": "Acompanhe suas metas e continue evoluindo!",
    },
  ];

  final List<String> _bannerImages = [
    "https://sp-ao.shortpixel.ai/client/to_auto,q_lossy,ret_img/https://market.us/wp-content/uploads/2022/08/NIKE-Inc_banner.jpg",
    "https://brand.assets.adidas.com/image/upload/f_auto,q_auto:best,fl_lossy/if_w_gt_1920,w_1920/originals_ss25_theoriginal_bnr_m_black_d_dcf0f168d4.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRykUFBJ11C8fE9LUacngB3tMRM48y4fgLW8g&s",
  ];

  final PageController _bannerController =
      PageController(); // Add PageController for custom carousel
  int _currentBannerIndex = 0; // Track current banner index

  final List<Map<String, String>> _dailyMeals = [
    {"horario": "08:00", "refeicao": "Café da manhã: Pão integral e suco"},
    {
      "horario": "12:00",
      "refeicao": "Almoço: Frango grelhado e arroz integral",
    },
    {"horario": "19:00", "refeicao": "Jantar: Sopa de legumes"},
  ];

  int _getClosestMealIndex() {
    final now = TimeOfDay.now();
    for (int i = 0; i < _dailyMeals.length; i++) {
      final mealTime = TimeOfDay(
        hour: int.parse(_dailyMeals[i]["horario"]!.split(":")[0]),
        minute: int.parse(_dailyMeals[i]["horario"]!.split(":")[1]),
      );
      if (now.hour < mealTime.hour ||
          (now.hour == mealTime.hour && now.minute <= mealTime.minute)) {
        return i;
      }
    }
    return _dailyMeals.length -
        1; // Default to the last meal if none are upcoming
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Make status bar transparent
        statusBarIconBrightness: Brightness.dark, // Black icons
        statusBarBrightness: Brightness.light, // For iOS
      ),
    );
  }

  void _confirmAppointment() {
    setState(() {
      _appointmentStatus = "Confirmada";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Consulta confirmada com sucesso!"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _cancelAppointment() {
    setState(() {
      _appointmentStatus = "Desmarcada";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Consulta desmarcada com sucesso!"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int closestMealIndex = _getClosestMealIndex();
    final PageController _mealCarouselController = PageController(
      initialPage: closestMealIndex,
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Color(0xFF125c52)), // Primary color
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(
          "Bem-vindo!",
          style: TextStyle(
            color: Color(0xFF125c52), // Primary color
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Color(0xFF125c52),
            ), // Primary color
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdatesScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white, // Set background color to white
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF125c52), // Primary color
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        "https://github.com/ViniAguiar1.png",
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Bem-vindo, Vinicius!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "vinicius@example.com",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Color(0xFF125c52),
                ), // Primary color
                title: Text("Home"),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.fitness_center,
                  color: Color(0xFF125c52),
                ), // Primary color
                title: Text("Treinos"),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/workouts',
                  ); // Navigate to Workouts
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.flag,
                  color: Color(0xFF125c52),
                ), // Primary color
                title: Text("Metas"),
                onTap: () {
                  Navigator.pushNamed(context, '/goals'); // Navigate to Goals
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Color(0xFF125c52),
                ), // Primary color
                title: Text("Perfil"),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/profile',
                  ); // Navigate to Profile
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.book,
                  color: Color(0xFF125c52),
                ), // Primary color
                title: Text("Materiais"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MateriaisScreen()),
                  ); // Navigate to Materiais
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text("Sair"),
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/login',
                  ); // Navigate to Login
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom Rotating Banner
              SizedBox(
                height: 180.0,
                child: PageView.builder(
                  controller: _bannerController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentBannerIndex = index;
                    });
                  },
                  itemCount: _bannerImages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ), // Add horizontal padding
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          _bannerImages[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _bannerImages.length,
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: _currentBannerIndex == index ? 12 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentBannerIndex == index
                              ? Color(0xFF125c52) // Primary color
                              : Color(0xFF676664), // Neutral color
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Bem-vindo!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF125c52), // Primary color
                ),
              ),
              Text(
                "Estamos felizes em tê-lo aqui, Vinicius!",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF676664), // Neutral color
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Acesso rápido",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF125c52), // Primary color
                ),
              ),
              SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 8.0, // Reduced vertical spacing
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeeklyMealPlanScreen(),
                        ),
                      );
                    },
                    child: _buildQuickAccessCard(
                      "Plano Alimentar",
                      "https://p2.trrsf.com/image/fget/cf/774/0/images.terra.com/2024/10/30/1277675723-whatsapp-image-2024-10-30-at-165932.jpeg",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReceitasScreen(),
                        ),
                      );
                    },
                    child: _buildQuickAccessCard(
                      "Receitas",
                      "https://p2.trrsf.com/image/fget/cf/774/0/images.terra.com/2024/10/30/1277675723-whatsapp-image-2024-10-30-at-165932.jpeg",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatScreen()),
                      );
                    },
                    child: _buildQuickAccessCard(
                      "Chat",
                      "https://p2.trrsf.com/image/fget/cf/774/0/images.terra.com/2024/10/30/1277675723-whatsapp-image-2024-10-30-at-165932.jpeg",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrescricoesScreen(),
                        ),
                      );
                    },
                    child: _buildQuickAccessCard(
                      "Prescrições",
                      "https://p2.trrsf.com/image/fget/cf/774/0/images.terra.com/2024/10/30/1277675723-whatsapp-image-2024-10-30-at-165932.jpeg",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Plano alimentar",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF125c52), // Primary color
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeeklyMealPlanScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Ver Mais",
                      style: TextStyle(
                        color: Color(0xFF125c52), // Primary color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 180,
                child: PageView.builder(
                  controller: _mealCarouselController,
                  itemCount: _dailyMeals.length,
                  itemBuilder: (context, index) {
                    final meal = _dailyMeals[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ), // Add horizontal gap
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Color(0xFF125c52), // Primary color
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    meal["horario"]!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF125c52), // Primary color
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Text(
                                meal["refeicao"]!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF676664), // Neutral color
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Action for meal registration
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(
                                      0xFF24b5a1,
                                    ), // Secondary color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Text(
                                    "Registrar",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Horário pré-agendado",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF125c52), // Primary color
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConsultationHistoryScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Histórico",
                      style: TextStyle(
                        color: Color(0xFF125c52), // Primary color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              _buildScheduleCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAccessCard(String title, String imageUrl) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            imageUrl,
            height: 100, // Increased image height
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF125c52), // Primary color
          ),
        ),
      ],
    );
  }

  Widget _buildPlanCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: ListTile(
        leading: Icon(
          Icons.restaurant,
          color: Color(0xFF125c52),
        ), // Primary color
        title: Text(
          "REF. 1",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF125c52), // Primary color
          ),
        ),
        subtitle: Text(
          "100g Frango grelhado, 150g Arroz integral, 10ml azeite",
          style: TextStyle(color: Color(0xFF676664)), // Neutral color
        ),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF24b5a1), // Secondary color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text("Registrar", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildScheduleCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: ListTile(
        leading: Icon(
          Icons.calendar_today,
          color: Color(0xFF125c52),
        ), // Primary color
        title: Text(
          "14:00 | 10/06/2025",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF125c52), // Primary color
          ),
        ),
        subtitle: Text(
          "Consulta marcada",
          style: TextStyle(color: Color(0xFF676664)), // Neutral color
        ),
        trailing: Icon(
          Icons.visibility,
          color: Color(0xFF125c52),
        ), // Primary color
      ),
    );
  }
}
