//
//  RestaurantView.swift
//  NCodeLabo_2_34
//
//  Created by Chika Yamamoto on 2025/04/26.
// Swift 第2章 第35回(アプリを作ろうその3) p.10で作った。
// 単体ビューを構成するための方法を練習するための、どちらかというと手習い用のView.

import SwiftUI

struct RestaurantView: View {
    var title: String
    var type: String
    var note: String
    var rating: Int = 3
    
    var body: some View {
        HStack{
            VStack{
                HStack(spacing:0){
                    ForEach(1...rating, id: \.self){ _ in
                        Image(systemName: "star.fill")
                    }
                    ForEach(rating..<5, id: \.self){ _ in
                        Image(systemName: "star")
                    }
                }.foregroundColor(.yellow)
                Text(type)
            }
            VStack(alignment: .leading){
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                Text(note)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 100)) {
    RestaurantView(
        title: "CoCo壱番屋",
        type: "カレー",
        note: "日常使いできる店",
        rating: 4
    )
}
