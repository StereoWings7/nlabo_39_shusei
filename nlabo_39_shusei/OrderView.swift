//
//  OrderView.swift
//  NCodeLabo_2_34
//
//  Created by Chika Yamamoto on 2025/04/19.
// Swift 第2章 第34回(アプリを作ろうその2) p.17で作った。
// OrderEntity.swiftの構造体(Data.swiftにより"orderStore"と命名)を表示するためのView。
// ContentView.swiftからTabViewの1つとして読み出される。

import SwiftUI

struct OrderView: View {
    @State private var selectProduct: Int = 0
    @State private var quantity: Int = 1
    @State private var showImage: Bool = true
    @State private var message = ""
    //第38回p.23でアラート表示用に追加
    @State private var toSave = false
    @State private var isSaved = false

    private func save() {
        self.toSave = false  // 一旦閉じてから
        // Add order to the shared OrderStore
        // orderStore.addOrderはData.swiftで定義したメソッド
        orderStore.addOrder(selectProduct: selectProduct, quantity: quantity, message: message)

        // iOS 16.0以降では以下のような書き方が推奨(??というほどでもないか)
        Task {
            try await Task.sleep(for: .seconds(0.1))
            self.isSaved = true  //という風に段階を追わないと、2つめのアラートがうまく出てこない
            self.clear()
        }
    }

    private func clear() {
        showImage = true
        selectProduct = 0
        quantity = 1
    }

    let nameArray = ["SOUNDTRACKS", "it's a wonderful world", "HANABI", "youthful days"]

    var body: some View {
        ScrollView {
            VStack {
                if showImage {
                    Image("shop")
                        .resizable()
                }
                Toggle(isOn: $showImage) {
                    Text("画像を表示する")
                }
                HStack {
                    Text("商品選択")
                    Picker(selection: $selectProduct, label: Text("商品")) {
                        ForEach(0..<nameArray.count, id: \.self) { index in
                            Text(self.nameArray[index])
                                .tag(index)
                        }.labelsHidden()
                            .frame(minWidth: 200)
                            .clipped()
                    }.pickerStyle(.wheel)
                }.padding()
                // orderStore.jsonというダミーデータはもう使わないので、orderStore.orders(jsonから読み込んだもの)はもう使えない
                //代わりに、Data.swiftで定義したpriceArrayを使う
                //Text("商品金額:" + "\(orderStore.orders[selectProduct].priceValue)円")
                Text("商品金額: \(priceArray[selectProduct])円")
                Stepper(value: $quantity, in: 1...100) {
                    Text("購入数:\( quantity )")
                }
                //Text("購入金額: \(orderStore.orders[selectProduct].priceValue * quantity)円")
                Text("購入金額: \(priceArray[selectProduct] * quantity)円")
                //
                TextField("お店へのメッセージ", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Divider()

                Button(action: {
                    self.toSave = true
                }) {
                    Text("注文する!")
                }
            }.padding()
        }
        .alert("注文確認", isPresented: $toSave) {
            Button("はい") {
                self.save()
            }
            Button("いいえ", role: .cancel) {}
        } message: {
            Text("注文を確定しますか?")
        }
        .alert("お買い上げありがとうござます。", isPresented: $isSaved) {
            Button("OK") {}
        } message: {
            Text("注文が確定しました。")
        }
    }
}

#Preview {
    OrderView()
}
