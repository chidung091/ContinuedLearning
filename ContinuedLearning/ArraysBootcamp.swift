//
//  ArraysBootcamp.swift
//  ContinuedLearning
//
//  Created by Chi Dung on 05/10/2022.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let point: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        // sort
//        filteredArray = dataArray.sorted { (user1, user2) -> Bool in
//            return user1.point < user2.point
//        }
//        filteredArray = dataArray.sorted(by: {
//            $0.point < $1.point
//        })
        // filter
        filteredArray = dataArray.filter({ (user) -> Bool in
            return user.isVerified
        })
        // map
//        mappedArray = dataArray.map({ (user) -> String in
//            return user.name
//        })
        
        mappedArray = dataArray.map({
            $0.name
        })
    }
    func getUsers() {
        let user1 = UserModel(name: "Nick", point: 5, isVerified: true)
        let user2 = UserModel(name: "Chris", point: 4, isVerified: true)
        let user3 = UserModel(name: "Joe", point: 1, isVerified: true)
        let user4 = UserModel(name: "Emily", point: 10, isVerified: true)
        let user5 = UserModel(name: "Samantha", point: 20, isVerified: true)
        let user6 = UserModel(name: "Jason", point: 2, isVerified: true)
        let user7 = UserModel(name: "Sarah", point: 4, isVerified: true)
        let user8 = UserModel(name: "Lisa", point: 9, isVerified: true)
        let user9 = UserModel(name: "Steve", point: 12, isVerified: true)
        let user10 = UserModel(name: "Amanda", point: 32, isVerified: true)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10
        ])
    }
}

struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.headline)
                }
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.point)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

struct ArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootcamp()
    }
}
