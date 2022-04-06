//
//  View+Empty.swift
//  iFilms_iOS
//
//  Created by Gary Simpson on 4/6/22.
//

import SwiftUI

struct DefaultEmptyView: View {
    let text: String
    
    var body: some View {
        Text(text)
        .font(.title3)
        .foregroundColor(Color.secondary)
    }
}

extension View {
  func debug() -> Self {
    print(Mirror(reflecting: self).subjectType)
    return self
  }
}

struct EmptyStateViewModifier<EmptyContent>: ViewModifier where EmptyContent: View {
  var isEmpty: Bool
  let emptyContent: () -> EmptyContent
  
  func body(content: Content) -> some View {
    if isEmpty {
      emptyContent()
    }
    else {
      content
    }
  }
}

extension View {
  func emptyState<EmptyContent>(_ isEmpty: Bool,
                                emptyContent: @escaping () -> EmptyContent) -> some View where EmptyContent: View {
    modifier(EmptyStateViewModifier(isEmpty: isEmpty, emptyContent: emptyContent))
  }
}
