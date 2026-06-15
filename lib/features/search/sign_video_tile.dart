import 'package:flutter/material.dart';

import '../../models/sign_video.dart';

class SignVideoTile extends StatelessWidget {
  const SignVideoTile({
    required this.video,
    super.key,
  });

  final SignVideo video;

  @override
  Widget build(BuildContext context) {
    final hasUploadedVideo = video.videoUrl.trim().isNotEmpty;

    return Card(
      margin: const EdgeInsets.only(top: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    hasUploadedVideo
                        ? Icons.video_file_rounded
                        : Icons.play_circle_fill_rounded,
                    size: 56,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hasUploadedVideo
                        ? 'Uploaded video selected'
                        : 'Demo video placeholder',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              video.word,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text('Country: ${video.country}'),
            Text('Region: ${video.region}'),
            Text('Language: ${video.language}'),
            Text('Uploader: ${video.uploader}'),
            if (hasUploadedVideo) ...[
              const SizedBox(height: 8),
              Text(
                'Video file: ${_fileNameFromPath(video.videoUrl)}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }

  static String _fileNameFromPath(String path) {
    return path.replaceAll('\\', '/').split('/').last;
  }
}