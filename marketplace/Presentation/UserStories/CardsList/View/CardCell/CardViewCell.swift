//
//  CardViewCell.swift
//  marketplace
//
//  Created by Dmitriy on 5/7/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import UIKit

class CardViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var cardImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func returnSize() -> CGSize {
        let width = UIScreen.main.bounds.width
        let height : CGFloat = 100
        
        return CGSize(width: width, height: height)
    }
    
    func configure (with card : Card?) {
        self.cardImage.image = nil
        guard let card = card else {
            return
        }
        self.cardTitle.text = card.title
        
        
        //                    if let cardsList = self.cardsList, let title = cardsList[indexPath.row].title, let imageURL = cardsList[indexPath.row].MainImage.url_fullxfull {
        //                        cell.cardLabel.text = title
        //                        cell.cardImage.loadImageFromURL(imageURL: imageURL)
        //
        //                    }
        
    }
    
}

extension CardViewCell: CellInterface { }
