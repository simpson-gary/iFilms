//
//  Film.swift
//  iFilms_iOS
//
//  Created by Gary Simpson on 4/6/22.
//

import Foundation

struct Film: Decodable, Hashable, Identifiable {
    let id: UUID = UUID()
    let title, opening_crawl, director, producer, release_date, url, created, edited: String
    let episode_id: Int
}

struct FilmsResult: Decodable {
    let count: Int
    let results: [Film]
}
