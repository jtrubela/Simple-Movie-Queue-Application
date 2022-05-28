//
//  AddCompletedMovieView.swift
//  Movies and Cheeseballs
//
//  Created by Justin Trubela on 1/15/22.
//

import SwiftUI

struct AddCompletedMovieView: View {
    @ObservedObject var watchedMovies: WatchedMovies
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""

    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Enter movie title", text: $title)
                } header: {
                    Text("New Entry")
                }
                Section{
                    List{
                        ForEach(watchedMovies.watchedTitles) { movie in
                            Text(movie.name)
                        }.onDelete(perform: deleteCompletedMovie)
                    }
                } header: {
                    Text("Movies watched")
                }
            }
            .navigationTitle("Completed Movies")
            .toolbar {
                Button("Save") {
                    let title = MovieItem(name: title)
                    watchedMovies.watchedTitles.append(title)
                    dismiss()
                }
            }
        }
    }
    
    func deleteCompletedMovie(at offsets: IndexSet) {
        watchedMovies.watchedTitles.remove(atOffsets: offsets)
    }
}

struct AddCompletedMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddCompletedMovieView(watchedMovies: WatchedMovies())
    }
}
