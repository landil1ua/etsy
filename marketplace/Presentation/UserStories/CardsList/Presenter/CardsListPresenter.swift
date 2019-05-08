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
    func cardsFetched(data: [Card]) {
        _cardsList = data
        view.showCards(cards: cardsList)
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
