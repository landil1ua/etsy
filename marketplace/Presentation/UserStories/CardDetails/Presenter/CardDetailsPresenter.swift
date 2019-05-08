//
//  CardDetailsCardDetailsPresenter.swift
//  marketplace
//
//  Created by landil on 08/05/2019.
//  Copyright © 2019 myself. All rights reserved.
//

class CardDetailsPresenter: CardDetailsModuleInput, CardDetailsViewOutput, CardDetailsInteractorOutput {

    weak var view: CardDetailsViewInput!
    var interactor: CardDetailsInteractorInput!
    var router: CardDetailsRouterInput!

    func viewIsReady() {

    }
}
