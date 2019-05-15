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
    
    private var _limit: Int = 10 // limit to requests
    private var _offset: Int = 0 // offset to requests
    
    private var _isLoadingOnScroll = false // flag, if need to call method from scrolling or not
    private var searchTerm: String? // need to load more search items when scrolling
    internal var _requestType: RequestType = .cards // type of request (for loading on scroll and for refresh data)
    
    var totalResults: Int? // count of results in response
    
    fileprivate var _cardsList: [Card] = [] {
        willSet {
            self._cardsList.removeAll()
            self.view.showCards(cards: cardsList)
            self.view.stopRefreshing()
        }
    }
    
    private func addOffset() {
        if let totalResults = totalResults {
            if(_offset < totalResults - _limit) {
                _offset += _limit
            } else { return }
        }
    }
    
}



extension CardsListPresenter: CardsListViewOutput {
    var requestType: RequestType  {
        get {
            return _requestType
        }
        set {
            _requestType = newValue
        }
    }
    
    var offset: Int {
        return _offset + _limit - 1
    }
    
    func loadMoreCards() {
        _isLoadingOnScroll = true
        addOffset()
        if(requestType == .cards) {
            interactor.fetchCardsData(offset: _offset, limit: _limit)
        } else if (requestType == .search) {
            interactor.fetchSearchResults(for: searchTerm!, offset: _offset, limit: _limit)
        }
    }
    
    func refreshView() {
        if(requestType == .cards) {
            interactor.fetchCardsData(offset: _offset, limit: _limit)
        } else if (requestType == .search) {
            interactor.fetchSearchResults(for: searchTerm!, offset: _offset, limit: _limit)
        }
    }
    
    var cardsList : [Card] {
        return _cardsList
    }
    
    func viewIsReady() {
        interactor.fetchCardsData(offset: _offset, limit: _limit)
    }
    
}

extension CardsListPresenter: CardsListInteractorOutput {
    
    func obtainSearchResults(for searchString: String) {
        self.searchTerm = searchString
        if(requestType == .cards) {
            _offset = 0
            requestType = .search
        }
        interactor.fetchSearchResults(for: searchString, offset: _offset, limit: _limit)
    }
    
    func cardsFetched(data: [Card]) {
        if(_isLoadingOnScroll) {
            _cardsList += data
            _isLoadingOnScroll = false
        } else {
            _cardsList = data
            view.scrollOnTop()
        }
        
    }
    
    func cardsFetchFailed(error: ResponseError) {
        view.showError(error: error)
    }
    
}



