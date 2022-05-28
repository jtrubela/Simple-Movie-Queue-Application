//
//  ContentView.swift
//  Movies and Cheeseballs
//
//  Created by Justin Trubela on 1/14/22.
//

import SwiftUI

struct ContentView: View {
    let cheesyEmojiLine = "Movies to Watch 🧀"
    
    @StateObject var newMovies = Movies()
    @StateObject var completedMovies = WatchedMovies()
    @State private var addMovieViewIsShowing = false
    @State private var addCompletedMovieView = false

    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Section {
                        List{
                            ForEach(newMovies.titles){ title in
                                Text(title.name)
                                    .font(.headline)
                            }
//                            .swipeActions {
//                                Button {
//                                    completedMovies.watchedTitles.append(?)
//                                } label: {
//                                    Text("Completed")
//                                }
//                                .tint(.blue)
////                                Button {
////
////                                } label: {
////                                    Text("Delete")
////                                }
//                            }
                            .onDelete(perform: removeMovie)
                        }
                        .listStyle(.sidebar)
                    }
                }
            }
            .navigationTitle(cheesyEmojiLine)
            .toolbar {
                HStack(spacing: 150){
                    Button {
                        addCompletedMovieView = true
                    } label: {
                        Text("Completed Movies")
                    }
                    .padding()
                    Button{
                        addMovieViewIsShowing = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                }
            }
        }
        .sheet(isPresented: $addMovieViewIsShowing){
            AddAMovieView(moviesToWatch: newMovies, watchedMovies: completedMovies)
        }
        .sheet(isPresented: $addCompletedMovieView){
            AddCompletedMovieView(watchedMovies: completedMovies)
        }
    }
    func removeMovie(at offsets: IndexSet){
        newMovies.titles.remove(atOffsets: offsets)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
