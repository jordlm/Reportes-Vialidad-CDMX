//
//  GeneralInfoView.swift
//  demoApp
//
//  Created by Jorge de la Mora on 4/28/24.
//

import SwiftUI

struct GeneralInfoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Cómo utilizar la aplicación:")
                    .font(.headline)
                Text("Para reportar una fuga de agua o un bloqueo vial, selecciona la opción correspondiente en el menú principal. Completa los detalles del reporte y envíalo para que sea atendido por las autoridades correspondientes.")
                
                Text("Horarios de atención:")
                    .font(.headline)
                Text("Los reportes son atendidos de lunes a viernes, de 9:00 a 18:00 hrs.")
                
                Text("Teléfono de contacto:")
                    .font(.headline)
                Text("Para más ayuda, contacta al 55 1234 5678.")
            }
            .padding()
        }
        .navigationTitle("Información General")
    }
}
