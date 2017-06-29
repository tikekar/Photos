//
//  PhotosViewController.swift
//  Photos
//
//  Created by Gauri Tikekar on 6/28/17.
//  Copyright © 2017 Gauri Tikekar. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var allPhotos : [Photo] = [] //Store all the photos
    var filteredPhotos : [Photo] = [] //Copy the photos from allPhotos here as per the searchtext
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.keyboardDismissMode =  UIScrollViewKeyboardDismissMode.onDrag
        allPhotos = Photo.fetchImages()!
        loadPhotos()
        
    }
    
    // Check the searchbar text and load photos accordingly.
    func loadPhotos() {
        
        filteredPhotos.removeAll()
        if (searchBar.text?.isEmpty)! {
            filteredPhotos = allPhotos
        }
        else {
            for i in 0...allPhotos.count-1 {
                if allPhotos[i].photoName.lowercased().contains(searchBar.text!.lowercased()) {
                    filteredPhotos.append(allPhotos[i])
                }
            }
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredPhotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "PhotoCell") as! PhotosTableViewCell
        cell.photoDictionary = ["photoName" : (filteredPhotos[indexPath.row].photoName)!, "photoUrl" : (filteredPhotos[indexPath.row].photoUrl)!]
        
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        loadPhotos()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        loadPhotos()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        loadPhotos()
        
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
