//
//  CardsListCardsListViewInput.swift
//  marketplace
//
//  Created by landil on 30/04/2019.
//  Copyright © 2019 myself. All rights reserved.
//

protocol CardsListViewInput: class {

    /**
        @author landil
        Setup initial state of the view
    */

    func setupInitialState()
    
    func reloadCollectionView ()
}
