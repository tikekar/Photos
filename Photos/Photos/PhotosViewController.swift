//
//  PhotosViewController.swift
//  Photos
//
//  Created by Gauri Tikekar on 6/28/17.
//  Copyright © 2017 Gauri Tikekar. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var photos : [Photo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photos = Photo.fetchImages()!
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "PhotoCell") as! PhotosTableViewCell
        cell.photoDictionary = ["photoName" : (photos[indexPath.row].photoName)!, "photoUrl" : (photos[indexPath.row].photoUrl)!]
        
        return cell
    }

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Photo Details" {
            let destinationViewController = segue.destination as! PhotoDetailsViewController
            let cell = sender as! PhotosTableViewCell
            destinationViewController.photoName = cell.photoDictionary?["photoName"]
            destinationViewController.photoImage = cell.photoImageView.image
        }
    }
    

}
