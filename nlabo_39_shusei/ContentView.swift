//
//  ContentView.swift
//  NCodeLabo_2_34
//
//  Created by Chika Yamamoto on 2025/04/19.
// Swift 第2章 第37回(アプリを作ろうその5)p.31で作った。
//  HomeView.swift, OrderView.swift, OrderHistoryView.swift の3つをTabViewでまとめてから。

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Image(systemName:"house.fill")
                    Text("Home")
                }
            OrderView()
                .tabItem{
                    Image(systemName:"textbox")
                    Text("Order")
                }
            OrderHistoryView()
                .tabItem{
                    Image(systemName:"list.bullet")
                    Text("List")
                }
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

#Preview {
    ContentView()
}
