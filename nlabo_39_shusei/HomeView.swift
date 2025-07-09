//
//  HomeView.swift
//  NCodeLabo_2_34
//
//  Created by Chika Yamamoto on 2025/06/14.
// Swift 第2章 第36回(アプリを作ろう その4) p.25 で作った。どちらかというと第37回(その5)で内容をブラッシュアップする。
// Shop.swiftの構造体データ→ShopRowView.swiftのView
// Special.swiftの構造体データ→CategoryRowView.swiftのView
// という形でjsonデータをロードしてViewで表示する。
// ContentView.swiftからTabViewとして読み出される。

import SwiftUI

struct HomeView: View {
    // stringをキーとして、対応する値をSpecial.Swiftの構造体(のリスト)とする辞書を宣言する。
    // grouping: by: でinitするDictionaryよく分からんけど、Dashでリスト見ると以下のような仕組みらしい。この場合、categoryのキーを指定したらSpecial構造体が取得できるのか。
    //let students = ["Kofi", "Abena", "Efua", "Kweku", "Akosua"]
    //let studentsByLetter = Dictionary(grouping: students, by: { $0.first! }) //←リストStudentをbyで指定されたクロージャでグルーピングする
    // ["E": ["Efua"], "K": ["Kofi", "Kweku"], "A": ["Abena", "Akosua"]]
    var categories:[String: [Special]]{
        Dictionary(
            grouping: shopStore.specials.filter{
                $0.category != .featured
            },
            by: {$0.category.rawValue}
        )
    }
    
    var body: some View {
        NavigationView{
            ScrollView{
                // ここでようやくNavigationViewの中でShopRowViewを呼ぶので、NavigationLinkが機能するようになる。
                ShopRowView(shops: shopStore.shops)
                
                ForEach(categories.keys.sorted(), id:\.self){key in
                    CategoryRowView(categoryName: key, items: self.categories[key]!)
                }
            }
            .navigationBarTitle(Text("Home"))
        }
    }
}

#Preview {
    HomeView()
}
