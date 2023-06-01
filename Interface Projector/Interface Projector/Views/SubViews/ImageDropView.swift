//
//  ImageDropView.swift
//  Interface Projector
//
//  Created by Bean John on 31/5/2023.
//

import SwiftUI
import AppKit

struct ImageDropView: View {
    
    var prompt: String
    var defaultImage: Image
    @Binding var droppedImage: Image
    
    var body: some View {
        VStack(alignment: .leading) {
            // Show prompt
            HStack {
                Text(prompt)
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                Button("Reset") {
                    droppedImage = defaultImage
                }
            }
            GroupBox {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.clear)
                        .frame(width: 250, height: 120)
                    Text("Drag image here")
                        .font(.title3)
                        .bold()
                }
            }
            .padding(.bottom, 10)
            .dropDestination(for: Data.self) { items, location in
                guard let item = items.first else { return false }
                guard let nsImage = NSImage(data: item) else { return false }
                droppedImage = Image(nsImage: nsImage)
                return true
            }
        }
    }
}
