//
//  InterfaceProjectorTools.swift
//  Interface Projector
//
//  Created by Bean John on 31/5/2023.
//

import Foundation


class InterfaceProjectorTool {
    
    static func runCommand(command: String) -> String {
        let task = Process()
        task.launchPath = "/bin/zsh"
        task.arguments = ["-c", command]
        
        let pipe = Pipe()
        task.standardOutput = pipe
        
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8) ?? "No output"
        return output
    }
    
}
