//
//  ContentView.swift
//  Maps
//
//  Created by Jordan Singer on 7/13/20.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    var body: some View {
        NavigationView {
            Sidebar()
            Map(coordinateRegion: $region)
        }
        .navigationTitle("New York, NY")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: { }) {
                    Image(systemName: "sidebar.left")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "location")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "map")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "view.3d")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "binoculars")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "arrowshape.turn.up.right.circle")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "plus")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
    }
}

struct Sidebar: View {
    @State private var search = ""
    
    var body: some View {
        VStack {
            SearchField(text: $search)
                .padding(.horizontal)
            
            List {
                Text("Favorites")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                VStack(alignment: .leading, spacing: 0) {
                    FavoriteView(title: "Home", subtitle: "Nearby", icon: "house.fill", color: .blue)
                    FavoriteView(title: "Work", subtitle: "23 min drive", icon: "briefcase.fill", color: .orange)
                    FavoriteView(title: "Coffee Co.", subtitle: "22 min drive", icon: "mappin", color: .red)
                }
                .padding(.bottom)
                
                Text("My Guides")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                VStack(alignment: .leading, spacing: 0) {
                    FavoriteView(title: "Beach Spots", subtitle: "9 places", icon: "mappin", color: .blue)
                    FavoriteView(title: "Best Parks", subtitle: "3 places", icon: "mappin", color: .green)
                    FavoriteView(title: "Hiking", subtitle: "8 places", icon: "map", color: .green)
                    FavoriteView(title: "New York City", subtitle: "23 places", icon: "figure.wave", color: .yellow)
                }
            }
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 192, idealWidth: 192, maxWidth: 192, maxHeight: .infinity)
    }
}

struct FavoriteView: View {
    var title: String
    var subtitle: String
    var icon: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 8) {
            Circle()
                .frame(width: 32, height: 32)
                .foregroundColor(color)
                .overlay(
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .foregroundColor(.white)
                )
            
            VStack(alignment: .leading) {
                Text(title)
                Text(subtitle)
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 6)
    }
}

struct SearchField: NSViewRepresentable {
    @Binding var text: String

    func makeNSView(context: Context) -> NSSearchField {
        let textField = NSSearchField()
        return textField
    }
    func updateNSView(_ nsView: NSSearchField, context: Context) {
        nsView.stringValue = text
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
