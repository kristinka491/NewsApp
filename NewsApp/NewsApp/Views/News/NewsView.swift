//
//  NewsView.swift
//  NewsApp
//
//  Created by Krystsina on 2023-04-12.
//

import SwiftUI

struct NewsView: View {
    var model: ArticleModel
    
    var body: some View {
        ZStack() {
            VStack(spacing: 15) {
                if let imageUrl = model.imageURL {
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .cornerRadius(20)
                    .padding(.horizontal, 10)
                } else {
                    Image("DefaultNewsImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .padding(.horizontal, 10)
                }
    
                HStack() {
                    Text(model.title ?? "")
                        .foregroundColor(.black)
                        .font(.custom("Times New Roman", size: 25)).bold()
                    Spacer()
                }
                .padding(.horizontal, 10)
                
                HStack() {
                    Text(model.author ?? "")
                        .foregroundColor(.gray)
                        .font(.custom("Times New Roman", size: 15))
                    Spacer()
                }
                .padding(.horizontal, 10)
                
                HStack() {
                    Text(model.description ?? "")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .font(.custom("Times New Roman", size: 20))
                    Spacer()
                }
                .padding(.horizontal, 10)
                
                HStack() {
                    Link(StringConstants.newsViewButtonTitle, destination: model.websiteURL)
                        .foregroundColor(.gray)
                        .font(.custom("Times New Roman", size: 17)).bold()
                    Spacer()
                }
                .padding(.horizontal, 10)
                Spacer()
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(model: ArticleModel())
    }
}
