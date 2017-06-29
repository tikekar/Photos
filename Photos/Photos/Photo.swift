//
//  Photo.swift
//  Photos
//
//  Created by Gauri Tikekar on 6/28/17.
//  Copyright © 2017 Gauri Tikekar. All rights reserved.
//

import UIKit

class Photo: NSObject {
    
    var photoName: String!
    var photoUrl: String?
    
    init(aPhotoName: String, aPhotoUrl: String) {
        photoName = aPhotoName
        photoUrl = aPhotoUrl
        
    }
    
    class func fetchImages() -> [Photo]? {
        var photos: [Photo] = []
        var myDict: NSDictionary?
        if let path = Bundle.main.path(forResource: "PhotosList", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        
        if myDict != nil {
            for (key, value) in myDict! {
                photos.append(Photo(aPhotoName: key as! String, aPhotoUrl: value as! String))
            }
        }
        return photos
    }

}
