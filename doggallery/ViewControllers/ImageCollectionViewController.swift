//
//  ImageCollectionViewController.swift
//  doggallery
//
//  Created by Gabija on 2021-05-18.
//

import UIKit

class ImageCollectionViewController: UICollectionViewController {
    
    // MARK: - Declarations
    var selectedImage: UIImage!
    let imageDataModel = ImageDataModel(JSONParser())
    
    struct Storyboard {
        static let imageCell = "ImageCollectionViewCell"
        static let imagePreviewControllerSegue = "ImagePreview"
        
        static let horizontalPaddings: CGFloat = 2.0
        static let numberItemsPerRow: CGFloat = 3.0
    }
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let collectionViewWidth = collectionView?.frame.width else {
            return
        }
        
        let imageWidth = (collectionViewWidth - Storyboard.horizontalPaddings) / (Storyboard.numberItemsPerRow)
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: imageWidth, height: imageWidth)
    }
    
    // MARK: - ImageListSize
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageDataModel.calculateImageListSize()
    }
    
    // MARK: - Cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.imageCell, for: indexPath) as! ImageCollectionViewCell
        
        imageDataModel.fetchImage(index: indexPath.item) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async() {
                cell.imageView.image = UIImage(data: data)
            }
        }
        return cell
    }
    
    //MARK: - UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imageDataModel.fetchImage(index: indexPath.item) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            self.selectedImage = UIImage(data: data)
            
            DispatchQueue.main.async() {
                self.performSegue(withIdentifier: Storyboard.imagePreviewControllerSegue, sender: self.selectedImage)
            }
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.imagePreviewControllerSegue {
            let imagePreviewViewController = segue.destination as! ImagePreviewViewController
            imagePreviewViewController.image = selectedImage
        }
    }
}
