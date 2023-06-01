//
//  ImageView.swift
//  Interface Projector
//
//  Created by Bean John on 1/6/2023.
//

import SwiftUI

struct ImageView: View {
    
    var scale: Float
    @Binding var desktopImage: Image
    @Binding var showAppImage: Bool
    @Binding var appImage: Image
    @Binding var interfaceScale: Float
    
    var body: some View {
        ZStack {
            desktopImage
                .resizable()
                .frame(width: 299 * CGFloat(scale), height: 194 * CGFloat(scale))
                .padding(.bottom, 10 * CGFloat(scale))
            // If show interface is true
            if showAppImage {
                // Show interface
                appImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 302 * CGFloat(interfaceScale) * CGFloat(scale))
                    .padding(.bottom, 10 * CGFloat(scale))
                    .clipped()
            }
            Image("MacBook_Pro_2021_14")
                .resizable()
                .frame(width: 512 * CGFloat(scale), height: 473 * CGFloat(scale))
        }
    }
}
