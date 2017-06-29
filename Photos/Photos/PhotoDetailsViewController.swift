//
//  PhotoDetailsViewController.swift
//  Photos
//
//  Created by Gauri Tikekar on 6/28/17.
//  Copyright © 2017 Gauri Tikekar. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController, UIScrollViewDelegate {

    var photoName : String?
    var photoImage: UIImage?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = photoName
        
        // Fade to normal effect for the image
        photoImageView.alpha = 0.1
        photoImageView.image = photoImage
        UIView.animate(withDuration: 0.6) {
            self.photoImageView.alpha = 1.0
        }
        
        //Add image zooming
        scrollView.minimumZoomScale = 1;
        scrollView.maximumZoomScale = 6.0;
        scrollView.contentSize = photoImageView.frame.size;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImageView
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
