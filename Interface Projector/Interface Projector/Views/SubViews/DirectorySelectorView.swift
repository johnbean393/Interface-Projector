//
//  DirectorySelectorView.swift
//  Interface Projector
//
//  Created by Bean John on 31/5/2023.
//

import SwiftUI

struct DirectorySelectorView: View {
    
    @Binding var prompt: String
    @Binding var chosenDir: String
    
    var body: some View {
        HStack {
            Text(prompt.replacingOccurrences(of: "chosenDir", with: chosenDir))
                .font(.title3)
                .bold()
            Button("Change folder") {
                // Select a file
                let dialog = NSOpenPanel()
                dialog.title = "Select a folder"
                dialog.showsResizeIndicator = false
                dialog.showsHiddenFiles = false
                dialog.canChooseDirectories = true
                dialog.canCreateDirectories = true
                dialog.canChooseFiles = false
                dialog.allowsMultipleSelection = false
                // If user clicked OK
                if dialog.runModal() == .OK {
                    chosenDir = dialog.url!.path + "/"
                }
            }
        }
    }
}
