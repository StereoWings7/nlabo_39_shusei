//
//  CategoryRowView.swift
//  NCodeLabo_2_34
//
//  Created by Chika Yamamoto on 2025/05/17.
// Swift 第2章 第36回(アプリをつくろうその4) p.7 で作った。
// Special.swiftで定義した構造体(実際の読み込みはData.Swift)に対してViewを構成する。フィルタリングの設計がかなり荒削りだが…
// このViewは後でHomeView.Swiftから利用する。

import SwiftUI

struct CategoryRowView: View {
    var categoryName:String
    var items: [Special]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { special in
                        VStack(alignment: .leading) {
                            special.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .cornerRadius(10)
                            
                            Text(special.caption)
                                .foregroundColor(.primary)
                                .font(.caption)
                        }.padding(.leading, 10)
                    }
                }
            }
        }
    }
}

#Preview {
    CategoryRowView(
        categoryName:"New",
        items: shopStore.specials.filter { $0.category == .sale }
    )
}
