//
//  MasterView.swift
//  iFilms_iOS
//
//  Created by Gary Simpson on 4/6/22.
//

import SwiftUI

///The Application View. Consists of a navTitle, fetchButton, and filmList.
struct MasterView: View {
    @ObservedObject var viewModel: MasterViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.films) { film in
                NavigationLink(destination: DetailView( viewModel: DetailViewModel(film))
                                .navigationTitle(viewModel.selectedTitle(film))) {
                    FilmRowView(title: film.title, episodeId: film.episode_id)
                }
                .navigationTitle(viewModel.navTitle)
            }
        }
        .emptyState(viewModel.showLoadingMessage, emptyContent: {
            DefaultEmptyView.init(text: viewModel.loadingMessage())
        })
        .navigationBarItems(trailing: Button(action: {
            viewModel.fetchFilms()
        }, label: {
            Text(viewModel.fetchButtonTitle)
        }))
    }
}
