import 'package:flutter/material.dart';
import 'halaman_login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    Beranda(),
    Layanan(),
    LayananBerlangsung(),
    Setting(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Dukcapil Kota Balikpapan'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Layanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Layanan Berlangsung',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Beranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildVisiMisiCard(),
            const SizedBox(height: 16),
            _buildDisdukCapilCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildVisiMisiCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/visi.jpg',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text('Visi Pelayanan', style: _titleStyle()),
            const SizedBox(height: 5),
            Text('Tertib Administrasi Kependudukan Menuju Penduduk Berkualitas', style: _subtitleStyle()),
            const SizedBox(height: 10),
            Text('Misi Pelayanan', style: _titleStyle()),
            const SizedBox(height: 5),
            Text('Mewujudkan Penyelenggaraan Pelayanan Publik Yang Prima Di Bidang Administrasi Kependudukan', style: _subtitleStyle()),
          ],
        ),
      ),
    );
  }

  Widget _buildDisdukCapilCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('DisdukCapil Kota Balikpapan', style: _titleStyle()),
            const SizedBox(height: 10),
            Text('Disdukcapil Kota Balikpapan Adalah Lembaga Pemerintahan Di Bidang Kependudukan Dan Pencatatan Sipil', style: _subtitleStyle()),
            const SizedBox(height: 10),
            Text('Moto Pelayanan Disdukcapil Kota Balikpapan:', style: _subtitleStyleBold()),
            const SizedBox(height: 5),
            Text('- Sederhana\n- Mudah\n- Aman\n- Ramah\n- Transparan', style: _subtitleStyle()),
          ],
        ),
      ),
    );
  }

  TextStyle _titleStyle() => const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  TextStyle _subtitleStyle() => TextStyle(fontSize: 16, color: Colors.grey[600]);
  TextStyle _subtitleStyleBold() => const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}

class Layanan extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {'name': 'Kartu Keluarga', 'icon': Icons.family_restroom, 'color': Colors.blueAccent},
    {'name': 'Pindah Penduduk', 'icon': Icons.swap_horizontal_circle, 'color': Colors.green},
    {'name': 'Akte Kelahiran', 'icon': Icons.baby_changing_station, 'color': Colors.pink},
    {'name': 'Akte Perkawinan', 'icon': Icons.favorite, 'color': Colors.deepPurple},
    {'name': 'KIA', 'icon': Icons.card_membership, 'color': Colors.orange},
    {'name': 'KTP', 'icon': Icons.assignment_ind, 'color': Colors.teal},
    {'name': 'Akte Kematian', 'icon': Icons.cancel, 'color': Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return _buildServiceCard(context, services[index]);
        },
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, Map<String, dynamic> service) {
    return Card(
      elevation: 6,
      color: service['color'],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => _showServiceDetails(context, service['name']),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(service['icon'], size: 50, color: Colors.white),
              const SizedBox(height: 10),
              Text(service['name'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  void _showServiceDetails(BuildContext context, String serviceName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(serviceName),
          content: Text('Cooming Soon $serviceName.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Tutup'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}

class LayananBerlangsung extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.access_time, size: 100, color: Colors.blueAccent),
          const SizedBox(height: 20),
          const Text('Layanan Berlangsung', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text('Ini adalah halaman Layanan masa', style: TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 100, color: Colors.blueAccent),
          const SizedBox(height: 20),
          const Text('Setting', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),

          // Card for changing email
          Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Ubah Email'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => _showEmailDialog(context),
            ),
          ),

          // Card for changing phone number
          Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Ubah Nomor Telepon'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => _showPhoneDialog(context),
            ),
          ),

          // Card for resetting password
          Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Reset Kata Sandi'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => _showPasswordDialog(context),
            ),
          ),

          // Card for logout
          Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Logout'),
              trailing: const Icon(Icons.arrow_forward, color: Colors.red),
              onTap: () => _showLogoutConfirmation(context),
            ),
          ),
        ],
      ),
    );
  }

  void _showEmailDialog(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ubah Email'),
          content: TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email Baru'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Simpan'),
              onPressed: () {
                // Handle saving logic here
                Navigator.of(context).pop();
                // You can use emailController.text to get the value
              },
            ),
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showPhoneDialog(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ubah Nomor Telepon'),
          content: TextField(
            controller: phoneController,
            decoration: const InputDecoration(labelText: 'Nomor Telepon Baru'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Simpan'),
              onPressed: () {
                // Handle saving logic here
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showPasswordDialog(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reset Kata Sandi'),
          content: TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Kata Sandi Baru'),
            obscureText: true,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Simpan'),
              onPressed: () {
                // Handle saving logic here
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah Anda yakin ingin logout?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Batal'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Logout'),
            onPressed: () {
              // Handle logout logic here
              Navigator.of(context).pop(); // Close the dialog
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to login page
              );
            },
          ),
        ],
      );
    },
  );
}



void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
}