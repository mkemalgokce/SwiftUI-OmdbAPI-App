//
//  GetData.swift
//  MovieApp
//
//  Created by Mustafa Kemal Gökçe on 15.07.2021.
//

import Foundation

class DownloaderClient {
    
    func downloadMovies(search: String, completion: @escaping(Result<[Movie]?,DownloaderError>) -> Void){
        
        guard let url = URL(string: "http://www.omdbapi.com/?s=\(search)&apikey=3b2e3498") else{
            return completion(.failure(.wrongUrl))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                return completion(.failure(.downloadProblem))
            }
            
            guard let movieAnswers = try? JSONDecoder().decode(SearchingMovies.self, from: data!) else{
                return completion(.failure(.otherError))
            }
            
            return completion(.success(movieAnswers.movies))
        }.resume()
    }
    
    func downloadMovie(imdbId: String, completion: @escaping(Result<DetailsMovie, DownloaderError>) -> Void){
        guard let url = URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=3b2e3498") else{
            return completion(.failure(.wrongUrl))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil || data == nil {
                return completion(.failure(.downloadProblem))
            }
            
            guard let movieAnswer = try? JSONDecoder().decode(DetailsMovie.self, from: data!) else{
                return completion(.failure(.otherError))
            }
            return completion(.success(movieAnswer))
            
        }.resume()
    }
}

enum DownloaderError: Error {
    case wrongUrl
    case downloadProblem
    case otherError
}
