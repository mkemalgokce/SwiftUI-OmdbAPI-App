//
//  DetailsView.swift
//  MovieApp
//
//  Created by Mustafa Kemal Gökçe on 19.07.2021.
//

import SwiftUI

struct DetailsView: View {
    let imdbId: String
    
    @ObservedObject var detailsViewModel = DetailsViewModel()
    var body: some View {
        VStack{
            MyImage(url: detailsViewModel.movieDetails?.poster ?? "")
                .frame(width: 200, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
            Text(detailsViewModel.movieDetails?.title ?? "Movie Title")
                .font(.largeTitle)
                .padding()
            Text(detailsViewModel.movieDetails?.year ?? "Movie Year")
                .padding()
                .font(.title)
                .foregroundColor(.blue)
            Text(detailsViewModel.movieDetails?.plot ?? "Plot")
            Text("Actors: \(detailsViewModel.movieDetails?.actors ?? "-")").padding()
            Text("Director: \(detailsViewModel.movieDetails?.director ?? "-")").padding()
            
            Spacer()
        }.onAppear(perform: {
            self.detailsViewModel.getDetails(imdbId: imdbId)
        })
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(imdbId: "test")
    }
}
