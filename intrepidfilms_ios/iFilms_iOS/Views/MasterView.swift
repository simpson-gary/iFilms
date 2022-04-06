//
//  MasterView.swift
//  iFilms_iOS
//
//  Created by Gary Simpson on 4/6/22.
//

import SwiftUI

struct MasterView: View {
    @ObservedObject var viewModel: MasterViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.films) { film in
                NavigationLink(destination: DetailView( viewModel: DetailViewModel(film))
                                .navigationTitle(viewModel.selectedTitle(film))) {
                    FilmRowView(film: film)
                }
                .navigationTitle("Films")
            }
        }
        .emptyState(viewModel.showLoadingMessage, emptyContent: {
            DefaultEmptyView.init(text: viewModel.loadingMessage())
        })
        .navigationBarItems(trailing: Button(action: {
            viewModel.fetchFilms()
        }, label: {
            Text("Fetch Films")
        }))
    }
}
