//
//  todoListApp.swift
//  todoList
//
//  Created by hamid on 28/04/2024.
//

import SwiftUI

@main
struct todoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel() //on transforme le viewmodel en variable d'enrivonnement
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel) // on rend la variable d'environnement dispo a tous les éléments de la navigation view
        }
    }
}
