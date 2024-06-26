import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text('Pesanan'),
            ],
          ),
          centerTitle: false, // Align title to the left
          backgroundColor:
              Colors.white, // Set the AppBar background color to white
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor:
                Colors.blue, // Set the TabBar indicator color to blue
            tabs: [
              Tab(text: 'Riwayat'),
              Tab(text: 'Dalam Proses'),
              Tab(text: 'Terjadwal'),
            ],
          ),
        ),
        body: Container(
          color: Colors.white, // Set the background color to white
          child: TabBarView(
            children: [
              OrderListView(status: 'riwayat'),
              OrderListView(status: 'dalam_proses'),
              OrderListView(status: 'terjadwal'),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_offer),
                  label: 'Promo',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.store),
                  label: 'Toko',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profil',
                ),
              ],
              selectedItemColor: Color(0xFF56BEE1),
              unselectedItemColor: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class OrderListView extends StatelessWidget {
  final String status;

  OrderListView({required this.status});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3, // Replace with your dynamic item count
      itemBuilder: (context, index) {
        return OrderCard(status: status);
      },
    );
  }
}

class OrderCard extends StatelessWidget {
  final String status;

  OrderCard({required this.status});

  @override
  Widget build(BuildContext context) {
    String deliveryStatus;
    IconData iconData;
    if (status == 'dalam_proses') {
      deliveryStatus = 'Sedang dalam proses';
      iconData = Icons.hourglass_empty;
    } else if (status == 'terjadwal') {
      deliveryStatus = 'Dikirim pada hari rabu';
      iconData = Icons.local_shipping;
    } else {
      deliveryStatus = 'Sudah dikirim';
      iconData = Icons.check_circle;
    }

    return Card(
      color: Colors.white, // Set the background color of the card to white
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0), // Set border radius
        side: BorderSide(
          color: Colors.grey.withOpacity(0.5), // Set border color
          width: 1.0, // Set border width
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal transaksi',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  'https://via.placeholder.com/60',
                  width: 60,
                  height: 60,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama toko barang yang dibeli',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Rp 10.000',
                        style: TextStyle(color: Colors.black87),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            iconData,
                            color: deliveryStatus == 'Sudah dikirim'
                                ? Colors.green
                                : Colors.orange,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            deliveryStatus,
                            style: TextStyle(
                              color: deliveryStatus == 'Sudah dikirim'
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
                height: 16), // Add spacing between the main content and buttons
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.end, // Align buttons to the end
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Detail pesanan',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                SizedBox(width: 16), // Add spacing between buttons
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 104, 207, 255),
                  ),
                  child: Text(
                    'Pesan Lagi',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
