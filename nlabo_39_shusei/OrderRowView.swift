//
//  OrderRowView.swift
//  Swift_2_33
//
//  Created by Chika Yamamoto on 2025/04/12.
// /Swift 第2章 第33回(アプリを作ろうその1) p.10で作った。
//OrderEntity.Swiftの構造体リスト(Data.swiftでリスト"orderStore"に合従)を単体(リストの要素1つだけ)で表示するView。

import SwiftUI

struct OrderRowView: View {
    @State var order: OrderEntity
    
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        HStack{
            Image(order.image)
                .resizable()
                .frame(width: 70, height: 70)
            VStack(alignment: .leading){
                Text(order.productName)
                    .font(.title)
                Spacer()
                Text(order.details)
                HStack{
                    Text("Price: \(order.priceValue)")
                    Text("注文日時: \(order.date,formatter:dateFormatter)")
                        .font(.caption)
                }
            }
        }
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 100)) {
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
    
    // Create a sample order for preview
//    let sampleOrder = OrderEntity(
//        name: 0,
//        price: 0,
//        image: "SOUNDTRACKS",
//        details: "Sample order for preview",
//        quantity: 1
//    )
//    OrderRowView(order: sampleOrder)
}
