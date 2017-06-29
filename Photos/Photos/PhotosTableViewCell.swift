//
//  PhotosTableViewCell.swift
//  Photos
//
//  Created by Gauri Tikekar on 6/28/17.
//  Copyright © 2017 Gauri Tikekar. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

   
    @IBOutlet weak var photoNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var photoDictionary: Dictionary<String, String>? {
        didSet {
            photoNameLabel.text = photoDictionary?["photoName"]
            
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
