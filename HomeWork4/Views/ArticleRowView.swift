//
//  ArticleRowView.swift
//  HomeWork4
//
//  Created by Vitaliy Voronok on 13.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct ArticleRowView: View {
    let item: ArticleViewModel
    
    var body: some View {
        VStack {
            Text(item.title)
                .font(.title)
                .foregroundColor(.blue)
        }
    }
}
