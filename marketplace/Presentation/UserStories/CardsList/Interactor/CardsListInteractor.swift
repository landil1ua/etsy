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

    func fetchCardsData() {
        self.apiService!.getCards { (cards) in
            if(cards.count != 0) { // check results of request
                self.output?.cardsFetched(data: cards)
            } else {
                self.output?.cardsFetchFailed()
            }
        }
        
    }
    
    
}
