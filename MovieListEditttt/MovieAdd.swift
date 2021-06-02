//
//  MovieAdd.swift
//  MovieListEditttt
//
//  Created by Leandro Gamarra on 5/31/21.
//

import Foundation

class MovieAdd: ObservableObject, Identifiable {
    var id = UUID()
    @Published var movieName = ""
    @Published var movieYear = ""
    @Published var movieDirector = ""
    @Published var movieLanguage = ""
    @Published var dateAdded = ""
    @Published var movieRating = ""
    @Published var homeOrTheatre = ""
    @Published var isComplete : Bool = false
    @Published var movieImage : ImagePickerView
    
    init(movieName: String, movieYear: String, movieDirector: String, movieLanguage: String, dateAdded: String, movieRating: String, homeOrTheatre: String, isComplete: Bool = false, movieImage: ImagePickerView) {
        self.movieName = movieName
        self.movieYear = movieYear
        self.movieDirector = movieDirector
        self.movieLanguage = movieLanguage
        self.dateAdded = dateAdded
        self.movieRating = movieRating
        self.homeOrTheatre = homeOrTheatre
        self.isComplete = isComplete
        self.movieImage = movieImage
    }
}
