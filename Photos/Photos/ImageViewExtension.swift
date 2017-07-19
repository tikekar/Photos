//
//  PhotosClassExtensions.swift
//  Photos
//
//  Created by Gauri Tikekar on 6/29/17.
//  Copyright © 2017 Gauri Tikekar. All rights reserved.
//

import UIKit

// Set up the URLCache in the ViewController with higher memory and disk capacity
extension UIImageView {
    
    func getDataFromUrl(url:String, completion: @escaping ((_ data: NSData?) -> Void)) {
        if url.isEmpty {
            return
        }
        
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            
            if data == nil {
                return
            }
            completion(NSData(data: data!))
        }.resume()
    }
    
    func downloadImage(url:String){
        getDataFromUrl(url: url) { data in
            DispatchQueue.main.async() {
                
                self.image = UIImage(data: data! as Data)
            }
        }
    }
}
