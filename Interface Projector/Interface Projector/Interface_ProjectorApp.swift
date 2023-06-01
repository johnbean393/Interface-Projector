//
//  Interface_ProjectorApp.swift
//  Interface Projector
//
//  Created by Bean John on 31/5/2023.
//

import SwiftUI

@main
struct Interface_ProjectorApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 1000, height: 650)
                .preferredColorScheme(.dark)
                .onAppear {
                    // Set window size
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        for currWindow in NSApplication.shared.windows {
                            print(currWindow.title)
                            if currWindow.title == "Interface Projector" {
                                // Set minimum size for window
                                currWindow.minSize = NSSize(width: 1000, height: 650)
                                currWindow.maxSize = NSSize(width: 1000, height: 650)
                            }
                        }
                    }
                }
        }
    }
    
}
