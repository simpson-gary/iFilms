//
//  NetworkManager.swift
//  iFilms_iOS
//
//  Created by Gary Simpson on 4/6/22.
//

import Foundation

class NetworkManager {
    let apiUrl = "https://swapi.dev/api/films/"
   
    func fetchFilms( completion: @escaping (_ films: [Film]) -> Void) {
        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let results = try! JSONDecoder().decode(FilmsResult.self, from: data)
            
            completion(results.results.sorted(by: {$0.episode_id < $1.episode_id}))
        }.resume()
    }
}
