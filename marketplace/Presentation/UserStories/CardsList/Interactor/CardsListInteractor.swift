//
//  CardsListCardsListInteractor.swift
//  marketplace
//
//  Created by landil on 07/05/2019.
//  Copyright © 2019 myself. All rights reserved.
//

class CardsListInteractor: CardsListInteractorInput {
    var output: CardsListPresenter?
    
    let apiElem: APIService?
    
    init() {
        apiElem = APIServiceImpl()
    }
    
    func fetchCardsData() {
        self.apiElem?.getCards { (cards) in
            
            self.output?.dataFetched(data: cards)
        }
    }
    
    

}
