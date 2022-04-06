//
//  DetailView.swift
//  iFilms_iOS
//
//  Created by Gary Simpson on 4/6/22.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    var selectedFilm: Film?
    var selectedFilmTitle: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text(viewModel.selectedFilm?.director ?? "")
            Text(viewModel.selectedFilm?.producer ?? "")
            Text(viewModel.selectedFilm?.release_date ?? "")
        }
        .emptyState(viewModel.selectedFilm == nil, emptyContent: {
            DefaultEmptyView.init(text: viewModel.emptyContentMessage)
        })
    }
}
