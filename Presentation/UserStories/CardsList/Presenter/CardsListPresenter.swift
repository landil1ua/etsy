//
//  CardsListCardsListPresenter.swift
//  marketplace
//
//  Created by landil on 30/04/2019.
//  Copyright © 2019 myself. All rights reserved.
//

class CardsListPresenter: CardsListModuleInput, CardsListViewOutput, CardsListInteractorOutput {

    weak var view: CardsListViewInput!
    var interactor: CardsListInteractorInput!
    var router: CardsListRouterInput!
    
    fileprivate var _cardsList: [Any] = []

    func viewIsReady() {

    }
}


extension CardsListPresenter {
    var cardsList : [Any] {
        return _cardsList
    }
}


// API Methods
extension CardsListPresenter {
    func loadCards() {
        
    }
}
