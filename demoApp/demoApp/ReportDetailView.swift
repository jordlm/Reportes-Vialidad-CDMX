//
//  ReportDetailView.swift
//  demoApp
//
//  Created by Jorge de la Mora on 4/27/24.
//

import SwiftUI
import UIKit

struct ReportDetailView: View {
    var reportType: ReportType?
    @Environment(\.presentationMode) var presentationMode
    @State private var severitySize: Double = 0
    @State private var additionalComments: String = ""
    @State private var image: UIImage?
    @State private var showingImagePicker = false
    @State private var roadBlockCanEvade: Bool = false

    var body: some View {
        NavigationView {
            Form {
                if reportType == .waterLeak {
                    Text("Magnitud de la fuga:")
                    Slider(value: $severitySize, in: 0...10, step: 1)
                    TextField("Información adicional", text: $additionalComments)
                } else if reportType == .obstacle {
                    Text("Tamaño del bloqueo:")
                    Slider(value: $severitySize, in: 0...10, step: 1)
                    TextField("Comentarios adicionales", text: $additionalComments)
                    Toggle("¿Se puede evitar?", isOn: $roadBlockCanEvade)
                }
                
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                }
                Button("Add Picture") {
                    showingImagePicker = true
                }
            }
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("X")
            }, trailing: Button("Enviar") {
                presentationMode.wrappedValue.dismiss()
            })
            .navigationTitle(reportType == .waterLeak ? "Reportar Fuga" : "Reportar Bloqueo Vial")
            .onAppear {
                print("Report Detail View appearing with type: \(String(describing: reportType))")
                resetForm()
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $image)
            }
        }
    }

    private func resetForm() {
        severitySize = 0
        additionalComments = ""
        image = nil
        roadBlockCanEvade = false
        showingImagePicker = false
    }
}
