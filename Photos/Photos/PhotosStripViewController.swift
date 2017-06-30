//
//  PhotosStripViewController.swift
//  Photos
//
//  Created by Gauri Tikekar on 6/29/17.
//  Copyright © 2017 Gauri Tikekar. All rights reserved.
//

import UIKit

class PhotosStripViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var filterText: String?
    var filteredPhotos: [Photo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSimilarPhotos()

    }
    
    // Show similar photos strip on the details page. 
    // Eg if image is Red Flowers, then all the images which have red or flowers will show up in the similar list below
    func loadSimilarPhotos() {
        if let allPhotos = Photo.fetchImages() {
            filteredPhotos.removeAll()
            let textArray = filterText?.components(separatedBy: " ")
            if (textArray?.isEmpty)! {
                return
            }
            for i in 0...allPhotos.count-1 {
                if allPhotos[i].photoName == filterText {
                    continue
                }
                for j in 0...(textArray?.count)!-1 {
                    if allPhotos[i].photoName.lowercased().contains((textArray?[j])!.lowercased()) {
                        filteredPhotos.append(allPhotos[i])
                        break
                    }
                }
            }
        }
        collectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosStripCell", for: indexPath) as! PhotosStripCollectionViewCell
        cell.photoName = filteredPhotos[indexPath.row].photoName!
        cell.photoImageView.downloadImage(url: filteredPhotos[indexPath.row].photoUrl!)
        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Photo Details" {
            let destinationViewController = segue.destination as! PhotoDetailsViewController
            let cell = sender as! PhotosStripCollectionViewCell
            destinationViewController.photoName = cell.photoName
            destinationViewController.photoImage = cell.photoImageView.image
        }
    }
    

}
