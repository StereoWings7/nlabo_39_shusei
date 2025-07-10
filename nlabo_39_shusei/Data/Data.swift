//
//  Data.swift
//  Swift_2_33
//
//  Created by Chika Yamamoto on 2025/04/10.
//

import Foundation

@Observable
class OrderStore {
    var orders: [OrderEntity] = []
    
    // Method to add a new order
    func addOrder(selectProduct: Int, quantity: Int) {
        let newOrder = OrderEntity(
            name: Int16(selectProduct),
            price: Int16(selectProduct),
            image: getImageName(for: selectProduct),
            details: "Order from app",
            quantity: Int16(quantity)
        )
        orders.append(newOrder)
    }
    
    private func getImageName(for productIndex: Int) -> String {
        switch productIndex {
        case 0: return "SOUNDTRACKS"
        case 1: return "it's_a_wonderful_world"
        case 2: return "HANABI"
        case 3: return "youthful_days"
        default: return "shop"
        }
    }
}

struct ShopStore{
    let specials: [Special] = load("special.json")
    let shops: [Shop] = load("shop.json")
}

// Create shared instance
let orderStore = OrderStore()
let shopStore = ShopStore()

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        //decoder.dateDecodingStrategy = .formatted(DateFormatter())
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
