//
//  CustomFooterLoader.swift
//  marketplace
//
//  Created by Dmitriy on 5/15/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation
import UIKit

class CustomFooterLoaderView: UICollectionReusableView {
    
    @IBOutlet weak var refreshControlIndicator: UIActivityIndicatorView!
    var isAnimatingFinish: Bool = false
    var currentTransform: CGAffineTransform?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepareInitialAnimation()
    }
    
    func setTransform(inTransform: CGAffineTransform, scaleFactor: CGFloat) {
        if isAnimatingFinish {
            return
        }
        self.currentTransform = inTransform
        self.refreshControlIndicator.transform = CGAffineTransform.init(scaleX: scaleFactor, y: scaleFactor)
    }
    
    func prepareInitialAnimation() {
        self.isAnimatingFinish = false
        self.refreshControlIndicator.stopAnimating()
        // TODO: Check for what is this method:
        self.refreshControlIndicator.transform = CGAffineTransform.init(scaleX: 0.0, y: 0.0)
    }
    
    func startAnimate() {
        self.isAnimatingFinish = true
        self.refreshControlIndicator.startAnimating()
    }
    
    func stopAnimate() {
        self.isAnimatingFinish = false
        self.refreshControlIndicator.stopAnimating()
    }
    
    func animateFinal() {
        if isAnimatingFinish {
            return
        }
        self.isAnimatingFinish = true
        UIView.animate(withDuration: 0.2) {
            self.refreshControlIndicator.transform = CGAffineTransform.identity
        }
    }
    
    
    
}

