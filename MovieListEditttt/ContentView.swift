//
//  ContentView.swift
//  MovieListEditttt
//
//  Created by Leandro Gamarra on 5/31/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var movieAdd: [MovieAdd] = []
    
    @State private var newMovieName: String = ""
    @State private var newMovieYear: String = ""
    @State private var newMovieDirector: String = ""
    @State private var newMovieLanguage: String = ""
    @State private var newDateAdded: String = ""
    @State private var newMovieRating: String = ""
    @State private var newHomeOrTheatre: String = ""
    @State private var showNewMovie = false
    
    @State private var newMovieImage : ImagePickerView
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Movies Watched Ratings")
                        .font(.system(size: 40, weight: .black, design: .rounded
                        ))
                    
                    Spacer()
                    
                    Button(action: {
                        self.showNewMovie = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.yellow)
                    }
                    
                }
                .padding()
                
                List{
                    ForEach(movieAdd) {movie in
                        movieRow(movieAdd: movie)
                    }
                }
            }
            .rotation3DEffect(Angle(degrees: showNewMovie ? 5 : 0), axis: (x: 1, y: 0, z: 0))
            .offset(y: showNewMovie ? -50 : 0)
            .animation(.easeOut)
            
            if movieAdd.count == 0 {
                NoDataView()
            }
            
            if showNewMovie {
                BlankView(bGColor: .black)
                    .opacity(0.5)
                    .onTapGesture {
                        self.showNewMovie = false
                    }
                NewMovieView(isShow: $showNewMovie, addMovie: $movieAdd, newMovieName: newMovieName)
                    .transition(.move(edge: .bottom))
                    .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct movieRow: View {
    
    @ObservedObject var movieAdd : MovieAdd
    
    var body: some View {
            VStack {
                
                //d
                Image(movieAdd.movieImage)
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Text(movieAdd.movieName)
            
                Text(movieAdd.movieYear)
            
                Text(movieAdd.movieDirector)
            
                Text(movieAdd.homeOrTheatre)
            
                Text(movieAdd.movieLanguage)
            
                Text(movieAdd.movieRating)
            
                Text(movieAdd.dateAdded)
            }
    }
}

struct NoDataView: View {
    var body: some View {
        Image(systemName: "trash")
            .resizable()
            .scaledToFit()
    }
}

struct BlankView: View {
    var bGColor: Color
    
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(bGColor)
        .edgesIgnoringSafeArea(.all)
    }
}
