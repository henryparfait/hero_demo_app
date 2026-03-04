import 'package:flutter/material.dart';
import 'gallery_item.dart';

class DetailScreen extends StatelessWidget {
  final GalleryItem item;
  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A transparent app bar overlaid on the image
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            Hero(
              tag: item.id, 
              flightShuttleBuilder: (
                flightContext,
                animation,
                flightDirection,
                fromHeroContext,
                toHeroContext,
              ) {
                return Material(
                  color: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.lerp(
                      BorderRadius.circular(16),
                      BorderRadius.circular(0),
                      animation.value,
                    )!,
                    child: toHeroContext.widget,
                  ),
                );
              },

              transitionOnUserGestures: true,

              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      color: Color(item.color).withOpacity(0.2),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stack) {
                    return Container(
                      color: Color(item.color).withOpacity(0.3),
                      child: const Icon(Icons.broken_image, size: 64),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[700],
                          height: 1.6,
                        ),
                  ),
                  const SizedBox(height: 24),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Color(item.color).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(item.color).withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.label_outline,
                          size: 18,
                          color: Color(item.color),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Hero tag: "${item.id}"',
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 13,
                            color: Color(item.color),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}