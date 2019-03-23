//
//  CompetitionsCollectionViewController.swift
//  Ibtikar
//
//  Created by Ahmed Samir AbdElMaaboud on 3/19/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import UIKit


class CompetitionsCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout,UISearchBarDelegate, UISearchResultsUpdating{
 
    
    @IBOutlet var CompetitionsCV: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    var refreshControl = UIRefreshControl()
    //var sentCompCVData : CompetitionsList?
    var competitions : [Competitions]?
    
    

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

    
    @objc func hideKeyBoard(_ sender: UITapGestureRecognizer){
        navigationController?.view.endEditing(true)

        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print ("Search text is  \(searchText)")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
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
        return competitions?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "compititionCellId", for: indexPath) as! CompetitionCollectionViewCell

        let row = indexPath.row
        let DesiredCompetition = competitions?[row]
        cell.decorate(for: DesiredCompetition, in: self)
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
                    backgroundview.backgroundColor = UIColor(red: 85 / 255, green: 85 / 255, blue: 85 / 255, alpha: 0.7)
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
    }
    
    
}


extension CompetitionsCollectionViewController : CompetitionsView{
    func updateCompititonList(filteredList: [Competitions]) {
        competitions = filteredList
    }
    

    
    
}



