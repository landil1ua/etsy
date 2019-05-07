//
//  CardsListCardsListViewController.swift
//  marketplace
//
//  Created by landil on 30/04/2019.
//  Copyright © 2019 myself. All rights reserved.
//

import UIKit

class CardsListViewController: UIViewController {
    
    
    var output: CardsListViewOutput!
    
    //var cardsList: [Card] = []
    
    @IBOutlet weak var cardsListCollectionView: UICollectionView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
      let presenter = CardsListPresenter()
        presenter.view = self
        self.output = presenter
        presenter.interactor = CardsListInteractor()
        presenter.interactor.output = presenter
        
        output.viewIsReady()
        self.setupViewController()
        
        
    }
    
    
    // MARK: CardsListViewInput
    func setupInitialState() {
        
    }


    
}


extension CardsListViewController : CardsListViewInput {
    
    func reloadCollectionView() {
        OperationQueue.main.addOperation {
            self.cardsListCollectionView.reloadData()
        }
    }
    
}


fileprivate extension CardsListViewController {
    
    func setupViewController () {
        self.setupCollectionView()
    }
    
    func setupCollectionView () {
        self.cardsListCollectionView.register(CardViewCell.cellNib, forCellWithReuseIdentifier: CardViewCell.id)
    }
    
}

// MARK: CollectionViewDataSource
extension CardsListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return output.cardsList.count
        //return 100
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




// extension for loading image from URL in async
extension UIImageView {
    
    func loadImageFromURL(imageURL: String) {
        image = nil
        let queue = OperationQueue()
        guard let url = URL(string: imageURL) else { return }
        queue.addOperation {
            do {
                let data = try Data(contentsOf: url)
                OperationQueue.main.addOperation {
                    self.image = UIImage(data: data)
                }
            } catch {
                return
            }
        }
    }
}
