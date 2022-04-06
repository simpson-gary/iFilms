//
//  FilmRowView.swift
//  iFilms_iOS
//
//  Created by Gary Simpson on 4/6/22.
//

import SwiftUI

struct FilmRowView: View {
    let film: Film
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text(film.title)
            Text("\(film.episode_id)")
        }
    }
}
