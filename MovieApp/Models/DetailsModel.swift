//
//  DetalisViewModel.swift
//  MovieApp
//
//  Created by Mustafa Kemal Gökçe on 19.07.2021.
//

import Foundation


struct DetailsMovie: Codable {
    
    let title: String
    let year: String
    let genre: String
    let director: String
    let writer: String
    let actors: String
    let plot: String
    let awards: String
    let poster: String
    let metaScore: String
    let imdbRating: String
    let imdbId: String
    
    private enum CodingKeys: String, CodingKey{
        case title = "Title"
        case year = "Year"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case awards = "Awards"
        case poster = "Poster"
        case metaScore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbId = "imdbID"
    }
}
