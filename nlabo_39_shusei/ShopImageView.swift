//
//  ShopImageView.swift
//  NCodeLabo_2_34
//
//  Created by Chika Yamamoto on 2025/06/14.
// Swift 第2章 第37回(アプリをつくろうその5) p.18で作成した。
// お店のアイコンを表示させるだけのView。かなり粒度が細かめだが…
// あとでShowView.swiftから利用される。

import SwiftUI

let gradient = Gradient(colors:[
    .white,
    Color.init(red: 0.9,green:0.9, blue:0.9)
])

let linear = LinearGradient(
    gradient: gradient,
    startPoint: .top,
    endPoint: .bottom
)

struct ShopImageView: View {
    let image:Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 250, height: 250)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(linear,lineWidth: 13)
            )
            .shadow(radius:10, x:10, y:5)
    }
}

#Preview(traits: .fixedLayout(width: 300, height: 300)) {
    Group{
        ForEach(shopStore.shops){ shop in
            ShopImageView(image:shop.image)
        }
    }
}
