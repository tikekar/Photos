//
//  PhotoDetailsViewController.swift
//  Photos
//
//  Created by Gauri Tikekar on 6/28/17.
//  Copyright © 2017 Gauri Tikekar. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    var photoName : String?
    var photoImage: UIImage?
    
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = photoName
        
        photoImageView.alpha = 0.1
        photoImageView.image = photoImage
        UIView.animate(withDuration: 0.6) {
            self.photoImageView.alpha = 1.0
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
