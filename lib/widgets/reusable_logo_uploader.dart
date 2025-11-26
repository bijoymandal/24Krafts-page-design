// lib/widgets/reusable_logo_uploader.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReusableLogoUploader extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;
  final String title;
  final String hintText;
  final Function(File?)? onPicked;
  final bool isCircular;
  final File? initialImage;

  const ReusableLogoUploader({
    super.key,
    this.width = 160,
    this.height = 160,
    this.borderRadius = 20,
    this.title = "Upload Logo",
    this.hintText = "Tap to upload",
    this.onPicked,
    this.isCircular = false,
    this.initialImage,
  });

  @override
  State<ReusableLogoUploader> createState() => _ReusableLogoUploaderState();
}

class _ReusableLogoUploaderState extends State<ReusableLogoUploader> {
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _imageFile = widget.initialImage;
  }

  // FIXED: Latest ImagePicker method (2025 working)
  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image != null && mounted) {
        setState(() {
          _imageFile = File(image.path);
        });
        widget.onPicked?.call(_imageFile);
      }
    } catch (e) {
      print("Image pick error: $e");
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Failed to pick image")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasImage = _imageFile != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),

        // FULLY CLICKABLE AREA
        GestureDetector(
          onTap: _pickImage, // This now WORKS 100%
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: hasImage ? Colors.transparent : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(
                widget.isCircular ? widget.height / 2 : widget.borderRadius,
              ),
              border: Border.all(
                color: hasImage ? Colors.transparent : Colors.grey.shade300,
                width: 2,
              ),
              boxShadow: hasImage
                  ? [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                widget.isCircular ? widget.height / 2 : widget.borderRadius,
              ),
              child: hasImage
                  ? Image.file(
                      _imageFile!,
                      width: widget.width,
                      height: widget.height,
                      fit: BoxFit.cover,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          size: widget.height * 0.35,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          widget.hintText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),

        if (hasImage)
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              "Tap to change",
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
      ],
    );
  }
}
