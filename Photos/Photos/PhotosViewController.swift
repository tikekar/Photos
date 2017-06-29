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
    var photos : [Photo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.keyboardDismissMode =  UIScrollViewKeyboardDismissMode.onDrag
        loadPhotos()
    }
    
    func loadPhotos() {
        if (searchBar.text?.isEmpty)! {
            photos = Photo.fetchImages()!
        }
        else {
            var i = 0
            while i < photos.count {
                if !photos[i].photoName.contains(searchBar.text!) {
                    photos.remove(at: i)
                }
                else {
                    i = i + 1
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
        
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "PhotoCell") as! PhotosTableViewCell
        cell.photoDictionary = ["photoName" : (photos[indexPath.row].photoName)!, "photoUrl" : (photos[indexPath.row].photoUrl)!]
        
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
