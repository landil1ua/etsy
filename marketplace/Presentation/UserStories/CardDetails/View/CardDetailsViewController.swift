//
//  CardDetailsCardDetailsViewController.swift
//  marketplace
//
//  Created by landil on 08/05/2019.
//  Copyright © 2019 myself. All rights reserved.
//

import UIKit

class CardDetailsViewController: UIViewController, CardDetailsViewInput {

    var output: CardDetailsViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: CardDetailsViewInput
    func setupInitialState() {
    }
}
