//
//  TvShow.swift
//  Binge Calculator
//
//  Created by Rebecca Overare on 4/30/20.
//  Copyright © 2020 Rebecca Overare. All rights reserved.
//

import Foundation

struct TvShow: Decodable {
    var tvShow: TvShowEpisodeDetails
}
struct TvShowEpisodeDetails: Decodable {
    var episodes: [TvShowEpisode]
}

struct TvShowEpisode: Decodable {
    var season: Int
    var episode: Int
}


