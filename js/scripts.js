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
        type: 'video/x-m4v',
      }
    ],
    name: 'Lost Room Disk 1',
    thumbnail: '../videos/poster1.jpg',
    poster: '../videos/poster1.jpg'
  },
  {
    sources: [
      {
        src: '../videos/Lost_Room_Disc_2.m4v',
        type: 'video/x-m4v'
      }
    ],
    name: 'Lost Room Disk 2',
    thumbnail: '../videos/poster2.jpg',
    poster: '../videos/poster2.jpg'
  },
  {
    sources: [
      {
        src: '../videos/Lost_Room_Disc_3.m4v',
        type: 'video/x-m4v'
      }
    ],
    name: 'Lost Room Disk 3',
    thumbnail: '../videos/poster3.jpg',
    poster: '../videos/poster3.jpg'
  },
  {
    sources: [
      {
        src: '../videos/Lost_Room_Disc_1.m4v',
        type: 'video/x-m4v'
      }
    ],
    name: 'Lost Room Disk 4',
    thumbnail: '../videos/poster4.jpg',
    poster: '../videos/poster4.jpg'
  },
  {
    sources: [
      {
        src: '../videos/Lost_Room_Disc_2.m4v',
        type: 'video/x-m4v'
      }
    ],
    name: 'Lost Room Disk 5',
    thumbnail: '../videos/poster2.jpg',
    poster: '../videos/poster2.jpg'
  },
  {
    sources: [
      {
        src: '../videos/Lost_Room_Disc_3.m4v',
        type: 'video/x-m4v'
      }
    ],
    name: 'Lost Room Disk 6',
    thumbnail: '../videos/poster3.jpg',
    poster: '../videos/poster3.jpg'
  },
]);

player.ready(function() {
  console.log("...player is now ready.");
});

//    <source src="videos/Lost_Room_Disc_1.m4v" type="video/x-m4v">
