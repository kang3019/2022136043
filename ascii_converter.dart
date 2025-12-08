import 'dart:typed_data';
import 'package:image/image.dart';

/// 이미지 바이트를 받아 ASCII 아트 문자열로 변환
Future<String> computeAscii(
  Uint8List bytes, {
  required int targetWidth,
  bool invert = false,
}) async {
  final img.Image? src = img.decodeImage(bytes);
  if (src == null) throw Exception('이미지 디코딩 실패');

  // 문자 팔레트 (밝기 낮음 → 진한 문자)
  final List<String> ramp = ['@', '%', '#', '*', '+', '=', '-', ':', '.', ' '];
  final List<String> mappedRamp = invert ? ramp.reversed.toList() : ramp;

  // 폰트 종횡비 보정
  const double fontAspect = 0.55;
  final double scale = targetWidth / src.width;
  final int targetHeight = (src.height * scale * fontAspect).toInt();

  final img.Image resized = img.copyResize(
    src,
    width: targetWidth,
    height: targetHeight,
    interpolation: img.Interpolation.cubic,
  );

  final buffer = StringBuffer();
  for (int y = 0; y < resized.height; y++) {
    for (int x = 0; x < resized.width; x++) {
      final dynamic pixel = resized.getPixel(x, y);
      int r = 0, g = 0, b = 0;
      if (pixel is int) {
        final int p = pixel;
        r = (p >> 16) & 0xFF;
        g = (p >> 8) & 0xFF;
        b = p & 0xFF;
      } else {
        try {
          r = pixel.r as int;
          g = pixel.g as int;
          b = pixel.b as int;
        } catch (_) {
          // 최후의 폴백: 이미 int로 변환 불가하면 0으로 처리
          r = 0;
          g = 0;
          b = 0;
        }
      }
      final lum = 0.299 * r + 0.587 * g + 0.114 * b;
      final idx = ((lum / 255) * (mappedRamp.length - 1)).round();
      buffer.write(mappedRamp[idx]);
    }
    buffer.writeln();
  }
  return buffer.toString();
}
