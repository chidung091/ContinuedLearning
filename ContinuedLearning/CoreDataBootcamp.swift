////
////  CoreDataBootcamp.swift
////  ContinuedLearning
////
////  Created by Chi Dung on 05/10/2022.
////
//
//import SwiftUI
//import CoreData
//
//// View - UI
//// Model - data point
//// ViewModel - manages the data for a view
//
//class CoreDataViewModel: ObservableObject {
//    let container: NSPersistentContainer
//    @Published var savedEntities: [FruitEntity] = []
//    
//    init () {
//        container = NSPersistentContainer(name: "FruitsContainer")
//        container.loadPersistentStores { (description, error) in
//            if let error = error {
//                print("ERROR LOADING CORE DATA. \(error)")
//            }
//        }
//        fetchFruits()
//    }
//
//    func fetchFruits() {
//        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
//        do {
//            savedEntities = try container.viewContext.fetch(request)
//        } catch let error {
//            print("Error fetching. \(error)")
//        }
//    }
//
//    func addFruit(text: String) {
//        let newFruit = FruitEntity(context: container.viewContext)
//        newFruit.name = text
//        saveData()
//    }
//
//    func deleteFruit(indexSet: IndexSet) {
//        guard let index = indexSet.first else { return }
//        let entity = savedEntities[index]
//        container.viewContext.delete(entity)
//        saveData()
//    }
//
//    func updateFruit(entity: FruitEntity) {
//        let currentName = entity.name ?? ""
//        let newName = currentName + "!"
//        entity.name = newName
//        saveData()
//    }
//
//    func saveData() {
//        do {
//            try container.viewContext.save()
//            fetchFruits()
//        } catch let error {
//            print("Error saving. \(error)")
//        }
//    }
//}
//
//struct CoreDataBootcamp: View {
//    @State var textFieldText: String = ""
//    @State var color: UIColor = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
//    @StateObject var vm = CoreDataViewModel()
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 20) {
//                TextField("Add fruit", text: $textFieldText)
//                    .font(.headline)
//                    .padding(.leading)
//                    .frame(height: 55)
//                    .background(Color.gray)
//                    .cornerRadius(10)
//                    .padding(.horizontal)
//                Button(action: {
//                    guard !textFieldText.isEmpty else { return }
//                    vm.addFruit(text: textFieldText)
//                    textFieldText = ""
//                }, label: {
//                    Text("Button")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .frame(height: 55)
//                        .frame(maxWidth: .infinity)
//                        .background(Color(color))
//                        .cornerRadius(10)
//                })
//                .padding(.horizontal)
//
//                List {
//                    ForEach(vm.savedEntities) { entity in
//                        Text(entity.name ?? "NO NAME")
//                            .onTapGesture {
//                                vm.updateFruit(entity: entity)
//                            }
//                    }
//                    .onDelete(perform: vm.deleteFruit)
//                }
//                .listStyle(PlainListStyle())
//                Spacer()
//            }
//            .navigationTitle("Fruits")
//        }
//    }
//}
//
//struct CoreDataBootcamp_Previews: PreviewProvider {
//    static var previews: some View {
//        CoreDataBootcamp()
//    }
//}
