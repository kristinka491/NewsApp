//
//  NewsCell.swift
//  NewsApp
//
//  Created by Krystsina on 2023-04-12.
//

import SwiftUI

struct NewsCell: View {
    var item: ArticleModel
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 5) {
                Text(item.author ?? "")
                    .foregroundColor(.gray)
                    .font(.custom("Times New Roman", size: 13))
                
                if item.author != nil {
                    Divider()
                        .background(Color.black)
                        .frame(height: 15)
                }
                
                Text(item.source?.name ?? "")
                    .foregroundColor(.gray)
                    .font(.custom("Times New Roman", size: 15))
                
                Spacer()
            }
            
            HStack(spacing: 0) {
                Text(item.title ?? "")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .font(.custom("Times New Roman", size: 25)).bold()
                    
                Spacer()
            }
            
            HStack(spacing: 0) {
                Text(item.publishedDate, style: .date)
                    .foregroundColor(.gray)
                    .font(.custom("Times New Roman", size: 15))
                
                Spacer()
            }
        }
    }
}

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell(item: ArticleModel())
    }
}
