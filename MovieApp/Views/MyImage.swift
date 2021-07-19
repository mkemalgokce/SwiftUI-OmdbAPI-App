//
//  MyImage.swift
//  MovieApp
//
//  Created by Mustafa Kemal Gökçe on 19.07.2021.
//

import SwiftUI

struct MyImage: View {
    let url: String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String) {
        self.url = url
        self.imageDownloaderClient.downloadImage(url: self.url)
        
    }
    var body: some View {
        if let data = self.imageDownloaderClient.downloadedImage{
            Image(uiImage: UIImage(data: data)!)
                .resizable()
        }else{
            Image("placeholder")
                .resizable()
        }
    }
}

struct MyImage_Previews: PreviewProvider {
    static var previews: some View {
        MyImage(url: "https://m.media-amazon.com/images/M/MV5BMjMxNDU5MTk1MV5BMl5BanBnXkFtZTgwMDk5NDUyMTE@._V1_SX300.jpg")
    }
}
