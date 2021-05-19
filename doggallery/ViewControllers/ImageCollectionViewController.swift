//
//  ImageCollectionViewController.swift
//  doggallery
//
//  Created by Gabija on 2021-05-18.
//

import UIKit

class ImageCollectionViewController: UICollectionViewController {
    
    struct Storyboard {
        static let imageCell = "ImageCollectionViewCell"
        
        static let horizontalPaddings: CGFloat = 2.0
        static let numberItemsPerRow: CGFloat = 3.0
    }
    
    // MARK: - Methods
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let collectionViewWidth = collectionView?.frame.width else {
            return
        }
        let imageWidth = (collectionViewWidth - Storyboard.horizontalPaddings) / (Storyboard.numberItemsPerRow)
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: imageWidth, height: imageWidth)
        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.imageCell, for: indexPath) as! ImageCollectionViewCell
        return cell
    }
    
}
