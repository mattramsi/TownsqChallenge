//
//  PostDetailView.swift
//  TownsqChallenge
//
//  Created by Matheus Ramos on 07/08/21.
//

import Foundation
import SwiftUI

struct PostDetailView: View {
    
    @ObservedObject var viewModel: PostDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Title: \(viewModel.post.title)")
            Text("Subtitle: \(viewModel.post.body)")
            Text("Author: \(viewModel.author?.name ?? "")")
            Text("Comment: \(viewModel.comment?.body ?? "")")
        }.onAppear {
            viewModel.onAppear()
        }
    }
    
}
