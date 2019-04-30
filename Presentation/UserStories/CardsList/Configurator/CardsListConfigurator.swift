//
//  CardsListCardsListConfigurator.swift
//  marketplace
//
//  Created by landil on 30/04/2019.
//  Copyright © 2019 myself. All rights reserved.
//

import UIKit

class CardsListModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CardsListViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CardsListViewController) {

        let router = CardsListRouter()

        let presenter = CardsListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CardsListInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
