//
//  SettingView.swift
//  HomeWork4
//
//  Created by Vitaliy Voronok on 14.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var viewModel: SettingViewModel
    
    @State var query: String = ""
    var body: some View {
        Form {
            Section(header: Text("Query")) {
                TextField("Query", text: $viewModel.query)
            }
            
            Section(header: Text("Page Size")) {
                TextField("Page Size", text: $viewModel.pageSize)
            }
            .keyboardType(.numberPad)
            
            Toggle(isOn: $viewModel.showImages) {
                Text("Show Images")
            }
        }
    }
}

