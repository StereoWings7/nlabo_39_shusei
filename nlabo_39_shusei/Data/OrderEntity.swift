//
//  OrderEntity.swift
//  Swift_2_33
//
//  Created by Chika Yamamoto on 2025/04/05.
// Swift 第2章 第33回(アプリを作ろうその1 で定義したもの。その5くらいまで使い回す。)
// 実際のデータ読み込みはData.Swiftで行う。

import Foundation

enum ProductName: Int16 {
    case soundtrack
    case its_a_wonderful_world
    case hanabi
    case youthful_days
    var name: String {
        nameArray[Int(self.rawValue)]
    }
}

enum Price: Int16 {
    case soundtrack
    case its_a_wonderful_world
    case hanabi
    case youthful_days
    var value: Int {
        priceArray[Int(self.rawValue)]
    }
}

var nameArray = ["SOUNDTRACKS", "it's a wonderful world", "HANABI", "youthful days"]
var priceArray = [4200, 3200, 1200, 1000]

//2025/7/10追記 iOS18で使える@Observable属性を使って、OrderEntityを定義する。
// 第39回 p.18と関連して。
// @ObservableはSwiftUIの新しいデータバインディング機能で、
// オブジェクトのプロパティが変更されたときに自動的にビューを更新します。
@Observable
class OrderEntity: Identifiable {
    public var id: String
    public var name: Int16
    public var price: Int16
    public var image: String
    public var details: String
    public var date: Date
    public var quantity: Int16
    public var favorite: Bool
    public var message: String

    public var productName: String {
        ProductName(rawValue: self.name)!.name
    }
    public var priceValue: Int {
        Price(rawValue: self.price)!.value
    }

    // Initializer for creating new orders
    init(
        id: String = UUID().uuidString,
        name: Int16 = 0,
        price: Int16 = 0,
        image: String = "",
        details: String = "",
        date: Date = Date(),
        quantity: Int16 = 1,
        favorite: Bool = false,
        message: String = ""
    ) {
        self.id = id
        self.name = name
        self.price = price
        self.image = image
        self.details = details
        self.date = date
        self.quantity = quantity
        self.favorite = favorite
        self.message = message
    }
}
