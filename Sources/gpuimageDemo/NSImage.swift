//
//  File.swift
//  
//
//  Created by Roger Luo on 2021/7/10.
//

import Cocoa
extension NSImage {
    var pngData: Data? {
        guard let tiffRepresentation = tiffRepresentation, let bitmapImage = NSBitmapImageRep(data: tiffRepresentation) else { return nil }
        return bitmapImage.representation(using: .png, properties: [:])
    }
    
    var jpgData: Data? {
        guard let tiffRepresentation = tiffRepresentation, let bitmapImage = NSBitmapImageRep(data: tiffRepresentation) else { return nil }
        return bitmapImage.representation(using: .jpeg, properties: [:])
    }

    func pngWrite(to url: URL, options: Data.WritingOptions = .atomic) -> Bool {
            do {
                try pngData?.write(to: url, options: options)
                return true
            } catch {
                print(error)
                return false
            }
        }
    
    func jpgWrite(to url: URL, options: Data.WritingOptions = .atomic) -> Bool {
            do {
                try jpgData?.write(to: url, options: options)
                return true
            } catch {
                print(error)
                return false
            }
        }
}

//extension Data {
//    func write(to url: URL, options: Data.WritingOptions = .atomic) -> Bool {
//        do {
//            try self.write(to: url, options: options)
//        }
//    }
//}
