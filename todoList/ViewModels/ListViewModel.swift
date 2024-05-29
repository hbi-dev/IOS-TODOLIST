//
//  ListViewModel.swift
//  todoList
//
//  Created by hamid on 28/04/2024.
//

import Foundation

class ListViewModel:ObservableObject {
    
    @Published var items: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    var itemKey: String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
//        let newItems = [
//            ItemModel(title: "First item", isComplete: false),
//            ItemModel(title: "Second item", isComplete: true),
//            ItemModel(title: "Third item", isComplete: false)
//        ]
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = savedData
        
        
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from:IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title:String){
        let newItem = ItemModel(title: title, isComplete: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { (existingItemModel) -> Bool  in
            return existingItemModel.id == item.id
        }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        //on converti les infos en json pour les stocker plus facilement, d'ou le Codable dans le modele
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
