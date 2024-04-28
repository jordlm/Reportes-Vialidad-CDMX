//
//  UserReportsView.swift
//  demoApp
//
//  Created by Jorge de la Mora on 4/28/24.
//

import SwiftUI

struct UserReportsView: View {
    var body: some View {
        List {
            Text("Delegación - Fecha - Estado")
            ForEach(0..<10) { item in
                Text("Cuajimalpa - \(Date(), formatter: itemFormatter) - En Proceso")
            }
        }
        .navigationTitle("Mis Reportes")
    }
}

fileprivate let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    return formatter
}()

