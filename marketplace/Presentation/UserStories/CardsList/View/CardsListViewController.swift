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
    private var footerView: CustomFooterActivityView!
    
    
    
    
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
    func scrollOnTop() {
        OperationQueue.main.addOperation {
            self.cardsListCollectionView?.scrollToItem(at: IndexPath(item: 0, section: 0),
                                                       at: .top,
                                                       animated: false)
        }
    }
    
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
        self.setupActivityIndicator()
        self.setupSearchBar()
        self.setupFooterLoaderActivityIndicator()
    }
    
    func setupCollectionView () {
        self.cardsListCollectionView.register(CardViewCell.cellNib, forCellWithReuseIdentifier: CardViewCell.id)
        self.cardsListCollectionView.prefetchDataSource = self
    }
    
    
    func setupActivityIndicator() {
        //Make a custom UIActivityIndicatorView
        loadingDataActivityIndicator.hidesWhenStopped = true
        loadingDataActivityIndicator.color = UIColor.orangeColor
        loadingDataActivityIndicator.startAnimating()
    }
    
    func setupSearchBar() {
        searchField.delegate = self
    }
    
    
    func setupFooterLoaderActivityIndicator() {
        self.cardsListCollectionView.register(UINib(nibName: "CustomFooterActivityView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "FooterLoaderActivityView")
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            if let footerView = cardsListCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterLoaderActivityView", for: indexPath) as? CustomFooterActivityView {
                self.footerView = footerView
                return footerView
            }
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionView.elementKindSectionFooter {
            self.footerView.stopAnimate()
        }
    }
    
}

extension CardsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CardViewCell.returnSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width, height: 100)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let threshold   = 50.0 ;
        let contentOffset = scrollView.contentOffset.y; // offset from y = 0
        let contentHeight = scrollView.contentSize.height; // height of all content in collectionView
        let diffHeight = contentHeight - contentOffset;
        let frameHeight = scrollView.bounds.size.height; // screen height
        var triggerThreshold  = Float((diffHeight - frameHeight))/Float(threshold);
        triggerThreshold   =  min(triggerThreshold, 0.0)
        let pullRatio  = min(abs(triggerThreshold),1.0);
        self.footerView?.setTransform(inTransform: CGAffineTransform.identity, scaleFactor: CGFloat(pullRatio))
        if pullRatio >= 1 {
            self.footerView?.animateFinal()
        }
    }
}


extension CardsListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        output.obtainSearchResults(for: searchText)
    }
}

extension CardsListViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        let lastLoadedElementIndex = indexPaths[indexPaths.count - 1].row
        if(lastLoadedElementIndex == (output.offset)) {
            print(lastLoadedElementIndex)
            print(" load more\n\n")
            output.loadMoreCards()
        }
    }
}
