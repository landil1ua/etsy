//
//  CardsListCardsListViewController.swift
//  marketplace
//
//  Created by landil on 30/04/2019.
//  Copyright © 2019 myself. All rights reserved.
//

import UIKit

class CardsListViewController: UIViewController {
    
    private var refreshControl: UIRefreshControl!
    
    
    var output: CardsListViewOutput!
    
    @IBOutlet weak var cardsListCollectionView: UICollectionView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViewController()
        output.viewIsReady()

    }
    
    @objc private func refreshCardsData( _ sender: Any) {
        output.viewIsReady()
    }
}

// MARK: CardsListViewInput
extension CardsListViewController : CardsListViewInput {
    func stopRefreshing() {
        OperationQueue.main.addOperation {
            if(self.refreshControl.isRefreshing) {
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    func showError() {
        
    }

    func showCards(cards: [Card]) {
        OperationQueue.main.addOperation {
            self.cardsListCollectionView.reloadData()
        }
    }
    
    func setupInitialState() {
        
    }
    
}


// MARK: ViewController setup methods
fileprivate extension CardsListViewController {
    
    func setupViewController () {
        self.setupCollectionView()
        self.setupRefreshControl()
        
        
    }
    
    func setupCollectionView () {
        self.cardsListCollectionView.register(CardViewCell.cellNib, forCellWithReuseIdentifier: CardViewCell.id)

    }
    
    func setupRefreshControl() {
        self.refreshControl = UIRefreshControl()
        self.cardsListCollectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshCardsData(_:)), for: .valueChanged)
        
        // customizing refresh control
        refreshControl.tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Data...")
    }
    
}

// MARK: CollectionViewDataSource
extension CardsListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return output.cardsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardViewCell.id, for: indexPath) as? CardViewCell {
            cell.configure (with : self.output.cardsList[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}


// MARK: UICollectionViewDelegateFlowLayout
extension CardsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CardViewCell.returnSize()
    }
}
