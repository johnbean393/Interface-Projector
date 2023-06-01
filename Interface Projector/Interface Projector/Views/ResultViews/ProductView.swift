//
//  ProductView.swift
//  Interface Projector
//
//  Created by Bean John on 31/5/2023.
//

import SwiftUI

struct ProductView: View {
    
    var scale: Float
    @Binding var desktopImage: Image
    @Binding var showAppImage: Bool
    @Binding var appImage: Image
    @Binding var interfaceScale: Float
    
    var body: some View {
        GroupBox {
            ImageView(scale: scale, desktopImage: $desktopImage, showAppImage: $showAppImage, appImage: $appImage, interfaceScale: $interfaceScale)
        }
    }
    
}
