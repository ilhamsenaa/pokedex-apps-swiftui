//
//  TabBarView.swift
//  ViewPlayground
//
//  Created by Ilham Perdana Jalasena on 27/08/23.
//

import SwiftUI

struct TabBarView: View {
    var tabBarItems: [String]
    
    @Binding var selectedTabName: String
    
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tabBarItems, id: \.self) { tabItem in
                        let tabText = Text(tabItem).font(.subheadline)
                        
                        tabText
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            .foregroundColor(selectedTabName == tabItem ? .white : .black)
                            .background(Capsule().foregroundColor(selectedTabName == tabItem ? .blue : .clear))
                            .onTapGesture {
                                withAnimation(.easeOut) {
                                    selectedTabName = tabItem
                                }
                            }
                    }
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
        }
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}
