//
//  ImagePreviewViewController.swift
//  doggallery
//
//  Created by Gabija on 2021-05-20.
//

import UIKit

class ImagePreviewViewController: UIViewController {
    
    @IBOutlet weak var imagePreview: UIImageView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePreview.image = image
    }
}
