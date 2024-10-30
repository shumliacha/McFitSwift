//
//  NewPostForm.swift
//  McSwift
//
//  Created by Kristina Litvinova on 18.09.2024.
//

import SwiftUI

struct NewPostForm: View {
    
    @State private var post = BlogPost(title: "", authorName: "", content: BlogContent(intro: "", text1: ""), tags: Tags.thoughts)
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $post.title)
                }
            }
        }
    }
}

#Preview {
    NewPostForm()
}
