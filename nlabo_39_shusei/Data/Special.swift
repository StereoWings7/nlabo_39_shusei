//
//  Special.swift
//  NCodeLabo_2_34
//
//  Created by Chika Yamamoto on 2025/05/17.
//

import Foundation
import SwiftUI

struct Special: Codable, Identifiable {
    public var id: String
    public var caption: String
    public var text: String
    public var category: Category
    public var isFeatured: Bool
    public var imageName: String
    public var image: Image {
        Image(imageName)
    }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case new = "New" // 新商品
        case sale = "Sale" // セール"
        case featured = "Featured" // おすすめ商品
    }
}
