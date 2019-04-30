//
//  CardsListCardsListInitializer.swift
//  marketplace
//
//  Created by landil on 30/04/2019.
//  Copyright © 2019 myself. All rights reserved.
//

import UIKit

class CardsListModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var cardslistViewController: CardsListViewController!

    override func awakeFromNib() {

        let configurator = CardsListModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: cardslistViewController)
    }

}
