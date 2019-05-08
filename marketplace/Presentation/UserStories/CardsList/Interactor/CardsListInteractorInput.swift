//
//  CardsListCardsListInteractorInput.swift
//  marketplace
//
//  Created by landil on 07/05/2019.
//  Copyright © 2019 myself. All rights reserved.
//

import Foundation

protocol CardsListInteractorInput {
    func fetchCardsData()
    func fetchSearchResults(for searchString: String)
}
