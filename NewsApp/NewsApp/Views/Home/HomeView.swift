//
//  HomeView.swift
//  NewsApp
//
//  Created by Krystsina on 2023-04-12.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack() {
            NavigationStack {
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 10) {
                        ForEach(viewModel.news, id: \.title) { item in
                            NavigationLink(destination: NewsView(model: item)) {
                                NewsCell(item: item)
                            }
                            Divider()
                        }
                    }
                    .padding(.horizontal, 10)
                }
                .padding(.top, 5)
                
            }.task {
                await viewModel.loadData()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
