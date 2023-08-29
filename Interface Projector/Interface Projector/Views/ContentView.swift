//
//  ContentView.swift
//  Interface Projector
//
//  Created by Bean John on 31/5/2023.
//

import SwiftUI
import AppKit

struct ContentView: View {
    
    @State var desktopImage: Image = Image("Default_Image_macOS_14")
    @State var appImage: Image = Image("Interface_Projector_Interface")
    @State var showAppImage: Bool = false
    @State var interfaceScale: Float = 0.75
    @State var appImageWidth: Int = 0
    @State var appImageHeight: Int = 0
    @State var productDirPrompt: String = "Create product at \"chosenDir\": "
    @State var filename: String = "Image.png"
    @State var productDir: String = "/Users/\(NSUserName())/Desktop/"
    @State var renderComplete: Bool = false
    
    var body: some View {
        HStack {
            GroupBox {
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            ImageDropView(prompt: "Specify a Desktop Image: ", defaultImage: Image("Default_Image_macOS_14"), droppedImage: $desktopImage)
                        }
                        if showAppImage {
                            ImageDropView(prompt: "Specify an Interface Image: ", defaultImage: Image("Interface_Projector_Interface"), droppedImage: $appImage)
                            HStack {
                                Text("Interface Scale: \(String(interfaceScale))")
                                    .font(.title3)
                                    .bold()
                                Slider(value: $interfaceScale)
                            }
                        }
                        Toggle("Show separate app interface", isOn: $showAppImage)
                            .padding(.bottom, 3)
                        FilenameEditorView(filename: $filename)
                        DirectorySelectorView(prompt: $productDirPrompt, chosenDir: $productDir)
                        Spacer()
                        Divider()
                        Button("Render") {
                            Task {
                                // Correct filename if needed
                                if !filename.hasSuffix(".png") {
                                    filename = filename + ".png"
                                }
                                // Render and save image
                                let renderer = ImageRenderer(content: ImageView(scale: 10, desktopImage: $desktopImage, showAppImage: $showAppImage, appImage: $appImage, interfaceScale: $interfaceScale))
                                if let image = renderer.nsImage {
                                    print(image.size)
                                    await saveNSImage(filepath: productDir + filename, image: image)
                                }
                                renderComplete = true
                            }
                        }
                    }
                }
                .padding()
            }
            .padding()
            ProductView(scale: 1, desktopImage: $desktopImage, showAppImage: $showAppImage, appImage: $appImage, interfaceScale: $interfaceScale)
                .padding()
        }
        .alert(isPresented: $renderComplete){
            Alert(
                title: Text("Render Complete"),
                message: Text("Clicking \"OK\" will open the image."),
                dismissButton:.default(Text("OK"), action: {
                    // Open the image
                    print(InterfaceProjectorTool.runCommand(command: "open \"\(productDir + filename)\""))
                    // Close the alert
                    renderComplete = false
            }))
        }
    }
    
    func saveNSImage(filepath: String, image: NSImage) async {
        let imageRepresentation = NSBitmapImageRep(data: image.tiffRepresentation!)
        let pngData = imageRepresentation?.representation(using: .png, properties: [:])
        do {
            try pngData!.write(to: URL(fileURLWithPath: filepath))
        } catch {
            print(error)
        }
    }
    
}
