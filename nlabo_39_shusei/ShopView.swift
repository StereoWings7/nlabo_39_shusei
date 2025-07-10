//
//  ShopView.swift
//  NCodeLabo_2_34
//
//  Created by Chika Yamamoto on 2025/06/14.
// Swift 第2章 第37回(アプリを作ろうその5) p.21で作成した。
// Shop.swiftの構造体に読み込んだリストshopsのうち単体での中身を表示してる。
// あとでホーム画面(ShopRowView.swift)から飛んでくるものとして、単体Viewをこのように作っておく。

import SwiftUI

struct ShopView: View {
    var shop: Shop
    @State var degree: Double = 180

    var body: some View {
        VStack{
            Rectangle()
            ShopImageView(image:shop.image)
                .padding(.top,-130)
                .rotation3DEffect(.init(degrees: degree), axis: (x: 0, y: 1, z: 0))
                .animation(.interpolatingSpring(stiffness: 0.1, damping: 0.5,initialVelocity: 30),value:degree)
                .onAppear {
                    self.degree=0
                }
            Text(shop.name)
                .padding()
                .font(.largeTitle)
            Text(shop.address)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .padding()
            Text("Phone:\(shop.phoneNumber)")
                .padding()
        }
        .navigationBarTitle(shop.name)
    }
}

#Preview {
    ShopView(shop:shopStore.shops[0])
}
