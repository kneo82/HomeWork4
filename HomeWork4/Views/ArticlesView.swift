//
//  ArticlesView.swift
//  HomeWork4
//
//  Created by Vitaliy Voronok on 13.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct ArticlesView: View {
    @EnvironmentObject var viewModel: ArticlesViewModel

    var body: some View {
        NavigationView {
            List(viewModel.articles) { item in
                NavigationLink(destination: ArticleView(item: ArticleViewModel(article: item))) {
                    ArticleRowView(item: ArticleViewModel(article: item))
                }
                    .onAppear() {
                            if self.viewModel.articles.isLast(item) {
                                self.viewModel.loadPage()
                            }
                    }
            }
            .navigationBarTitle("News")
            .onAppear() {
                self.viewModel.loadPage()
            }
        }
    }
}
