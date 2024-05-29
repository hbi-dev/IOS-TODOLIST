//
//  NoItemView.swift
//  todoList
//
//  Created by hamid on 28/04/2024.
//

import SwiftUI

struct NoItemView: View {
    @State var animate:Bool = false
    
    var body: some View {
        ScrollView{
            VStack (spacing: 10){
                Text("Aucune tache à afficher")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Il est temps d'ajouter de nouvelles taches")
                    .padding(.bottom, 10)
                NavigationLink(destination: AddView(), label: {
                    Text("Ajouter une tache")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color("secondaryColor") : Color("mediumColor"))
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                .shadow(
                    color: animate ? Color("secondaryColor").opacity(0.7) : Color("mediumColor").opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0.0,
                        y:animate ? 40 : 30)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func addAnimation() {
        // on check que c'est bien la premiere ouverture
        guard !animate else {return}
        // delai de 1.5 s avant de lancer l'animation
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemView()
        }
    }
}
