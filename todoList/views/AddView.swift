//
//  AddView.swift
//  todoList
//
//  Created by hamid on 28/04/2024.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var listModelView: ListViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State var textFieldText:String = ""
    @State var alertTitle:String = ""
    @State var showAlert:Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height:55)
                    .background(Color.gray)
                .cornerRadius(10)
                
                Button(action: saveNewItem, label: {
                    Text("Save".uppercased())
                        .frame(height:55)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
            
        }
        .navigationTitle("Add an item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveNewItem(){
        if isValidContent(){
            listModelView.addItem(title: textFieldText)
            dismiss()
        } else {
            
        }
    }
    
    func isValidContent() -> Bool{
        if textFieldText.count < 4 {
            alertTitle = "Item trop court"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
