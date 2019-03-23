//
//  CompetitionsCollectionViewController.swift
//  Ibtikar
//
//  Created by Ahmed Samir AbdElMaaboud on 3/19/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import UIKit


class CompetitionsCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout,UISearchBarDelegate, UISearchResultsUpdating,UISearchControllerDelegate{
 
    
    @IBOutlet var CompetitionsCV: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    var refreshControl = UIRefreshControl()
    //var sentCompCVData : CompetitionsList?
    var competitions : [Competitions]?
    //forsearch
    var isSearchActive  = false
    var searchedcompetitions : [Competitions]?

    
    

    fileprivate let competitionsPresenter = CompetitionsPresenter(_competitionsService: CompetitionsService())

    
    override func viewDidLoad() {
        super.viewDidLoad()
        CompetitionsCV.delegate = self
        CompetitionsCV.dataSource = self
        //refreshControl = UIRefreshControl()
        addSearchBar()
        competitionsPresenter.attachView(self)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyBoard (_:)))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
        
        //work around remove un authorized ids
        competitionsPresenter.FilterList(OriginalCompList: competitions)

    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.reloadData()
    }
    
    @objc func hideKeyBoard(_ sender: UITapGestureRecognizer){
        navigationController?.view.endEditing(true)
        if(isSearchActive){
        }
        view.endEditing(true)
    }
    

    //Mark: UICollectionViewDelegateFlowLayout methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        
        return 15;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        
        return 10;
    }
    
    
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  45
        let collectionViewSize = collectionView.frame.size.width - padding
        if UIDevice.current.userInterfaceIdiom == .pad {
            return CGSize(width: collectionViewSize/3.5, height: collectionViewSize/3)

        }else {
            return CGSize(width: collectionViewSize/2, height: collectionViewSize/1.5)

        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(isSearchActive){
            return searchedcompetitions?.count ?? 0

        }else{
            return competitions?.count ?? 0

        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "compititionCellId", for: indexPath) as! CompetitionCollectionViewCell

        let row = indexPath.row
        if(isSearchActive){
            let DesiredCompetition = searchedcompetitions?[row]
            cell.decorate(for: DesiredCompetition, in: self)
        }else{
            let DesiredCompetition = competitions?[row]
            cell.decorate(for: DesiredCompetition, in: self)
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        self.performSegue(withIdentifier: "moveToMatchScreen", sender: indexPath.row)

    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "moveToMatchScreen") {
            if let CompMatch = segue.destination as? MatchesTableViewController {
                if let index = sender as? Int {
                    let CompIdToPass = competitions?[index].id
                    let latestSeasonYear = competitions?[index].currentSeason?.startDate
                    let compName = competitions?[index].name

                    CompMatch.competitionId = CompIdToPass
                    CompMatch.latestSeasonByYear = latestSeasonYear
                    CompMatch.compitionName = compName ?? "Matches"
                    
                    isSearchActive = false

                }

                
            }
            
        }
        
    }
    func addSearchBar() {
        let sc = UISearchController(searchResultsController: nil)
        let scb = sc.searchBar
        scb.delegate = self

        scb.tintColor = UIColor.white
        scb.barTintColor = UIColor.white
        if #available(iOS 11.0, *) {
            if let textfield = scb.value(forKey: "searchField") as? UITextField {
                textfield.textColor = UIColor.blue
                if let backgroundview = textfield.subviews.first {
                    // Background color
                    backgroundview.backgroundColor = UIColor.lightGray
                    // Rounded corner
                    backgroundview.layer.cornerRadius = 10;
                    backgroundview.clipsToBounds = true;
                }
            }
            
            navigationItem.searchController = sc
            navigationItem.hidesSearchBarWhenScrolling = true
        }else{
            navigationItem.titleView = scb
        }
        
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        searchController.searchBar.becomeFirstResponder()
        searchController.searchBar.showsCancelButton = true
        //self.navigationItem.searchController?.searchBar.delegate = self
        self.definesPresentationContext = true
    }
    
    // MARK: search bar delegate methods

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedcompetitions?.removeAll()
        if var Filteredcompetitions = competitions {
            let count = Filteredcompetitions.count
            for i in 0..<count {
                if let compName = Filteredcompetitions[i].name{
                    if((compName.lowercased().range(of: searchText.lowercased())) != nil){
                       // print("Found \(searchText) in compition name is \(compName)")
                        if (searchedcompetitions?.append(Filteredcompetitions[i])) == nil {
                            searchedcompetitions = [Filteredcompetitions[i]]
                        }
                    }
                }
            }
        }
        //print("filtered array count is : \(searchedcompetitions?.count) ")
        collectionView.reloadData()
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearchActive = true
        collectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearchActive = false
        collectionView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        collectionView.reloadData()
    }
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        if !isSearchActive {
            isSearchActive = true
            collectionView.reloadData()
        }
        
        searchController.searchBar.resignFirstResponder()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearchActive = false

        collectionView.reloadData()
        
    }
}


extension CompetitionsCollectionViewController : CompetitionsView{
    func updateCompititonList(filteredList: [Competitions]) {
        competitions = filteredList
    }
    

    
    
}



