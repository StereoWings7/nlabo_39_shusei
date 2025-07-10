//
//  ShopRowView.swift
//  NCodeLabo_2_34
//
//  Created by Chika Yamamoto on 2025/05/17.
// Swift 第2章 第35回(アプリを作ろうその3) p.24で作った。
// Shop.swiftの構造体に読み込んだ複数shopデータをScrollViewで横展開して表示する。
// NavigationViewによりタップでShopView.swiftに遷移(第2章 第37回 その5)p.24
// あとでHomeView.swiftから利用される。

import SwiftUI

//構造体を新たに定義してスッキリさせる at 第37回 p.24
struct ShopCell: View{
    var shop: Shop
    var body: some View{
        VStack(alignment:.center){
            shop.image
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 155,height: 155)
                .clipShape(Circle())
            Text(shop.name)
                .font(.caption)
                .foregroundColor(.primary)
        }
        .padding(.leading,15)
    }
}

struct ShopRowView: View {
    var shops: [Shop]
    
    var body: some View {
        VStack(alignment: .leading){
            Text("ShopTest")
                .font(.headline)
                .padding(.leading,15)
                .padding(.top, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment:.top,spacing: 0) {
                    ForEach(self.shops) { shop in
                        VStack(alignment: .center){
                            // NavigationLinkを適用しておく。ここではまだNavigationViewは設定してない
                            NavigationLink(destination: ShopView(shop: shop)){
                                ShopCell(shop: shop)
                            }
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    ShopRowView(shops: shopStore.shops)
}
