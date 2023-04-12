//
//  NewsCell.swift
//  NewsApp
//
//  Created by Krystsina on 2023-04-12.
//

import SwiftUI

struct NewsCell: View {
    @StateObject var viewModel = HomeViewModel()
    
    var author: String?
    var sourceName: String
    var title: String
    var publishedAt: String
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 5) {
                Text(author ?? "")
                    .foregroundColor(.gray)
                    .font(.custom("Times New Roman", size: 13))
                
                if author != nil {
                    Divider()
                        .background(Color.black)
                        .frame(height: 15)
                }
                
                Text(sourceName)
                    .foregroundColor(.gray)
                    .font(.custom("Times New Roman", size: 15))
                
                Spacer()
            }
            
            HStack(spacing: 0) {
                Text(title)
                    .foregroundColor(.black)
                    .font(.custom("Times New Roman", size: 25)).bold()
                    
                Spacer()
            }
            
            HStack(spacing: 0) {
                Text(viewModel.getDateFromString(dateString: publishedAt), style: .date)
                    .foregroundColor(.gray)
                    .font(.custom("Times New Roman", size: 15))
                Spacer()
            }
        }
    }
}

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell(author: "Manveena Suri", sourceName: "CNN", title: "Dalai Lama apologizes", publishedAt: "2023-04-11T05:27:00Z")
    }
}
