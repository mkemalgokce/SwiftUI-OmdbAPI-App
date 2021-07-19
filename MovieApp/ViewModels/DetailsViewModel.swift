//
//  DetailsViewModel.swift
//  MovieApp
//
//  Created by Mustafa Kemal Gökçe on 19.07.2021.
//

import Foundation


class DetailsViewModel: ObservableObject {
    @Published var movieDetails : DetailsMovie?
    
    let downloaderClient = DownloaderClient()
    
    func getDetails(imdbId: String){
        downloaderClient.downloadMovie(imdbId: imdbId) { sonuc in
            switch sonuc {
                case .failure(let hata):
                    print(hata)
                case.success(let details):
                    DispatchQueue.main.async {
                        self.movieDetails = details
                    }
                    
            }
        }
    }
}
