/// A simple model representing one gallery photo.
///
/// Each item carries a unique [id] that will be used as the Hero [tag],
/// a network image [url], a [title], and a short [description].
class GalleryItem {
  final String id;        // Used as the Hero tag
  final String imageUrl;  // Network image URL
  final String title;
  final String description;
  final int color;        // Fallback colour (ARGB int)

  const GalleryItem({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.color,
  });
}

/// Sample data – royalty-free placeholder images from picsum.photos
final List<GalleryItem> sampleGallery = [
  GalleryItem(
    id: 'photo_mountains',
    imageUrl: 'https://picsum.photos/id/29/800/600',
    title: 'Mountain Sunrise',
    description:
        'A breathtaking view of the mountain range at dawn. '
        'Golden light spills across the peaks while mist fills the valleys below.',
    color: 0xFF5C6BC0,
  ),
  GalleryItem(
    id: 'photo_ocean',
    imageUrl: 'https://picsum.photos/id/16/800/600',
    title: 'Ocean Waves',
    description:
        'Turquoise waves crash against rocky cliffs along the coastline. '
        'The salty breeze and rhythmic tides create a calming atmosphere.',
    color: 0xFF26A69A,
  ),
  GalleryItem(
    id: 'photo_forest',
    imageUrl: 'https://picsum.photos/id/15/800/600',
    title: 'Forest Trail',
    description:
        'A winding trail disappears into a lush green forest. '
        'Sunlight filters through the canopy, dappling the path with light.',
    color: 0xFF66BB6A,
  ),
  GalleryItem(
    id: 'photo_city',
    imageUrl: 'https://picsum.photos/id/26/800/600',
    title: 'City Skyline',
    description:
        'The city skyline glows against a dusky purple sky. '
        'Skyscrapers reflect the last light of the setting sun.',
    color: 0xFFEF5350,
  ),
  GalleryItem(
    id: 'photo_desert',
    imageUrl: 'https://picsum.photos/id/33/800/600',
    title: 'Desert Dunes',
    description:
        'Endless sand dunes stretch toward the horizon under a blazing sun. '
        'Wind sculpts elegant curves into the golden landscape.',
    color: 0xFFFFA726,
  ),
  GalleryItem(
    id: 'photo_lake',
    imageUrl: 'https://picsum.photos/id/39/800/600',
    title: 'Calm Lake',
    description:
        'A perfectly still lake mirrors the surrounding snow-capped peaks. '
        'The silence is broken only by the occasional call of a loon.',
    color: 0xFF42A5F5,
  ),
];