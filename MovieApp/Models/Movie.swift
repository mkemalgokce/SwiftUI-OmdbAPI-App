//
//  File.swift
//  MovieApp
//
//  Created by Mustafa Kemal Gökçe on 15.07.2021.
//

import Foundation

struct Movie: Codable, Identifiable{
    
    var id = UUID()
    var title: String
    var year: String
    var imdbId: String
    var type: String
    var poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
            
    }
    
}

struct SearchingMovies: Codable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}
