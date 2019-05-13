//
//  CardsListCardsListViewInput.swift
//  marketplace
//
//  Created by landil on 07/05/2019.
//  Copyright © 2019 myself. All rights reserved.
//

protocol CardsListViewInput: class {
    
    /**
     @author landil
     Setup initial state of the view
     */
    
    func setupInitialState()
    
    func showCards(cards: [Card])
    func showError(error: ResponseError)
    
    func stopRefreshing()
}
