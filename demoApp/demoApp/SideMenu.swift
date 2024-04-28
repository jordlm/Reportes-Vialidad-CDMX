//
//  SideMenu.swift
//  demoApp
//
//  Created by Jorge de la Mora on 4/28/24.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            NavigationLink(destination: UserReportsView()) {
                Text("Mis reportes")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            .padding(.horizontal, 20)
            .padding(.top, 200)

            NavigationLink(destination: GeneralInfoView()) {
                Text("Información general")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            .padding(.horizontal, 20)
            
            Button(action: {
                print("Mapa Principal button tapped")
                isShowing = false
            }) {
                Text("Mapa Principal")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.all)
    }
}

