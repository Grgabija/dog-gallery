//
//  JSONParser.swift
//  doggallery
//
//  Created by Gabija on 2021-05-18.
//

import Foundation

class JSONParser {
    
    // MARK: - Methods
    // MARK: - Public
    func parse(forName name: String) -> DogImage? {
        if let data = readLocalFile(forName: name) {
            let parsedData = decode(jsonData: data)
            return parsedData
        }
        print("parsing error")
        return nil
    }
    
    // MARK: - Private
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print("reading error: \(error)")
        }
        return nil
    }
    
    private func decode(jsonData: Data) -> DogImage? {
        do {
            let decodedData = try JSONDecoder().decode(DogImage.self, from: jsonData)
            return decodedData
        } catch {
            print("decode error: \(error)")
        }
        return nil
    }
}
