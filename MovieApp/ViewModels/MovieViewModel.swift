//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Mustafa Kemal Gökçe on 19.07.2021.
//

import Foundation


class MovieListViewModel: ObservableObject {
    
    @Published var movies = [Movie]()
    
    let downloaderClient = DownloaderClient()
    
    func searchMovie(search: String){
        downloaderClient.downloadMovies(search: search) { sonuc in
            switch sonuc {
                case .failure(let hata):
                    print(hata)
                case .success(let filmDizisi):
                    if let filmDizisi = filmDizisi{
                        DispatchQueue.main.async {
                            self.movies = filmDizisi
                        }
                        
                }
            }
        }
    }
}
