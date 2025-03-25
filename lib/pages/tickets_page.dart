import 'package:flutter/material.dart';
import 'package:test_app1/consts.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  // Mock data for tickets
  final List<Map<String, dynamic>> _tickets = [
    {
      'movieTitle': 'INTERSTELLAR',
      'date': '24 Mar 2025',
      'time': '19:00',
      'seats': ['D4', 'D5', 'D6'],
      'poster': 'https://yeuphim.mom/storage/images/ho-den-tu-than/4cee31c3afd0fbfd11ed4f14b1bfd816.jpg',
      'cinema': 'Be_soi Cinema - Hall 3',
      'ticketId': 'TIX123456789',
    },
    {
      'movieTitle': 'Attack on Titan: The Last Attack',
      'date': '25 Mar 2025',
      'time': '21:30',
      'seats': ['B7', 'B8'],
      'poster': 'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster_dai_chien_nguoi_khong_lo_7.jpg',
      'cinema': 'Be_soi Cinema - Hall 1',
      'ticketId': 'TIX987654321',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "My Tickets",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Ticket list
          Expanded(
            child: _tickets.isEmpty
                ? _buildEmptyState()
                : _buildTicketsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.local_movies_outlined,
            size: 80,
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(height: 20),
          Text(
            "No tickets found",
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Book a movie to see your tickets here",
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTicketsList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: _tickets.length,
      itemBuilder: (context, index) {
        final ticket = _tickets[index];
        return _buildTicketCard(ticket);
      },
    );
  }

  Widget _buildTicketCard(Map<String, dynamic> ticket) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Upper part with image and movie details
          Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Movie poster
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    ticket['poster'],
                    width: 80,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Xử lý lỗi khi tải ảnh
                      return Container(
                        width: 80,
                        height: 120,
                        color: Colors.grey[800],
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.white54,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 15),
                // Movie details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticket['movieTitle'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildInfoRow(Icons.calendar_today, ticket['date']),
                      const SizedBox(height: 5),
                      _buildInfoRow(Icons.access_time, ticket['time']),
                      const SizedBox(height: 5),
                      _buildInfoRow(
                        Icons.event_seat, 
                        'Seats: ${ticket['seats'].join(', ')}',
                      ),
                      const SizedBox(height: 5),
                      _buildInfoRow(Icons.location_on, ticket['cinema']),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Divider with dots
          _buildDashedDivider(),
          // Bottom part with QR code or barcode
          Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                // Ticket ID
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "TICKET ID",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white54,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        ticket['ticketId'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // View button
                ElevatedButton(
                  onPressed: () {
                    // Hiển thị thông báo khi nhấn vào nút
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Đang xem chi tiết vé: ${ticket["ticketId"]}'),
                        duration: const Duration(seconds: 2),
                        backgroundColor: buttonColor,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text("View Ticket"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.white54,
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _buildDashedDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: List.generate(
          30,
          (index) => Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              height: 2,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),
      ),
    );
  }
}
