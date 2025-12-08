import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'ascii_converter.dart';

void main() {
  runApp(const AsciiArtApp());
}

class AsciiArtApp extends StatelessWidget {
  const AsciiArtApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ASCII Art',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        fontFamily: 'monospace',
      ),
      home: const AsciiHomePage(),
    );
  }
}

class AsciiHomePage extends StatefulWidget {
  const AsciiHomePage({super.key});

  @override
  State<AsciiHomePage> createState() => _AsciiHomePageState();
}

class _AsciiHomePageState extends State<AsciiHomePage> {
  Uint8List? _imageBytes;
  String _ascii = '';
  double _charWidth = 120;
  bool _invert = false;
  bool _busy = false;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _imageBytes = result.files.single.bytes;
      });
      await _convertToAscii();
    }
  }

  Future<void> _convertToAscii() async {
    if (_imageBytes == null) return;
    setState(() => _busy = true);
    try {
      final ascii = await computeAscii(
        _imageBytes!,
        targetWidth: _charWidth.toInt(),
        invert: _invert,
      );
      if (!mounted) return;
      setState(() => _ascii = ascii);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('변환 실패: $e')));
      }
    } finally {
      setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ASCII Art Generator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.upload_file),
            tooltip: 'PC에서 이미지 업로드',
            onPressed: _pickFile,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const Text('글자 너비'),
                Expanded(
                  child: Slider(
                    value: _charWidth,
                    min: 40,
                    max: 240,
                    divisions: 200,
                    label: _charWidth.toInt().toString(),
                    onChanged: (v) => setState(() => _charWidth = v),
                    onChangeEnd: (_) => _convertToAscii(),
                  ),
                ),
                Switch(
                  value: _invert,
                  onChanged: (v) {
                    setState(() => _invert = v);
                    _convertToAscii();
                  },
                ),
                const Text('반전'),
              ],
            ),
          ),
          if (_busy) const LinearProgressIndicator(),
          const Divider(height: 1),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _imageBytes == null
                      ? Center(
                          child: Text(
                            '이미지를 업로드하세요.',
                            style: theme.textTheme.bodyMedium,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.memory(
                            _imageBytes!,
                            fit: BoxFit.contain,
                          ),
                        ),
                ),
                const VerticalDivider(width: 1),
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(12),
                      child: SelectableText(
                        _ascii.isEmpty ? 'ASCII 결과가 여기에 표시됩니다.' : _ascii,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 8,
                          height: 1.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
