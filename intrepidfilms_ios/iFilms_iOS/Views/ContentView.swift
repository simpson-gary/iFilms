//
//  ContentView.swift
//  iFilms_iOS
//
//  Created by Gary Simpson on 4/5/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    let masterViewModel = MasterViewModel(NetworkManager())
    let detailViewModel = DetailViewModel(nil)
    
    var body: some View {
        NavigationView {
            MasterView(viewModel: masterViewModel)
            DetailView(viewModel: detailViewModel)
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
