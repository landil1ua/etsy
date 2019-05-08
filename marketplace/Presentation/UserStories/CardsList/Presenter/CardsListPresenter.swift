//
//  CardsListCardsListPresenter.swift
//  marketplace
//
//  Created by landil on 30/04/2019.
//  Copyright © 2019 myself. All rights reserved.
//

import Foundation

class CardsListPresenter: CardsListModuleInput {

    
    weak var view: CardsListViewInput!
    var interactor: CardsListInteractorInput!
    var router: CardsListRouterInput!
    
    fileprivate var _cardsList: [Card] = []
    
    
}



extension CardsListPresenter: CardsListViewOutput {
    var cardsList : [Card] {
        return _cardsList
    }
    
    func viewIsReady() {
        
        interactor.fetchCardsData()
    }
    
}

extension CardsListPresenter: CardsListInteractorOutput {
    func getSearchResults(for searchString: String) {
        interactor.fetchSearchResults(for: searchString)
    }
    
    func cardsFetched(data: [Card]) {
        _cardsList.removeAll()
        _cardsList = data

        view.showCards(cards: cardsList)
        view.stopRefreshing()
    }
    
    func cardsFetchFailed() {
        view.showError()
    }
    
    
    
    
}



// API Methods
extension CardsListPresenter {
    
    func loadCards() {
        
    }

}
