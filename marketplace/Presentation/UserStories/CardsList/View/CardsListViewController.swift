//
//  CardsListCardsListViewController.swift
//  marketplace
//
//  Created by landil on 30/04/2019.
//  Copyright © 2019 myself. All rights reserved.
//

import UIKit

class CardsListViewController: UIViewController {
    
    // MARK: VIPER linked classes
    var output: CardsListViewOutput!
    
    // MARK: IBOutlets
    @IBOutlet weak var cardsListCollectionView: UICollectionView!
    @IBOutlet weak var searchField: UISearchBar!
    @IBOutlet weak var loadingDataActivityIndicator: UIActivityIndicatorView!
    
    // MARK: Another variables
    private var refreshControl: UIRefreshControl!
    
    
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
            self.loadingDataActivityIndicator.stopAnimating()
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
        self.setupActivityIndicator()
        self.setupSearchBar()
        
        
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
    
    func setupActivityIndicator() {
        loadingDataActivityIndicator.hidesWhenStopped = true
        loadingDataActivityIndicator.color = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        loadingDataActivityIndicator.startAnimating()
    }
    
    func setupSearchBar() {
        searchField.delegate = self
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


extension CardsListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        output.getSearchResults(for: searchText)
    }
    
    
}
