//
//  CardDetailsCardDetailsConfigurator.swift
//  marketplace
//
//  Created by landil on 08/05/2019.
//  Copyright © 2019 myself. All rights reserved.
//

import UIKit

class CardDetailsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CardDetailsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CardDetailsViewController) {

        let router = CardDetailsRouter()

        let presenter = CardDetailsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CardDetailsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
