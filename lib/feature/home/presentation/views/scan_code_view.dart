import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:vibration/vibration.dart';

class ScanCodeView extends StatefulWidget {
  const ScanCodeView({super.key});

  static const String routeName = '/scan-code';

  @override
  State<ScanCodeView> createState() => _ScanCodeViewState();
}

class _ScanCodeViewState extends State<ScanCodeView> with SingleTickerProviderStateMixin {
  bool isFlashOn = false;
  MobileScannerController scannerController = MobileScannerController();
  late AnimationController _animationController;
bool hasScanned = false; // Prevent multiple detections
  final frameSize = 250.0;
  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    // Trigger rebuild every frame
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // QR Scanner
          MobileScanner(
            controller: scannerController,
            onDetect: (capture) async{
              final List<Barcode> barcodes = capture.barcodes;
              if (barcodes.isNotEmpty) {
                if (!hasScanned) {
                setState(() {
                  hasScanned = true;
                });}
                final String code = barcodes.first.rawValue ?? "";
                // **Trigger Vibration on Scan**
                if (await Vibration.hasVibrator() ) {
                  Vibration.vibrate(duration: 300); // Vibrates for 300ms
                }
              }
            },
          ),

          // Custom Scanner Overlay
          Positioned.fill(
            child: Stack(
              children: [
                _buildScannerOverlay(),
                
                // Flash and Close Buttons
                Positioned(
                  bottom: 60,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 30),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  bottom: 60,
                  right: 20,
                  child: IconButton(
                    icon: Icon(isFlashOn ? Icons.flash_on : Icons.flash_off, color: Colors.white, size: 30),
                    onPressed: () {
                      setState(() {
                        isFlashOn = !isFlashOn;
                        scannerController.toggleTorch();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Scanner Overlay (WhatsApp Style)
  Widget _buildScannerOverlay() {
    return Stack(
      children: [
        // Dark overlay with cutout
        Container(
          decoration: ShapeDecoration(
            shape: _ScannerOverlayShape(),
          ),
        ),

        // Animated scanning line
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            double scanY = (MediaQuery.of(context).size.height - frameSize) / 3 + (frameSize * _animationController.value);
            // if (MediaQuery.of(context).orientation == Orientation.portrait) {
            //   scanY = MediaQuery.of(context).size.height * 0.22 + (frameSize * _animationController.value);
            // } else {
            //   scanY = MediaQuery.of(context).size.height * 0.10 + (frameSize * _animationController.value);
            // }
            return Positioned(
              top: scanY,
              left: MediaQuery.of(context).size.width / 2 - 125,
              child: Container(
                width: frameSize,
                height: 3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green.withOpacity(0.7), Colors.green],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
  
}

// Custom Overlay Shape (Transparent Cutout with Rounded Borders)
class _ScannerOverlayShape extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double width = rect.width;
    double height = rect.height;
    double scanSize = 250;
    double left = (width - scanSize) / 2;
    double top = (height - scanSize) / 3;

    Path path = Path()
      ..addRect(rect) // Full screen
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(left, top, scanSize, scanSize),
        const Radius.circular(12),
      ))
      ..fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    Paint paint = Paint()..color = Colors.black.withOpacity(0.6);
    canvas.drawPath(getOuterPath(rect), paint);

    // Corner Highlights (Green edges like WhatsApp)
    Paint cornerPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    double scanSize = 250;
    double left = (rect.width - scanSize) / 2;
    double top = (rect.height - scanSize) / 3;
    double cornerLength = 30;

    Path corners = Path()
      ..moveTo(left, top + cornerLength) // Top-left vertical
      ..lineTo(left, top)
      ..lineTo(left + cornerLength, top) // Top-left horizontal

      ..moveTo(left + scanSize, top + cornerLength) // Top-right vertical
      ..lineTo(left + scanSize, top)
      ..lineTo(left + scanSize - cornerLength, top) // Top-right horizontal

      ..moveTo(left, top + scanSize - cornerLength) // Bottom-left vertical
      ..lineTo(left, top + scanSize)
      ..lineTo(left + cornerLength, top + scanSize) // Bottom-left horizontal

      ..moveTo(left + scanSize, top + scanSize - cornerLength) // Bottom-right vertical
      ..lineTo(left + scanSize, top + scanSize)
      ..lineTo(left + scanSize - cornerLength, top + scanSize); // Bottom-right horizontal

    canvas.drawPath(corners, cornerPaint);
  }

  @override
  ShapeBorder scale(double t) => this;
  
  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    throw UnimplementedError();
  }
}







// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class ScanCodeView extends StatefulWidget {
//   const ScanCodeView({super.key});

//   static const String routeName = '/scan-code';
//   @override
//   State<ScanCodeView> createState() => _ScanCodeViewState();
// }

// class _ScanCodeViewState extends State<ScanCodeView> {
//   bool isFlashOn = false;
//   MobileScannerController scannerController = MobileScannerController(

//   );

//   @override
//   Widget build(BuildContext context) {
//     // FlutterBarcodeScanner
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           // QR Scanner
//           MobileScanner(
//             controller: scannerController,
//             onDetect: (capture) {
//               final List<Barcode> barcodes = capture.barcodes;
//               if (barcodes.isNotEmpty) {
//                 final String code = barcodes.first.rawValue ?? "";
//                 Navigator.pop(context, code); // Return scanned data
//               }
//             },
//           ),

//           // Overlay UI
//           Column(
//             children: [
//               const SizedBox(height: 80),
//               const Text(
//                 "Scan QR Code",
//                 style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Expanded(child: _buildScannerFrame()),

//               // Controls
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon: Icon(isFlashOn ? Icons.flash_on : Icons.flash_off, color: Colors.white, size: 30),
//                       onPressed: () {
//                         setState(() {
//                           isFlashOn = !isFlashOn;
//                           scannerController.toggleTorch();
//                         });
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.close, color: Colors.white, size: 30),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // Scanner Frame Overlay
//   Widget _buildScannerFrame() {
//     return Stack(
//       children: [
//         Center(
//           child: Container(
//             width: frameSize,
//             height: 250,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.white, width: 2),
//               borderRadius: BorderRadius.circular(16),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


