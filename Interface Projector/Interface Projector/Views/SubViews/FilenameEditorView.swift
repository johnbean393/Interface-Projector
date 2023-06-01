//
//  FilenameEditorView.swift
//  Interface Projector
//
//  Created by Bean John on 31/5/2023.
//

import SwiftUI

struct FilenameEditorView: View {
    
    @Binding var filename: String
    
    var body: some View {
        // Let user define filename
        HStack {
            Text("Name: ")
                .font(.title2)
                .bold()
            TextField("Filename", text: $filename)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 150)
        }
        .padding(.top, 5)
        .padding(.bottom, 5)
    }
}
