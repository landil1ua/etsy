//
//  ImageViewExtension.swift
//  marketplace
//
//  Created by Dmitriy on 5/8/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation
import UIKit


// extension for loading image from URL in async
extension UIImageView {
    
    func loadImageFromURL(imageURL: String) {
        image = nil
        let queue = OperationQueue()
        guard let url = URL(string: imageURL) else { return }
        queue.addOperation {
            do {
                let data = try Data(contentsOf: url)
                OperationQueue.main.addOperation {
                    self.image = UIImage(data: data)
                }
            } catch {
                return
            }
        }
    }
}
