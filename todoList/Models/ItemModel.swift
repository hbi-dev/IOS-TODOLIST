//
//  ItemModel.swift
//  todoList
//
//  Created by hamid on 28/04/2024.
//

import Foundation

struct ItemModel:Identifiable, Codable{

    let id: String
    let title:String
    let isComplete:Bool
    
    init(id : String = UUID().uuidString, title: String, isComplete: Bool) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isComplete: !isComplete)
    }
}
