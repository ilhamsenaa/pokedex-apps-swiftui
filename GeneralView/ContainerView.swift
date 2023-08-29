//
//  ContainerView.swift
//  ViewPlayground
//
//  Created by Ilham Perdana Jalasena on 20/08/23.
//

import SwiftUI

struct ContainerView<Content: View>: View {
    let containerItem: Content
    
    init(@ViewBuilder containerItem: @escaping () -> Content) {
        self.containerItem = containerItem()
    }
    
    var body: some View {
        VStack {
            containerItem
        }
        .frame(width: 300)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 4)
        .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke(Color.black, lineWidth: 1))
                .padding(.top, 20)
    }
}

//struct ContainerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContainerView()
//    }
//}
