//
//  View.swift
//  McSwift
//
//  Created by Kristina Litvinova on 03.11.2024.
//

import SwiftUI

struct PostsListView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        List(viewModel.posts) { post in
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.headline)
                Text(post.text)
                    .font(.subheadline)
                Text("\(post.timestamp, formatter: dateFormatter)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()

#Preview {
    PostsListView()
}
