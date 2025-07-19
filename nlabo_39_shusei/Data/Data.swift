//
//  Data.swift
//  Swift_2_33
//
//  Created by Chika Yamamoto on 2025/04/10.
//

import Foundation

//2025/7/10追記 iOS18で使える@Observable属性を使って、OrderEntityを定義する。
// 第39回 p.12,17と関連して。
// class OrderStoreは、アプリ全体で共有される注文のデータを管理するためのクラスです。
// OrderEntityインスタンスのリストを保持し、新しい注文を追加するメソッドを提供します。
@Observable
class OrderStore {
    var orders: [OrderEntity] = []

    // Method to add a new order
    func addOrder(selectProduct: Int, quantity: Int) {
        //func addOrder(selectProduct: Int, quantity: Int, message: String) {
        let newOrder = OrderEntity(
            name: Int16(selectProduct),
            price: Int16(selectProduct),
            image: getImageName(for: selectProduct),
            details: "Order from app",
            quantity: Int16(quantity)
            //quantity: Int16(quantity),
            //message: String(message)
        )
        orders.append(newOrder)
    }

    private func getImageName(for productIndex: Int) -> String {
        guard productIndex >= 0 && productIndex < nameArray.count else {
            return "shop"
        }
        return nameArray[productIndex]
    }
}

struct ShopStore {
    let specials: [Special] = load("special.json")
    let shops: [Shop] = load("shop.json")
}

// Create shared instances for environment
let orderStore = OrderStore()
let shopStore = ShopStore()

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    // Better error handling for educational purposes
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        print("⚠️ Error: Couldn't find \(filename) in main bundle.")
        fatalError("File not found: \(filename)")
    }

    let data: Data
    do {
        data = try Data(contentsOf: file)
    } catch {
        print("⚠️ Error loading \(filename): \(error.localizedDescription)")
        fatalError("Couldn't load \(filename) from main bundle")
    }

    do {
        let decoder = JSONDecoder()
        // ISO 8601 date format for modern JSON handling
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    } catch {
        print("⚠️ Error parsing \(filename): \(error.localizedDescription)")
        fatalError("Couldn't parse \(filename) as \(T.self)")
    }
}
