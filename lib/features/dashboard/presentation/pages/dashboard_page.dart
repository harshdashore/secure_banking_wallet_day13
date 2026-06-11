import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(
        0xffF5F7FA,
      ),

      appBar: AppBar(
        title: const Text(
          "SecurePay",
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(
          16,
        ),

        child: Column(

          children: [

            _balanceCard(),

            const SizedBox(
              height: 20,
            ),

            _securityStatus(),

            const SizedBox(
              height: 20,
            ),

            _quickActions(),

            const SizedBox(
              height: 20,
            ),

            _securityModules(),

            const SizedBox(
              height: 20,
            ),

            _recentTransactions(),
          ],
        ),
      ),
    );
  }

  Widget _balanceCard() {

    return Container(

      width: double.infinity,

      padding: const EdgeInsets.all(
        20,
      ),

      decoration: BoxDecoration(

        gradient: const LinearGradient(
          colors: [
            Color(0xff2563EB),
            Color(0xff1E40AF),
          ],
        ),

        borderRadius:
        BorderRadius.circular(20),
      ),

      child: const Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Text(
            "Available Balance",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "₹ 1,25,000",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight:
              FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _securityStatus() {

    return Container(

      padding: const EdgeInsets.all(
        16,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(
          16,
        ),
      ),

      child: const Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Text(
            "Security Status",
            style: TextStyle(
              fontSize: 18,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          SizedBox(height: 15),

          ListTile(
            leading: Icon(
              Icons.verified,
              color: Colors.green,
            ),
            title: Text(
              "Device Secure",
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.fingerprint,
              color: Colors.green,
            ),
            title: Text(
              "Biometric Enabled",
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.lock,
              color: Colors.green,
            ),
            title: Text(
              "Encrypted Storage",
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.security,
              color: Colors.green,
            ),
            title: Text(
              "SSL Pinning Active",
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickActions() {

    return Column(

      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        const Text(
          "Quick Actions",
          style: TextStyle(
            fontSize: 18,
            fontWeight:
            FontWeight.bold,
          ),
        ),

        const SizedBox(height: 15),

        Row(

          mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween,

          children: [

            _actionCard(
              Icons.send,
              "Transfer",
            ),

            _actionCard(
              Icons.lock,
              "Encrypt",
            ),

            _actionCard(
              Icons.person,
              "Profile",
            ),

            _actionCard(
              Icons.logout,
              "Logout",
            ),
          ],
        ),
      ],
    );
  }

  Widget _actionCard(
      IconData icon,
      String title,
      ) {

    return Container(

      width: 75,
      height: 75,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(
          16,
        ),
      ),

      child: Column(

        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [

          Icon(icon),

          const SizedBox(height: 5),

          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _securityModules() {

    return Column(

      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        const Text(
          "Security Modules",
          style: TextStyle(
            fontSize: 18,
            fontWeight:
            FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        GridView.count(

          shrinkWrap: true,

          physics:
          const NeverScrollableScrollPhysics(),

          crossAxisCount: 2,

          childAspectRatio: 1.4,

          children: const [

            _ModuleCard(
              title:
              "Secure Storage",
              icon:
              Icons.storage,
            ),

            _ModuleCard(
              title:
              "AES Encryption",
              icon:
              Icons.lock_outline,
            ),

            _ModuleCard(
              title:
              "Biometric",
              icon:
              Icons.fingerprint,
            ),

            _ModuleCard(
              title:
              "Permissions",
              icon:
              Icons.shield,
            ),
          ],
        ),
      ],
    );
  }

  Widget _recentTransactions() {

    return Container(

      padding:
      const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(
          16,
        ),
      ),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: const [

          Text(
            "Recent Transactions",
            style: TextStyle(
              fontSize: 18,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          SizedBox(height: 15),

          ListTile(
            leading:
            CircleAvatar(
              child: Icon(
                Icons.shopping_cart,
              ),
            ),
            title: Text(
              "Amazon",
            ),
            subtitle:
            Text("Today"),
            trailing:
            Text("- ₹2,500"),
          ),

          ListTile(
            leading:
            CircleAvatar(
              child:
              Icon(Icons.fastfood),
            ),
            title:
            Text("Swiggy"),
            subtitle:
            Text("Yesterday"),
            trailing:
            Text("- ₹450"),
          ),
        ],
      ),
    );
  }
}

class _ModuleCard extends StatelessWidget {

  final String title;
  final IconData icon;

  const _ModuleCard({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Column(

        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [

          Icon(
            icon,
            size: 35,
          ),

          const SizedBox(
            height: 10,
          ),

          Text(title),
        ],
      ),
    );
  }
}