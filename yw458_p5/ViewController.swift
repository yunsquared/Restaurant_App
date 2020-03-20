//
//  ViewController.swift
//  yw458_p5
//
//  Created by Yunyun S. Wang on 4/11/19.
//  Copyright © 2019 Yunyun S. Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionView1: UICollectionView! //for restaurant display
    var refreshControl: UIRefreshControl!
    var collectionView2: UICollectionView! //for filter
    var rArray: [Restaurant]!
    var rDisplayArray: [Restaurant]!
    var foodStyleArray: [FoodStyleEnum]!
    var foodStyleArray2: Array<String>!
    
    let restaurantCellReuseIdentifier = "restaurantCellReuseIdentifier"
    let filterCellReuseIdentifier = "filterCellReuseIdentifier"
    let headerReuseIdentifier = "headerReuseIdentifier"

    let padding: CGFloat = 20
    let headerHeight: CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "My Restaurants"
        view.backgroundColor = .white
        
        //creating restaurants
        //let cheeseCakeFactory = Restaurant(imageName: "")
        let cheesecake = Restaurant(imageName: "cheesecake", restaurantName: "Cheese Cake Factory", foodStyle: [FoodStyleEnum.American, FoodStyleEnum.lunch, FoodStyleEnum.dinner, FoodStyleEnum.dessert], foodStyle2: ["American", "lunch", "dinner", "dessert"], price: "$$$")
        let agava = Restaurant(imageName: "agava", restaurantName: "Agava's", foodStyle: [FoodStyleEnum.Mexican, FoodStyleEnum.lunch, FoodStyleEnum.dinner], foodStyle2: ["Mexican", "lunch", "dinner"], price: "$$")
        let mehak = Restaurant(imageName: "mehak", restaurantName: "Mehak", foodStyle: [FoodStyleEnum.Asian, FoodStyleEnum.lunch, FoodStyleEnum.dinner], foodStyle2: ["Asian", "lunch", "dinner"], price: "$$")
        let simeons = Restaurant(imageName: "simeons", restaurantName: "Simeons", foodStyle: [FoodStyleEnum.American, FoodStyleEnum.brunch, FoodStyleEnum.lunch, FoodStyleEnum.dinner], foodStyle2: ["American", "brunch", "lunch", "dinner"], price: "$$")
        let tasteofthai = Restaurant(imageName: "tasteofthai", restaurantName: "Taste of Thai", foodStyle: [FoodStyleEnum.Asian, FoodStyleEnum.lunch, FoodStyleEnum.dinner], foodStyle2: ["Asian", "lunch", "dinner"], price: "$$")
        let establishment = Restaurant(imageName: "establishment", restaurantName: "Establishment", foodStyle: [FoodStyleEnum.American, FoodStyleEnum.dinner, FoodStyleEnum.dessert], foodStyle2: ["American", "dinner", "dessert"], price: "$$$")
        let coltivare = Restaurant(imageName: "coltivare", restaurantName: "Coltivare", foodStyle: [FoodStyleEnum.Italian, FoodStyleEnum.brunch, FoodStyleEnum.dinner], foodStyle2: ["Italian", "brunch", "dinner"], price: "$$$")
        let banfi = Restaurant(imageName: "banfi", restaurantName: "Taverna Banfi's", foodStyle: [FoodStyleEnum.American, FoodStyleEnum.brunch, FoodStyleEnum.dinner], foodStyle2: ["American", "brunch", "dinner"], price: "$$$")
        let ctb = Restaurant(imageName: "ctb", restaurantName: "College Town Bagels", foodStyle: [FoodStyleEnum.American, FoodStyleEnum.brunch, FoodStyleEnum.lunch, FoodStyleEnum.dinner, FoodStyleEnum.dessert], foodStyle2: ["American", "brunch", "lunch", "dinner", "dessert"], price: "$")
        let gildas = Restaurant(imageName: "gildas", restaurantName: "Gilda's", foodStyle: [FoodStyleEnum.Italian, FoodStyleEnum.dinner], foodStyle2: ["Italian", "dinner"], price: "$$")
        rArray = [cheesecake, agava, mehak, simeons, tasteofthai, establishment, coltivare, banfi, ctb, gildas]
        
        rDisplayArray = rArray
        
        foodStyleArray = [.American, .Italian, .Asian, .Mexican, .brunch, .lunch, .dinner, .dessert]
        
        foodStyleArray2 = ["American", "Italian", "Asian", "Mexican", "brunch", "lunch", "dinner", "dessert"]
        
        //setup collectionView (need 2), controls how collection view is implemented
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        
        //filter bar, collection view 2
        let filterBar = UICollectionViewFlowLayout()
        filterBar.scrollDirection = .horizontal
        filterBar.itemSize = CGSize(width: 10, height: 15) //change width here, det cell specs
        filterBar.minimumLineSpacing = padding
        filterBar.minimumInteritemSpacing = padding/2
        
        collectionView1 = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView1.translatesAutoresizingMaskIntoConstraints = false
        collectionView1.backgroundColor = .white
        collectionView1.dataSource = self
        collectionView1.delegate = self
        collectionView1.isScrollEnabled = true
        collectionView1.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: restaurantCellReuseIdentifier)
        view.addSubview(collectionView1)
        
        collectionView2 = UICollectionView(frame: .zero, collectionViewLayout: filterBar)
        collectionView2.translatesAutoresizingMaskIntoConstraints = false
        collectionView2.backgroundColor = .lightGray
        collectionView2.dataSource = self
        collectionView2.delegate = self
        collectionView2.isScrollEnabled = true
        collectionView2.allowsMultipleSelection = true
        collectionView2.register(filterCollectionViewCell.self, forCellWithReuseIdentifier: "filterCellReuseIdentifier")
        view.addSubview(collectionView2)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        
    
        NSLayoutConstraint.activate([
            collectionView2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView2.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            collectionView1.topAnchor.constraint(equalTo: collectionView2.safeAreaLayoutGuide.bottomAnchor),
            collectionView1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView1.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView1.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == collectionView1) {
            return rDisplayArray.count
        }
        else {
            return foodStyleArray.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == collectionView1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: restaurantCellReuseIdentifier, for: indexPath) as! RestaurantCollectionViewCell
            let restaurant = rDisplayArray[indexPath.item] //whenever use cell, will deque it and set up with correct photo
            cell.configure(for: restaurant)
            return cell
            //have not yet registered collectionView with this identifier
        }
            
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterCellReuseIdentifier, for: indexPath) as! filterCollectionViewCell
            let foodStyle = foodStyleArray![indexPath.item]
            cell.configure(Name: foodStyle)
            //let foodStyle = foodStyleArray![indexPath.item]
            return cell
        }
    }
}

extension ViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (collectionView == collectionView2 ) {
            //let restaurant = rArray[indexPath.item]
            //rArray.remove(at: indexPath.item) //one corresponding to each restaurant
            //change the color
            //collectionView.indexPathsForSelectedItems
            
            rDisplayArray = []
        
//            for restaurant in rArray {
//                for filter2 in foodStyleArray2 {
//                    if restaurant.foodStyle2.contains(filter2) {
//                        rDisplayArray.append(restaurant)
//                        //rArray.remove(at: rArray.indexat)
//                    }
//                }
//            }
            for restaurant in rArray {
                for filter in foodStyleArray {
                    if restaurant.foodStyle.contains(filter) {
                        rDisplayArray.append(restaurant)
                    }
                }
            }
            //reload collection view
        collectionView.reloadData()
        }
    }

//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        <#code#> //remove one filter (deselect) from the array, re-do everything or one feweer in the array
//        //change color back
//    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let length = (collectionView.frame.width - 2 * padding)/2
        return CGSize(width: length, height: length)
    }
}


