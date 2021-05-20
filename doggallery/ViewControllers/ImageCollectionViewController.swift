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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.imageCell, for: indexPath) as! ImageCollectionViewCell
        
        return cell
    }
    
    //MARK: - UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedImage = UIImage(named: "paw")
        performSegue(withIdentifier: Storyboard.imagePreviewControllerSegue, sender: selectedImage)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.imagePreviewControllerSegue {
            let imagePreviewViewController = segue.destination as! ImagePreviewViewController
            imagePreviewViewController.image = selectedImage
        }
    }
}
