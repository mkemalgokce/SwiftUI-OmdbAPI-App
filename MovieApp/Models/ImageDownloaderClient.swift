//
//  ImageDownloaderClient.swift
//  MovieApp
//
//  Created by Mustafa Kemal Gökçe on 19.07.2021.
//

import Foundation


class ImageDownloaderClient: ObservableObject{
    
    @Published var downloadedImage: Data?
    
    func downloadImage(url: String){
        guard let imageUrl = URL(string: url) else{
            return
        }
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            if error != nil {
                return
            }else{
                DispatchQueue.main.async {
                    self.downloadedImage = data

                }
            }
        }.resume()
    }
}
