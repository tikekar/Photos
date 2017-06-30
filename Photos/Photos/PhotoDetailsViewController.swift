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
    
    @IBOutlet weak var photosStripView: UIView!
    @IBOutlet weak var stripContainerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = photoName
        
        showPhoto()
        
        allowZooming()
        
        // TODO: Use constraints.
        photosStripView.frame = CGRect(x: 0, y: view.frame.height - 20, width: view.frame.width, height: photosStripView.frame.height)
        perform(#selector(showPhotosStrip), with: nil, afterDelay: 1)
    }
    
    // Show photo with fade animation
    func showPhoto() {
        // Fade to normal effect for the image
        photoImageView.alpha = 0.1
        photoImageView.image = photoImage
        UIView.animate(withDuration: 0.6) {
            self.photoImageView.alpha = 1.0
        }
    }
    
    func allowZooming() {
        //Add image zooming
        scrollView.minimumZoomScale = 1;
        scrollView.maximumZoomScale = 6.0;
        scrollView.contentSize = photoImageView.frame.size;
    }
    
    func showPhotosStrip() {
        
        UIView.animate(withDuration: 0.6) {
            self.photosStripView.frame = CGRect(x: 0, y: self.view.frame.height - self.photosStripView.frame.height, width: self.view.frame.width, height: self.photosStripView.frame.height)
        }
    }
    
    func hidePhotosStrip() {
        
        UIView.animate(withDuration: 0.6) {
            self.photosStripView.frame = CGRect(x: 0, y: self.view.frame.height - 20, width: self.view.frame.width, height: self.photosStripView.frame.height)
        }
    }

    @IBAction func onPhotosStripButtonClick(_ sender: Any) {
        if photosStripView.frame.origin.y == view.frame.height - 20 {
            showPhotosStrip()
        }
        else {
            hidePhotosStrip()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImageView
    }
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Photos Strip" {
            let destinationViewController = segue.destination as! PhotosStripViewController
            destinationViewController.filterText = photoName
        }
    }
    

}
