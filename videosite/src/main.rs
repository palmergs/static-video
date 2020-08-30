extern crate yaml_rust;
use yaml_rust::{YamlLoader};

extern crate clap;
use clap::{App, Arg};

use std::fmt;
use std::fs;
use std::fs::File;
use std::path;
use std::io::prelude::*;
use std::io::BufWriter;
use std::collections::HashMap;

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
        .arg(Arg::with_name("path")
            .short("p")
            .long("path")
            .help("Path to the directory to build the site")
            .takes_value(true))
        .arg(Arg::with_name("manifest")
            .short("m")
            .long("manifest")
            .help("Path to the text file containing the project details")
            .takes_value(true))
        .arg(Arg::with_name("background")
            .short("b")
            .long("background")
            .help("Path to the image file that should be used as the backgroud; optional and ignored if Background_Image is defined in the manifest file")
            .takes_value(true))
        .arg(Arg::with_name("videos")
            .short("v")
            .long("videos")
            .help("Select the folder / directory containing the video files and thumbnails to be copied")
            .takes_value(true))
        .get_matches();

    let dist_dir = match matches.value_of("path") {
        Some(s) => s,
        None => "../dist",
    };

    let videos_dir = match matches.value_of("videos") {
        Some(s) => s,
        None => "/home/galen/Projects/static-video/structure/Videos",
    };

    let mut manifest = Manifest::new();
    let details = Manifest::details("/home/galen/Projects/static-video/structure/project.txt");
    println!("Loaded details:\n{:?}", details);

    match doit(dist_dir) {
        Ok(_) => println!("Done!"),
        Err(err) => println!("WTF? {:?}", err),
    }
}

fn doit(dist_dir: &str) -> std::io::Result<()> {
    println!("Removing old distribution: {}", dist_dir);
    fs::remove_dir_all(dist_dir)?;

    // copy all static resources
    for f in Asset::iter() {
        let resource = &f.to_owned();
        match Asset::get(resource) {
            Some(cow) => {
                let write_to = format!("{}/{}", dist_dir, resource);
                println!("Copying to: {}", &write_to);

                let parent = path::Path::new(&write_to).parent().unwrap();
                println!("Creating directory: {}", parent.display());
                assert!(fs::create_dir_all(parent).is_ok());

                println!("Writing to: {}", &write_to);
                let mut buffer = BufWriter::new(File::create(&write_to)?);
                buffer.write_all(&cow)?;
                buffer.flush()?;
            },
            None => (),
        }
    }

    // read the video directory to build a playlist
    // read the manifest
    // write videos to destination
    // write script.js
    // write style.css
    // write index.html

    Ok(())
}

#[derive(Debug, Clone)]
pub struct Manifest {
    title: String,
    subtitle: String,
    background: String,
    videos: Playlist,
    stills: Vec<String>,
}

#[derive(Debug, Clone)]
pub struct Playlist {
    videos: Vec<VideoEntry>,
}

impl fmt::Display for Playlist {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "[")?;
        for ve in &self.videos {
            write!(f, "{},", ve)?;
        }
        write!(f, "]")
    }
}

#[derive(Debug, Clone)]
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

const QUOTE: &'static str = "\"";

impl Manifest {
    pub fn new() -> Manifest {
        return Manifest {
            title: "Example Title".to_owned(),
            subtitle: "Example Subtitle".to_owned(),
            background: "background.jpg".to_owned(),
            videos: Playlist { videos: Vec::new() },
            stills: Vec::new(),
        }
    }

    pub fn details(path: &str) -> HashMap<String, String> {
        let contents = fs::read_to_string(path)
            .expect("Unable to read the manifest file");
        println!("Manifest:\n{}", contents);

        let mut h = HashMap::new();
        let lines = contents.split("\n");
        for line in lines.into_iter() {
            if line.len() > 0 {
                let pair = line.split(":").collect::<Vec<&str>>();
                if pair.len() == 2 {
                    let key = pair[0].trim().to_string();
                    let mut val = pair[1].trim().to_string();
                    if val.ends_with(QUOTE) {
                        val.truncate(val.len() - 1);
                    }
                    if val.starts_with(QUOTE) {
                        val = (&val[1..]).to_string();
                    }
                    h.insert(key, val);
                }
            }
        }

        h
    }
}

