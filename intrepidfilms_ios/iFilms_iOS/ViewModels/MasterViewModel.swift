//
//  MasterViewModel.swift
//  iFilms_iOS
//
//  Created by Gary Simpson on 4/6/22.
//

import SwiftUI

///The main viewModel. Init with a **NetworkManager** which is later used in *fetchFilms()*.
///- NOTE: Conforms to ObservableObject to allow for dynamic view updating.
class MasterViewModel: ObservableObject {
    var networkManager: NetworkManager
    let navTitle = "Films"
    let fetchButtonTitle = "Fetch Films"
    
    @Published var films: [Film] = [Film]()
    @Published var emptyStateMessage: String = "No Films Loaded"
    @Published var isLoading: Bool = false
    @Published var showLoadingMessage: Bool = true
    @Published var selectedFilm: Film?
    


    init(_ networkManager: NetworkManager) {
        self.networkManager = NetworkManager()
    }
    
    func fetchFilms() {
        self.networkManager.fetchFilms(completion: { films in
            DispatchQueue.main.async {
                self.isLoading = true
                self.showLoadingMessage = true
                self.emptyStateMessage = self.films.isEmpty ? "No Films Loaded" : ""
                self.films = films
                self.isLoading = false
                self.showLoadingMessage = false
            }
        })
    }

    func loadingMessage() -> String {
        return self.emptyStateMessage
    }
    
    func selectFilm(_ film: Film){
        self.selectedFilm = film
    }
    
    func selectedTitle(_ film: Film) -> String {
        return "Episode \(film.episode_id): " + film.title
    }
}
