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
    func fetchImage(index: Int, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        guard let urls = urlList?.urls, let url = URL(string: urls[index]) else {
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func calculateImageListSize() -> Int {
        guard let imageListSize = urlList?.urls.count else {
            return 0
        }
        
        return imageListSize
    }
}
