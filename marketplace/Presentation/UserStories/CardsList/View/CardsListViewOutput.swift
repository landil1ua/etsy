//
//  CardsListCardsListViewOutput.swift
//  marketplace
//
//  Created by landil on 30/04/2019.
//  Copyright © 2019 myself. All rights reserved.
//

protocol CardsListViewOutput {
    
    /**
     @author landil
     Notify presenter that view is ready
     */

    var cardsList : [Card] { get }

    func viewIsReady()
    func getSearchResults(for searchString: String)
    
}
