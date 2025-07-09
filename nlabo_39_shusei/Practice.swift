// いろいろなViewパーツの練習。
import SwiftUI

struct Restaurant {
    var title: String
    var type: String
    var note: String
    var rating: Int
}

struct Practice: View {
  
    let weather = ["晴れ", "曇り", "雨"]
    let restaurants = [
        Restaurant(title: "CoCo壱番屋", type: "カレー", note: "日常使いできる店", rating: 4),
        Restaurant(title: "すき家", type: "牛丼", note: "安くて早くてうまい", rating: 5),
        Restaurant(title: "幸楽園", type: "ラーメン", note: "こってりもあっさりも", rating: 4),
    ]
    
    @State private var selectedWeather: Int = 0
    @State var age = 15
    @State var showFlag = false
    
    
    var body: some View {
        VStack {
            Picker(selection: $selectedWeather, label: Text("天気")) {
                ForEach(0 ..< weather.count, id: \.self) { index in
                    Text(self.weather[index])
                        .tag(index)
                }
            }
            .pickerStyle(.wheel)
            .frame(width: 200, height: 100)
            .clipped()
            .padding()
            
            Text("選択された天気は\(weather[selectedWeather])です")
            
            Stepper(value: $age, in: 0...100) {
                Text("年齢を入力してください")
            }
            
            Text("あなたの年齢は\(age)歳です")
            
            if age < 18 {
                Text("あなたは未成年です")
            } else {
                Text("あなたは成人です")
            }
            
            Toggle(isOn: $showFlag) {
                Text("テキストを表示する")
            }
            
            if showFlag {
                Text("ToggleがONです")
            }
            
            List {
                ForEach(restaurants.indices, id: \.self) { index in
                    RestaurantView(
                        title: restaurants[index].title,
                        type: restaurants[index].type,
                        note: restaurants[index].note,
                        rating: restaurants[index].rating
                    )
                }
            }
            
            List{
                ForEach(shopStore.specials.filter {$0.category == .new}) { special in
                    HStack {
                        Text("Category: \(special.category.rawValue)")
                        Text("Name: \(special.caption)")
                    }
                }
            }
        }
    }
}

#Preview {
    Practice()
}

