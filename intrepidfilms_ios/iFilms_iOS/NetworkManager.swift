//
//  NetworkManager.swift
//  iFilms_iOS
//
//  Created by Gary Simpson on 4/6/22.
//

import Foundation

class NetworkManager: ObservableObject {
    let apiUrl = "https://swapi.dev/api/films/"
    @Published var loadingMessage: String = "No Messages Loaded"
    @Published var showLoadingMessage: Bool = true
    @Published var isLoading: Bool = false
    @Published var films = [Film]()
    @Published var selectedFilm: Film?
    
    init() {
        
    }
    
    func fetchFilms() {
        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { [self] (data, _, _) in
            guard let data = data else { return }
            let results = try! JSONDecoder().decode(FilmsResult.self, from: data)
            
            DispatchQueue.main.async {
                self.loadingMessage = self.films.isEmpty ? "No Films Loaded" : ""
                self.films = results.results.sorted(by: {$0.episode_id < $1.episode_id})
                self.isLoading = false
            }
        }.resume()
    }
   
    func fetchFilms( completion: @escaping (_ films: [Film]) -> Void) {
        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let results = try! JSONDecoder().decode(FilmsResult.self, from: data)
            
            completion(results.results.sorted(by: {$0.episode_id < $1.episode_id}))
            
//        completion: results.results.sorted(by: {$0.episode_id < $1.episode_id})
//            DispatchQueue.main.async do {
//                self.loadingMessage = self.films.isEmpty ? "No Films Loaded" : ""
//                self.films = results.results.sorted(by: {$0.episode_id < $1.episode_id})
//                self.isLoading = false
//            }
        }.resume()
    }
}
