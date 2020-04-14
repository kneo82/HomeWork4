//
//  ContentView.swift
//  HomeWork4
//
//  Created by Vitaliy Voronok on 13.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

enum Tab: Hashable {
    case news
    case settings
}

struct RootView: View {
    @State var selectedTab: Tab = .news
    @EnvironmentObject var settingViewModel: SettingViewModel
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ArticlesView()
                .font(.title)
                .tabItem({
                    Image(systemName: "text.bubble")
                    Text("News")
                })
                .tag(Tab.news)
            
            SettingView(viewModel: settingViewModel)
                .font(.title)
                .tabItem({
                    Image(systemName: "gear")
                    Text("Settings")
                })
                .tag(Tab.settings)
        }
    }
}

