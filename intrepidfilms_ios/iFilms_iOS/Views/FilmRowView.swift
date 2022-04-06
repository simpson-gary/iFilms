//
//  FilmRowView.swift
//  iFilms_iOS
//
//  Created by Gary Simpson on 4/6/22.
//

import SwiftUI

///Base row used for each *List* in the  **MasterView**.
struct FilmRowView: View {
    let title: String
    let episodeId: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text(title)
            Text("\(episodeId)")
        }
    }
}
