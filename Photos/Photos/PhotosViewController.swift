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
        
        setUpURLCache()
        
        tableView.keyboardDismissMode =  UIScrollViewKeyboardDismissMode.onDrag
        allPhotos = Photo.fetchImages()!
        loadPhotos()
        
    }
    
    // Setting up the URLCache with higher memory and disk capacity for smoother image loading and caching
    // As my image size is pretty large, I need to do this.
    func setUpURLCache() {
        let memoryCapacity = 500 * 1024 * 1024
        let diskCapacity = 500 * 1024 * 1024
        let urlCache = URLCache.init(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: "MyURLCache")
        URLCache.shared = urlCache
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
    
    override func viewWillDisappear(_ animated: Bool) {
        if searchBar.isFirstResponder {
            searchBar.resignFirstResponder()
        }
        super.viewWillDisappear(animated)
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
        cell.resetCellUI()
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
