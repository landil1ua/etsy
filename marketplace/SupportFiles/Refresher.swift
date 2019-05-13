//
//  Refresher.swift
//  marketplace
//
//  Created by Dmitriy on 5/13/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation
import UIKit

class Refresher {
    
    // Variables
    private var refreshControl: UIRefreshControl!
    private var presenter: CardsListViewOutput?
    var isRefreshing: Bool {
        return self.refreshControl.isRefreshing
    }
    
    init(presenter: CardsListViewOutput) {
        refreshControl = UIRefreshControl()
        self.presenter = presenter
    }
    
    // Functions
    @objc private func refreshData( _ sender: Any) {
        presenter?.refreshView()
    }
    
    func refresh() {
        self.refreshControl.beginRefreshing()
    }
    
    func stopRefreshing() {
        OperationQueue.main.addOperation {
            if(self.refreshControl.isRefreshing) {
                self.refreshControl.endRefreshing()
                self.refreshControl.isHidden = true
            }
        }
    }
    
    func setupRefreshControl(for collectionView: UICollectionView) {
        //Make a custom UIRefreshControl. Make UIColor extension with all colors that we use in this application.
        
        self.refreshControl = UIRefreshControl()
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(self.refreshData(_:)), for: .valueChanged)
        
        // customizing refresh control
        refreshControl.tintColor = UIColor.greenColor
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Data...")
    }
    
}
