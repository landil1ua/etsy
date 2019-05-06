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
    
    fileprivate var _categoryList : [Any] = []

    func viewIsReady() {
        
    }
    
    
}

extension CardsListPresenter {
    
    var categoryList : [Any] {
        return _categoryList
    }

}


//MARK: API methods
extension CardsListPresenter {
    
    func loadCategories () {
        //
            //_categoryList = Response
            //self.view.reloadCollectionView()
        //
    }
    
}
