//
//  CardsListCardsListInteractor.swift
//  marketplace
//
//  Created by landil on 07/05/2019.
//  Copyright © 2019 myself. All rights reserved.
//

class CardsListInteractor {
    
    var output: CardsListPresenter?
    
    var apiService: APIService?
    
}

// MARK: Protocol CardsListInteractorInput
extension CardsListInteractor: CardsListInteractorInput {
    func fetchSearchResults(for searchString: String, offset: Int, limit: Int) {
        
        //[weak self] - Read about it and make changes to this and other methods
        //You can also return an error in the block. Please add it
        
        // TODO: change limit and offset
        self.apiService?.receiveSearchResults(offset: offset, limit: limit, for: searchString, completionHandler: { [weak self] (error, resultsCount, cards) in
            if let error = error {
                self?.output?.cardsFetchFailed(error: error)
            } else if let cards = cards {
                self?.output?.totalResults = resultsCount
                self?.output?.cardsFetched(data: cards)
            }
        })
    }
    
    
    func fetchCardsData(offset: Int, limit: Int) {
        // TODO: change limit and offset
        self.apiService?.receiveCards(offset: offset, limit: limit, completionHandler: { [weak self] (error, resultsCount, cards) in
            if let error = error  {
                self?.output?.cardsFetchFailed(error: error)
            } else if let cards = cards {
                self?.output?.totalResults = resultsCount
                self?.output?.cardsFetched(data: cards)
            }
        })
        
    }
    
    
}
