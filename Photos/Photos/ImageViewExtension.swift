//
//  PhotosClassExtensions.swift
//  Photos
//
//  Created by Gauri Tikekar on 6/29/17.
//  Copyright © 2017 Gauri Tikekar. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    
    func getDataFromUrl(url:String, completion: @escaping ((_ data: NSData?) -> Void)) {
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            
            completion(NSData(data: data!))
            }.resume()
        /*URLSession.shared.downloadTask(with: URL.init(string: url)!) { (aURL: URL?, urlResponse: URLResponse?, error: Error?) in
            if let data = try? Data(contentsOf: aURL!){
                completion(NSData(data: data))
            }
            }.resume()*/
    }
    
    func downloadImage(url:String){
        // check for cache
        if let cachedImage = imageCache.object(forKey: url as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        getDataFromUrl(url: url) { data in
            DispatchQueue.main.async() {
                //self.contentMode = UIViewContentMode.scaleAspectFill
                
                self.image = UIImage(data: data! as Data)
                imageCache.setObject(self.image!, forKey: url as AnyObject)
            }
        }
    }
}
