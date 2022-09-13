//
//  DetailsViewController.swift
//  10-Landmark-Book-App
//
//  Created by Osman Emre Ömürlü on 13.09.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var landmarkName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landmarkName.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
        
    }
}
