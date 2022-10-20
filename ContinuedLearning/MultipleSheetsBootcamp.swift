//
//  MultipleSheetsBootcamp.swift
//  ContinuedLearning
//
//  Created by Chi Dung on 26/09/2022.
//

import SwiftUI
struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// 1 - use a binding
// 2 - use multiple .sheets
// 3 - use $item
struct MultipleSheetsBootcamp: View {
    @State var selectedModel: RandomModel = RandomModel(title: "Starting Title")
    @State var showSheet: Bool = false
    @State var selectedIndex: Int = 0
    var body: some View {
        VStack(spacing: 20) {
            Button("Button 1") {
                selectedIndex = 1
                selectedModel = RandomModel(title: "ONE")
                showSheet.toggle()
            }
            Button("Button 2") {
                selectedIndex = 2
                selectedModel = RandomModel(title: "TWO")
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet, content: {
            NextScreen(selectedModel: $selectedModel)
//            if selectedIndex == 1 {
//                NextScreen(selectedModel: RandomModel(title: "ONE"))
//            } else if selectedIndex == 2 {
//                NextScreen(selectedModel: RandomModel(title: "TWO"))
//            } else {
//                NextScreen(selectedModel: RandomModel(title: "STARTING TITLE"))
//
//            }
        })
    }
}

struct NextScreen: View {
    @Binding var selectedModel: RandomModel
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}
