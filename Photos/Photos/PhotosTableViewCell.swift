//
//  PhotosTableViewCell.swift
//  Photos
//
//  Created by Gauri Tikekar on 6/28/17.
//  Copyright © 2017 Gauri Tikekar. All rights reserved.
//

import UIKit
import AFNetworking


class PhotosTableViewCell: UITableViewCell {

   
    @IBOutlet weak var photoNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var photoDictionary: Dictionary<String, String>? {
        didSet {
            photoNameLabel.text = photoDictionary?["photoName"]
            if let imageUrl = photoDictionary?["photoUrl"] {
                //photoImageView.setImageWith(URL(string: imageUrl)!)
                photoImageView.downloadImage(url: imageUrl)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
