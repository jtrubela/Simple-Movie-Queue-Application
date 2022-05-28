//
//  MoviesObject.swift
//  Movies and Cheeseballs
//
//  Created by Justin Trubela on 1/15/22.
//

import Foundation

class Movies: ObservableObject {
    @Published var titles = [MovieItem]() {
        
        didSet {
            
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(titles) {
                UserDefaults.standard.set(encoded, forKey: "Movies")
            }
            
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Movies") {
            if let decodedItems = try? JSONDecoder().decode([MovieItem].self, from: savedItems) {
                self.titles = decodedItems
                return
            }
        }
        
        self.titles = []
    }
}

class WatchedMovies: ObservableObject {
    @Published var watchedTitles = [MovieItem](){
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(watchedTitles) {
                UserDefaults.standard.set(encoded, forKey: "WatchedMovies")
            }
        }
    }
    
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "WatchedMovies") {
            if let decodedItems = try? JSONDecoder().decode([MovieItem].self, from: savedItems) {
                self.watchedTitles = decodedItems
                return
            }
        }
        
        self.watchedTitles = []
    }
}

