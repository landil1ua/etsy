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
    
    fileprivate var _cardsList: [Card] = [] {
        willSet {
            self._cardsList.removeAll()
            self.view.showCards(cards: cardsList)
            self.view.stopRefreshing()
        }
    }
    
    
}



extension CardsListPresenter: CardsListViewOutput {
    var cardsList : [Card] {
        return _cardsList
    }
    
    //Don't use this method as a data reloader. We only call this method in viewDidLoad in the ViewController. If you want to reload the data, please create a new method for this.
    func viewIsReady() {
        interactor.fetchCardsData()
    }
    
}

extension CardsListPresenter: CardsListInteractorOutput {
    
    //Don't use get/set in method names.
    func getSearchResults(for searchString: String) {
        interactor.fetchSearchResults(for: searchString)
    }
    
    func cardsFetched(data: [Card]) {
        _cardsList = data
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
