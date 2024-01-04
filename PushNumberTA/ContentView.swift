//
//  ContentView.swift
//  PushNumberTA
//

//

import SwiftUI

struct ContentView: View {
    let grids = Array(repeating: GridItem(.flexible(), spacing: 10, alignment: .center), count: 5)
    var numbers = setNumbersRandomize()

    var body: some View {
        LazyVGrid(columns: grids) {
            ForEach(numbers, id: \.self) { num in
                Page(str: String(num))
                    .frame(height: 80)
                    .cornerRadius(8)
            }
        }
    }
}

struct Page: View {
    @State var colors:[Color] = [.red, .green, .yellow, .blue]
    let str: String
    @State var isClick = false

    var body: some View {
        ZStack {
            colors.randomElement()
                .opacity(0.5)
            Button(action: {isClick.toggle()},
                   label: {
                if !isClick {
                    Text("\(str)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                }
            })

        }
    }
}

private func changeColor(isClick: Bool, colors: [Color]) -> [Color] {
    var colors = colors
    if !isClick {
        colors[0] = .white
        return colors
    }
    return colors
}

private func setNumbersRandomize() -> [Int]
{
    var counter = 1
    var numbers:[Int] = []
    for _ in 1...25 {
        numbers.append(counter)
        counter += 1
    }
    numbers.shuffle()
    return numbers
}

#Preview {
    ContentView()
}
