//
//  OrderDetail.swift
//  Swift_2_33
//
//  Created by Chika Yamamoto on 2025/04/10.
// Swift 第2章 第33回(アプリを作ろうその1)で作ったビュー。
//OrderEntity.Swiftの構造体リスト(Data.swiftでリスト"orderStore"に合従)を単体(リストの要素1つだけ)で表示するView。
// あとでOrderHistoryView.swiftからlNavigationLinkによるジャンプ先にされる

import SwiftUI

struct OrderDetail: View {
    var order: OrderEntity
    
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    var body: some View {
        VStack{
            HStack{
                Spacer()
                if order.favorite {
                    Image(systemName: "heart.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.red)
                }else{
                    Image(systemName: "heart.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)
                }
            }.padding()
            Image(order.image)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            Text(order.productName)
                .font(.title)
            Text(order.details)
            Text("Price: \(order.priceValue)")
            Text("注文日時: \(order.date,formatter:dateFormatter)")
        }
    }
}

#Preview {
    // Create a sample order for preview
   var orderStore : OrderStore{
        let orderStore = OrderStore()
        orderStore.orders.append(OrderEntity(
            name: 0,
            price: 0,
            image: "SOUNDTRACKS",
            details: "Sample order for preview",
            quantity: 1
        ))
        return orderStore
    }
    OrderDetail(order: orderStore.orders[0])
    
//    let sampleOrder = OrderEntity(
//        name: 0,
//        price: 0,
//        image: "SOUNDTRACKS",
//        details: "Sample order for preview",
//        quantity: 1
//    )
//    OrderDetail(order: sampleOrder)

}
