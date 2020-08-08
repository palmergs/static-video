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
        src: '../videos/Lost_Room_Disc_1.m4v',
        type: 'video/x-m4v'
      }
    ],
    poster: '../videos/poster1.jpg'
  },
  {
    sources: [
      {
        src: '../videos/Lost_Room_Disc_2.m4v',
        type: 'video/x-m4v'
      }
    ],
    poster: '../videos/poster2.jpg'
  },
  {
    sources: [
      {
        src: '../videos/Lost_Room_Disc_3.m4v',
        type: 'video/x-m4v'
      }
    ],
    poster: '../videos/poster3.jpg'
  },
]);

player.ready(function() {
  console.log("...player is now ready.");
});

//    <source src="videos/Lost_Room_Disc_1.m4v" type="video/x-m4v">
