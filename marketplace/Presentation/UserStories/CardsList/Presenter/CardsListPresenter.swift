//
//  CardsListCardsListPresenter.swift
//  marketplace
//
//  Created by landil on 30/04/2019.
//  Copyright © 2019 myself. All rights reserved.
//

import Foundation

class CardsListPresenter: CardsListModuleInput, CardsListViewOutput {
    
    
    init() {
        interactor = CardsListInteractor()
        interactor.output = self
        router = CardsListRouter()
    }
    
    weak var view: CardsListViewController!
    var interactor: CardsListInteractorInput!
    var router: CardsListRouterInput!
    
    fileprivate var _cardsList: [Card] = []
    
    func viewIsReady() {
        interactor.fetchCardsData()
    }
}


extension CardsListPresenter {
    var cardsList : [Card] {
        return _cardsList
    }
}

extension CardsListPresenter: CardsListInteractorOutput {
    func dataFetched(data: [Card]) {
        _cardsList = data
        for i in data {
            print(i.images)
        }
        view.reloadCollectionView()
        
    }
    
    func dataFetchFailed() {
        print("Error")
    }
    
    
}


// API Methods
extension CardsListPresenter {
    
    func loadCards() {
        
    }

}
