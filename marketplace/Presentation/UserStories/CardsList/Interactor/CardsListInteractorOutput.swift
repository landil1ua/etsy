//
//  CardsListCardsListInteractorOutput.swift
//  marketplace
//
//  Created by landil on 07/05/2019.
//  Copyright © 2019 myself. All rights reserved.
//

import Foundation

protocol CardsListInteractorOutput: class {
    func dataFetched(data: [Card])
    func dataFetchFailed()
}
