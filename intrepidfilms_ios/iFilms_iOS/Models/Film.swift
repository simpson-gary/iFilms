//
//  Film.swift
//  iFilms_iOS
//
//  Created by Gary Simpson on 4/6/22.
//

import Foundation

/**
Main application object. Confroms to Decodable for json decoding, and Identifiable for use in List object.
- Important: id currently displays a #warning *will not be decoded because it is declared with an initial value*. The suggested fix causes other un-recoverable errors so it has been left as is for now.
 */
struct Film: Decodable, Identifiable {
    let id: UUID = UUID()
    let title, opening_crawl, director, producer, release_date, url, created, edited: String
    let episode_id: Int
}

///The original object returned from the api films.
struct FilmsResult: Decodable {
    let count: Int
    let results: [Film]
}
