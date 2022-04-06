//
//  DetailViewModel.swift
//  iFilms_iOS
//
//  Created by Gary Simpson on 4/6/22.
//

import SwiftUI

class DetailViewModel: ObservableObject {
    var selectedFilm: Film?
    let emptyContentMessage: String = "No Film Selected"

    init(_ selectedFilm: Film?) {
        guard let selectedFilm = selectedFilm else {
            return
        }

        self.selectedFilm = selectedFilm
    }
}
