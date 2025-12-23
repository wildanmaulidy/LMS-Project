import 'package:flutter/material.dart';

class KelasScreen extends StatefulWidget {
  const KelasScreen({super.key});

  @override
  State<KelasScreen> createState() => _KelasScreenState();
}

class _KelasScreenState extends State<KelasScreen> {
  int _selectedIndex = 1; // Kelas Saya is selected

  final List<KelasItem> _kelasList = [
    KelasItem(
      title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
      semester: '2021/2',
      progress: 89,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCVL1aTswmIjEIqJOcHk72rZjZerLdrTHw2bTdsj1v9Oln2j8OtxP2cg-DMKnFuiGt7IFxIAylw_HTcbHJrvyHz5xT635ra-cLjQk7DVxHBOp89ViQkBS4pLTxMW03rrQFzQ9ivmiG48NiOleCosBlBjfV5bGE5nX2qfuuOiWVEBW7ADpSGYqq9fAixHCZqAjdMxYIwN7eOKebWF19kv9eePxwQ8XTt9tpMivjPl1lF97oIASpmysLMYqQ2wScldSQS5-SvGrtPUfG3',
      bgColor: const Color(0xFFFEF3C7),
    ),
    KelasItem(
      title: 'KEWARGANEGARAAN\nD4SM-41-GAB1 [BBO]. JUMAT 2',
      semester: '2021/2',
      progress: 86,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDBuV6avCRjjysOJk7_IiHRcdcRpQkYpmcwRiOIEvvwr4i6B-F3-RPf7QyEbj8htBueKbMmw_zDQtlVtZH3BrnXDDUVY2tknyLeZFM55h7GOpDXIyJ9MPndIi_OIhofi_8s60DQsPAWBvv0cWPrlw17lRw8yM96SA4yml9zrYeyj1ZL5-dNVXtLrbKBvfap6yxLWOhyq2O2GGvwIyIBbxl3x8saZjcOgh7aVbq7EOq5Q90u4hA0sFfGXp7FekjnIn4cAnivhNC6OAow',
      bgColor: const Color(0xFFFEE2E2),
    ),
    KelasItem(
      title: 'SISTEM OPERASI\nD4SM-44-02 [DDS]',
      semester: '2021/2',
      progress: 90,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAvgAY_tFdWabFwW3OxYwpFxS5Afoz1-or67Xoiey-dRaYP123FHvsgK4C9Dj0Xz85CdmxxWQ2PKH3_ItsOFcZ8ZNwJEIlbS4LWLpbLsaktVUtz7LdW6heV_H3WNNP1RMLlsxkRBohWhNxvvZ0pblZxgAvZzLNaNOZvH-dEU9lwwerlQ1yCH6aNYlOvexA0y-GcunP6Qxybu_Izy1k1OC3uHnHLZsovIuVwkMf3FR1bGYNAmK9bABDPRZLnzqPk020eQeJJTMRwUsIT',
      bgColor: const Color(0xFFF3F4F6),
    ),
    KelasItem(
      title: 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA\nD4SM-41-GAB1 [APJ]',
      semester: '2021/2',
      progress: 90,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA7Fh0Wj33vE75nWZdCH-SX5pLaxcVnckA8ZGsHv2x6YwxgBQpydkHMobf9YSBv_hSSBkR3gf6K-PdYzjBKjo0SgAmY0RnVk88U8DyaN6pzUgVWaBp9EvzcbTFm5elj3_B4JIyKrz46qq0EMECEL_n_2Pz-qessP1-ZDB0o1_LiNEJrztlzVyA6kkkKEbww8f6noV3JXjrKiRb1t_z65r1mrJ1rgYTxA1Hguy2_Sbo_cOXFXSWCw1xPnPd1zzwsqtresfOXRu7dLmbU',
      bgColor: const Color(0xFFCFFAFE),
    ),
    KelasItem(
      title: 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC\nD4SM-41-GAB1 [ARS]',
      semester: '2021/2',
      progress: 90,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC-zAe99zqEckhWKMN7Zf0uR_u_WnRDyIIdPba9pOCYkes8FnGLz6ioikVNxFYqe7oizho3jge_z7C10V0qJP5FlC8WHpPOwiV7makol8sxroqJV3mKTXXNan-2p9AOTE75tEWAVIocYOysaxh1zCKB0UXgD6rTw8BFaVY9tr1shY5xT6JPXLLxSPas2zDqn-UByrDKcDDgBeN0bEQAoqQzp1VitNxqknKDRG0tbQHBbxJXLeFqtsnut5ZoFOTJ59UB2y2SVXlab3dI',
      bgColor: const Color(0xFFE5E7EB),
    ),
    KelasItem(
      title: 'PEMROGRAMAN MULTIMEDIA INTERAKTIF D4SM-43-04 [TPR]',
      semester: '2021/2',
      progress: 90,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDMxOQ3TCfhFR7tAfS4M6TXq6zA_O_4pICQYiJmaDhtOl91sqgqhI1xg1Iy_YCwg7I9nsOWbnBu_zVsBS5vgkTf-Mn9B6k_fXgYmCo9TDtYa-cPfxedZTWbs0mVHpLL6904nhXxhTsTpYTgzH13qU0WAGZpaMSK3N09tyOF2Q65UWYeW35TYWkfFSyXMYoy-k0PQHGmfDINw-tvJOK0KLr4iJ2EZlfVAcKMqmifH1-BdRt5UsIuiFOxSb8t_Km7PVw0CwRHt2XzypZQ',
      bgColor: const Color(0xFF3B82F6),
    ),
    KelasItem(
      title: 'OLAH RAGA\nD3TT-44-02 [EYR]',
      semester: '2021/2',
      progress: 90,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBzqjo5OMTirQ2fOgOT9qiigFS-7OY146-4mDOvXNlsn7QRxd3Q-s093PaOs50we4TW6bD7_cqqhs5dBysm08X560zMWS19CkNHhphdZP6WEVsyOBUHuudFSjXG-Zr0ISAXotKvYwjDgXl9dVJ4aGSuf99BEIgbOlOcHZirATtDxsnRBtN3LqVFeJSqq7DlmYbMhTD24Cvjf0hGNRNq8ngyPI0zX20XyNwG6r_cQGjzsMiJMRBqg24mijJacnJr_WSRv7zDFhZMCG3j',
      bgColor: const Color(0xFFC084FC),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          Column(
            children: [
              _buildHeader(),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                  itemCount: _kelasList.length,
                  itemBuilder: (context, index) {
                    return _buildKelasCard(_kelasList[index]);
                  },
                ),
              ),
            ],
          ),
          _buildBottomNavigation(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 56, 24, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: const Border(
          bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back,
              size: 28,
              color: Color(0xFF1F2937),
            ),
          ),
          const Expanded(
            child: Text(
              'Kelas Saya',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(width: 28), // Balance the back button
        ],
      ),
    );
  }

  Widget _buildKelasCard(KelasItem kelas) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3F4F6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: kelas.bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                kelas.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: kelas.bgColor,
                    child: const Icon(Icons.image, color: Colors.grey),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kelas.semester,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  kelas.title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF111827),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),
                // Progress bar
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5E7EB),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Stack(
                    children: [
                      FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: kelas.progress / 100,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFA02323),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      // Shine effect
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.white.withValues(alpha: 0.2),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${kelas.progress} % Selesai',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFA02323),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 20,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, 'Home', 0),
                _buildNavItem(Icons.school, 'Kelas Saya', 1),
                _buildNavItem(Icons.notifications, 'Notifikasi', 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.of(context).pop();
        } else {
          setState(() {
            _selectedIndex = index;
          });
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: isSelected ? 32 : 28,
            color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.7),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.7),
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

class KelasItem {
  final String title;
  final String semester;
  final int progress;
  final String imageUrl;
  final Color bgColor;

  KelasItem({
    required this.title,
    required this.semester,
    required this.progress,
    required this.imageUrl,
    required this.bgColor,
  });
}
