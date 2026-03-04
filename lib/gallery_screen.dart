import 'package:flutter/material.dart';
import 'gallery_item.dart';
import 'detail_screen.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: sampleGallery.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,       // Two columns
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final item = sampleGallery[index];
            return _GalleryCard(item: item);
          },
        ),
      ),
    );
  }
}

/// A  gallery card with a Hero-wrapped image.
class _GalleryCard extends StatelessWidget {
  final GalleryItem item;
  const _GalleryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the detail page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(item: item),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            Expanded(
              child: Hero(
                // ── Property 1: tag (MUST match destination) ──
                tag: item.id,

                // ── Property 2: flightShuttleBuilder ──────
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
                        BorderRadius.circular(16),  // card shape
                        BorderRadius.circular(0),   // full-width shape
                        animation.value,
                      )!,
                      child: toHeroContext.widget,
                    ),
                  );
                },

                transitionOnUserGestures: true,

                child: Container(
                  color: Color(item.color).withOpacity(0.2),
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                    // Show a coloured placeholder while loading
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: progress.expectedTotalBytes != null
                              ? progress.cumulativeBytesLoaded /
                                  progress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stack) {
                      return Container(
                        color: Color(item.color).withOpacity(0.3),
                        child: const Icon(Icons.image, size: 48),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                item.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}