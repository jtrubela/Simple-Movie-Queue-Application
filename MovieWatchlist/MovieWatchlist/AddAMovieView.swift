//
//  AddAMovieView.swift
//  Movies and Cheeseballs
//
//  Created by Justin Trubela on 1/15/22.
//

import SwiftUI

struct AddAMovieView: View {
    @ObservedObject var moviesToWatch: Movies
    @ObservedObject var watchedMovies: WatchedMovies
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""

    var body: some View {
        NavigationView {
            Form {
                Section{
                TextField("Enter a movie title", text: $title)
                } header: {
                    Text("New Entry")
                }
            }
            .navigationTitle("Add new movie")
            .toolbar {
                Button("Save") {
                    let title = MovieItem(name: title)
                    moviesToWatch.titles.append(title)
                    dismiss()
                }
            }
        }
    }
}

struct AddAMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddAMovieView(moviesToWatch: Movies(), watchedMovies: WatchedMovies())
    }
}
