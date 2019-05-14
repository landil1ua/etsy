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
    private var refreshControl: Refresher!
    
    
    
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViewController()
        output.viewIsReady()
        refreshControl = Refresher(presenter: self.output)
        refreshControl.setupRefreshControl(for: self.cardsListCollectionView)
        
//        if let flowLayout = cardsListCollectionView.collectionViewLayout as? UICollectionViewFlowLayout, let collectionView = cardsListCollectionView {
//            let w = collectionView.frame.width
//            flowLayout.estimatedItemSize = CGSize(width: w, height: 200)
//        }
        
    }
}

// MARK: CardsListViewInput
extension CardsListViewController : CardsListViewInput {
    func stopRefreshing() {
        refreshControl.stopRefreshing()
    }
    
    func showError(error: ResponseError) {
        let errorAlert = UIAlertController(title: "Error", message: error.errorDescription!, preferredStyle: .alert)
        errorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(errorAlert, animated: true)
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
        //self.setupRefreshControl()
        self.setupActivityIndicator()
        self.setupSearchBar()
    }
    
    func setupCollectionView () {
        self.cardsListCollectionView.register(CardViewCell.cellNib, forCellWithReuseIdentifier: CardViewCell.id)
    }
    
    //    func setupRefreshControl() {
    //        //Make a custom UIRefreshControl. Make UIColor extension with all colors that we use in this application.
    //
    //        self.refreshControl = UIRefreshControl()
    //        self.cardsListCollectionView.refreshControl = refreshControl
    //        refreshControl.addTarget(self, action: #selector(refreshCardsData(_:)), for: .valueChanged)
    //
    //        // customizing refresh control
    //        refreshControl.tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    //        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Data...")
    //    }
    
    func setupActivityIndicator() {
        //Make a custom UIActivityIndicatorView
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

extension CardsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CardViewCell.returnSize()
    }
}


extension CardsListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        output.obtainSearchResults(for: searchText)
    }
}

