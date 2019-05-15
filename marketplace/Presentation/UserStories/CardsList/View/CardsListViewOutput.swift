//
//  CardsListCardsListViewOutput.swift
//  marketplace
//
//  Created by landil on 30/04/2019.
//  Copyright © 2019 myself. All rights reserved.
//

enum RequestType {
    case search
    case cards
}

protocol CardsListViewOutput {
    
    /**
     @author landil
     Notify presenter that view is ready
     */
    
    var cardsList : [Card] { get }
    var offset: Int { get }
    
    var _requestType: RequestType { get set }
    
    func viewIsReady()
    func refreshView()
    func loadMoreCards()
    func obtainSearchResults(for searchString: String)
    
}
