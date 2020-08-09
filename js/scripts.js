console.log("About to apply options to player...");
var player = videojs('main-player', {
  controls: true,
  autoplay: false,
  preload: 'auto',
  poster: '/assets/fishing.jpg',
  width: 1024,
  fluid: true,
});

player.playlistUi();

player.playlist([
  {
    sources: [
      {
        src: '../videos/video1.mp4',
        type: 'video/mp4',
      }
    ],
    name: 'Sample Video 1',
    thumbnail: '../videos/poster2.jpg',
    poster: '../videos/poster2.jpg'
  },
  {
    sources: [
      {
        src: '../videos/video1.mp4',
        type: 'video/mp4'
      }
    ],
    name: 'Sample Video 2',
    thumbnail: '../videos/poster1.jpg',
    poster: '../videos/poster1.jpg'
  },
  {
    sources: [
      {
        src: '../videos/video1.mp4',
        type: 'video/mp4'
      }
    ],
    name: 'Sample Video 3',
    thumbnail: '../videos/poster3.jpg',
    poster: '../videos/poster3.jpg'
  },
  {
    sources: [
      {
        src: '../videos/video1.mp4',
        type: 'video/mp4'
      }
    ],
    name: 'Sample Video 4',
    thumbnail: '../videos/poster4.jpg',
    poster: '../videos/poster4.jpg'
  },
  {
    sources: [
      {
        src: '../videos/video1.mp4',
        type: 'video/mp4'
      }
    ],
    name: 'Sample Video 5',
    thumbnail: '../videos/poster2.jpg',
    poster: '../videos/poster2.jpg'
  },
  {
    sources: [
      {
        src: '../videos/video1.mp4',
        type: 'video/mp4'
      }
    ],
    name: 'Sample Video 6',
    thumbnail: '../videos/poster3.jpg',
    poster: '../videos/poster3.jpg'
  },
]);

player.ready(function() {
  console.log("...player is now ready.");
});

