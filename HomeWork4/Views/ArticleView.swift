//
//  ArticleView.swift
//  HomeWork4
//
//  Created by Vitaliy Voronok on 13.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct ArticleView: View {
    let item: ArticleViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(item.title)
                .font(.title)
                .foregroundColor(.black)
            
            Text(item.author)
                .font(.caption)
                .foregroundColor(.gray)
            
            Text(item.url)
                .font(.caption)
                .foregroundColor(.blue)
            
            Text(item.description)
                .font(.body)
                .foregroundColor(.black)
            
            Spacer()
        }
        .padding()
    }
}

