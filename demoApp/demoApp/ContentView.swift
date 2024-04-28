//
//  ContentView
//  demoApp
//
//  Created by Jorge de la Mora on 4/16/24.
//

import SwiftUI
import MapKit

enum ReportType: Identifiable {
    case waterLeak, obstacle
    
    var id: Int {
        switch self {
        case .waterLeak:
            return 1
        case .obstacle:
            return 2
        }
    }
}

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 19.4326, longitude: -99.1332),
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )

    @State private var reportType: ReportType?
    @State private var isShowingMenu = false
    @State private var overlayView: AnyView?

    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                mainContentView()
                    .blur(radius: isShowingMenu ? 20 : 0)

                if isShowingMenu {
                    SideMenu(isShowing: $isShowingMenu)
                        .frame(width: 250, alignment: .leading)
                        .transition(.move(edge: .leading))
                        .background(Color.white)
                }
                
                if let overlayView = overlayView {
                    overlayView
                        .edgesIgnoringSafeArea(.all)
                }
            }
            .navigationBarItems(leading: Button(action: {
                withAnimation {
                    isShowingMenu.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
            })
            .navigationTitle(isShowingMenu ? "" : "Reportes CDMX")
            .sheet(item: $reportType, onDismiss: {
                reportType = nil
            }) { type in
                ReportDetailView(reportType: type)
            }
        }
        .onChange(of: locationManager.userLocation) { newLocation, _ in
            updateRegion(location: newLocation?.coordinate)
        }
    }

    private func mainContentView() -> some View {
        VStack {
            UserLocationMapView(region: $region)
                .frame(height: 450)
                .onAppear {
                    updateRegion()
                }

            Button("Reportar Fuga de Agua") {
                reportType = .waterLeak
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            Button("Reportar Bloqueo Vial") {
                reportType = .obstacle
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
    }

    private func updateRegion(location: CLLocationCoordinate2D? = nil) {
        if let locationCoordinate = location {
            region.center = locationCoordinate
            region.span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        }
    }
}


