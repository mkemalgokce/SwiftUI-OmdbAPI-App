//
//  SwiftUIView.swift
//  MovieApp
//
//  Created by Mustafa Kemal Gökçe on 15.07.2021.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieListViewModel: MovieListViewModel
    @State var searchText = ""
    init() {
        self.movieListViewModel = MovieListViewModel()
            
    }
    var body: some View {
        NavigationView{
            VStack{
                TextField("Search", text: $searchText) { _ in
                    
                } onCommit: {
                    self.movieListViewModel.searchMovie(search: searchText.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchText)
                }.padding().textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(movieListViewModel.movies, id:\.imdbId){ film in
                    NavigationLink(
                        destination: DetailsView(imdbId: film.imdbId)){
                        HStack{
                            MyImage(url: film.poster)
                                .frame(width: 100, height: 150, alignment: .center)
                            VStack(alignment: .leading){
                                Text(film.title)
                                    .font(.title)
                                    .foregroundColor(.blue)
                                Text(film.year)
                                
                                
                            }
                            Spacer()
                        }
                    }
                    
                }.navigationTitle("Movie List")
                
            }
        }
    }

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
}
