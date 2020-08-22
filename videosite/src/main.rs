extern crate clap;
use clap::{App, Arg};
use std::fmt;
use rust_embed::RustEmbed;

#[derive(RustEmbed)]
#[folder = "resources/"]
struct Asset;

const VERSION: &'static str = env!("CARGO_PKG_VERSION");

fn main() {
    let matches = App::new("videosite")
        .version(VERSION)
        .about("Builds a static site suitable for delivery on flash drive from a file folder.")
        .author("Galen P.")
        .arg(Arg::with_name("dir")
            .short("d")
            .long("dir")
            .value_name("DIR")
            .help("Select the folder / directory containing the files to be copied")
            .takes_value(true))
        .get_matches();

    let dir = match matches.value_of("dir") {
        Some(s) => s.to_owned(),
        None => {
            println!("Please select the directory to build from.");
            std::process::exit(1)
        }
    };
}

#[derive(Debug, Clone)]
pub struct Manifest {
    title: String,
    subtitle: String,
    background: String,
    videos: Vec<String>,
    stills: Vec<String>,
}

pub struct Playlist {
    videos: Vec<VideoEntry>,
}

impl fmt::Display for Playlist {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "[")?;
        for ve in self.videos {
            write!(f, "{},", ve);
        }
        write!(f, "]")
    }
}

pub struct VideoEntry {
    source: String,
    mime: String,
    name: String,
    thumbnail: String,
    poster: String
}

impl fmt::Display for VideoEntry {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f,
            "{{sources:[{{src:\"{}\",type:\"{}\"}}],name:\"{}\",thumbnail:\"{}\",poster:\"{}\"}}",
            self.source,
            self.mime,
            self.name,
            self.thumbnail,
            self.poster)
    }
}



impl Manifest {
    pub fn from_file(_dir: &str) -> Manifest {
        return Manifest {
            title: "Example Title".to_owned(),
            subtitle: "Example Subtitle".to_owned(),
            background: "background.jpg".to_owned(),
            videos: Vec::new(),
            stills: Vec::new(),
        }
    }
}
