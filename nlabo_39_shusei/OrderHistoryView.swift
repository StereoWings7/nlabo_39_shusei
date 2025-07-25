//
//  OrderHistoryView.swift
//  NCodeLabo_2_34
//
//  Created by Chika Yamamoto on 2025/05/10.
// Swift 第2章 第35回(アプリを作ろうその3) p.20で作った。
// その1で作ったOrderRowView.swiftを他のビューで使う、となるとこんな感じになる。
// ContentView.swiftからTabViewの1つとして読み出される。

import SwiftUI

struct OrderHistoryView: View {
    @State var showFavoritesOnly = false
    // Use the shared OrderStore instance instead of creating a new one
    @State var showDeleteActionSheet = false
    var body: some View {
        NavigationStack {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                ForEach(orderStore.orders) { order in
                    if !self.showFavoritesOnly || order.favorite {
                        NavigationLink(destination: OrderDetail(order: order)) {
                            OrderRowView(order: order)
                        }
                    }
                }
            }
            .navigationTitle("Order list")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.showDeleteActionSheet = true
                    }) {
                        Text("お気に入りに追加")
                    }
                }
            }
            .confirmationDialog(
                "Message",
                isPresented: $showDeleteActionSheet,
                titleVisibility: .visible
            ) {
                Button("OK", role: .destructive) {
                    orderStore.orders.forEach {
                        $0.favorite = true
                    }
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("お気に入りに追加しました")
            }
        }
    }
}

#Preview {
    //    var orderStore : OrderStore{
    //        let orderStore = OrderStore()
    //        orderStore.orders.append(OrderEntity(
    //            name: 0,
    //            price: 0,
    //            image: "SOUNDTRACKS",
    //            details: "Sample order for preview",
    //            quantity: 1
    //        ))
    //        return orderStore
    OrderHistoryView()
    //    OrderHistoryView()
    //        .onAppear {
    //            // Add sample data for preview
    //            orderStore.addOrder(selectProduct: 0, quantity: 2)
    //            orderStore.addOrder(selectProduct: 1, quantity: 1)
    //        }
}
