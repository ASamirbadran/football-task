//
//  CompetitionsCollectionViewController.swift
//  Ibtikar
//
//  Created by Ahmed Samir AbdElMaaboud on 3/19/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import UIKit


class CompetitionsCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    @IBOutlet var CompetitionsCV: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    var refreshControl = UIRefreshControl()
    var sentCompCVData : CompetitionsList?

    fileprivate let competitionsPresenter = CompetitionsPresenter(_competitionsService: CompetitionsService())

    
    override func viewDidLoad() {
        super.viewDidLoad()
        CompetitionsCV.delegate = self
        CompetitionsCV.dataSource = self
        //refreshControl = UIRefreshControl()
        addSearchBar()
        competitionsPresenter.attachView(self)
        


   
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
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sentCompCVData?.competitions?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "compititionCellId", for: indexPath) as! CompetitionCollectionViewCell

        let row = indexPath.row
        let DesiredCompetition = sentCompCVData?.competitions?[row]
        cell.decorate(for: DesiredCompetition, in: self)
        if(allowedComIds.contains(DesiredCompetition?.id ?? 0)){
            cell.compName.textColor = UIColor.green
        
        }else{
            cell.compName.textColor = UIColor.red

        }
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        self.performSegue(withIdentifier: "moveToMatchScreen", sender: indexPath.row)

    }


    func addSearchBar() {
        if #available(iOS 11.0, *) {
            let sc = UISearchController(searchResultsController: nil)
            //sc.delegate = self
            let scb = sc.searchBar
            scb.tintColor = UIColor.white
            scb.barTintColor = UIColor.white
            
            if let textfield = scb.value(forKey: "searchField") as? UITextField {
                textfield.textColor = UIColor.blue
                if let backgroundview = textfield.subviews.first {
                    // Background color
                    backgroundview.backgroundColor = UIColor.white
                    // Rounded corner
                    backgroundview.layer.cornerRadius = 10;
                    backgroundview.clipsToBounds = true;
                }
            }
            
            navigationItem.searchController = sc
            navigationItem.hidesSearchBarWhenScrolling = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "moveToMatchScreen") {
            if let CompMatch = segue.destination as? MatchesTableViewController {
                
//                if let button:UIButton = sender as! UIButton? {
//                    let valueToPass = ActiveMissionList[button.tag]
//                    MissionDetails.valueActivePassed = valueToPass
//                    MissionDetails.isActive = true
//                }
                
            }
            
        }
        
    }
    
    
}


extension CompetitionsCollectionViewController : CompetitionsView{

    
    
}
