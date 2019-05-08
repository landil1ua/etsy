//
//  CardDetailsCardDetailsInitializer.swift
//  marketplace
//
//  Created by landil on 08/05/2019.
//  Copyright © 2019 myself. All rights reserved.
//

import UIKit

class CardDetailsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var carddetailsViewController: CardDetailsViewController!

    override func awakeFromNib() {

        let configurator = CardDetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: carddetailsViewController)
    }

}
