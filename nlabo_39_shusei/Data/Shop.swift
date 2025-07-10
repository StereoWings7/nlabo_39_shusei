//
//  Shop.swift
//  NCodeLabo_2_34
//
//  Created by Chika Yamamoto on 2025/05/17.
//
import Foundation
import SwiftUI

struct Shop: Codable, Identifiable {
    public var id: String
    public var name: String
    public var phoneNumber: String
    public var address: String
    fileprivate var imageName: String
    public var image: Image {
        Image(imageName)
    }
}

