//
//  ImageDataModel.swift
//  doggallery
//
//  Created by Gabija on 2021-05-19.
//

import Foundation


class ImageDataModel {
    
    // MARK: - Declarations
    let jsonParser: JSONParser
    let urlList: DogImage?
    
    // MARK: - Initializer
    init(_ jsonParser: JSONParser) {
        self.jsonParser = jsonParser
        self.urlList = jsonParser.parse(forName: "dog_urls")
    }
    
    // MARK: - Methods
    func fetchImages(index: Int) -> Data? {
        guard let urls = urlList?.urls else {
            return nil
        }
        
        do {
            let url = URL(string: urls[index])!
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return nil
    }
    
    func calculateImageListSize() -> Int {
        
        guard let urls = urlList?.urls else {
            return 0
        }
        let imageListSize = urls.count
        return imageListSize
    }
}
