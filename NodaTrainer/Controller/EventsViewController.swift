//
//  EventsViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 8/25/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var musicClasses = [MusicClass]()
    var instruments = [Instrument]()
    
    var index: Int!
    var business: Bool = false
    
    override func viewDidLoad() {
        print("viewDidLoad")
        super.viewDidLoad()
        let nib = UINib(nibName: "MusicClassCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "musicClassCell")
        tableView.backgroundColor = UIColor.darkGray
        index = 0
        btnAdd.isHidden = true
        tableView.dataSource = self
        loadMusicClasses()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        //tableView.reloadData()
        loadData()
    }
    
    func loadMusicClasses() {
        print("loadMusicClasses")
        self.musicClasses.removeAll()
        Database.database().reference().child("classes").observe(.childAdded, with: {(snapshot) in
            print("observer")
            if let dict = snapshot.value as? [String:Any] {
                print(dict)
                let titleText = dict["title"] as! String
                let priceText = dict["price"] as! String
                let professorText = dict["professor"] as! String
                let phoneText = dict["phone"] as! String
                let descriptionText = dict["description"] as! String
                let commentsText = dict["comments"] as! String
                let imageURL = dict["image"] as! String
                let musicClass = MusicClass(titleText: titleText, priceText: priceText, professorText: professorText, phoneText: phoneText, descriptionText: descriptionText, commentsText: commentsText, imageURL: imageURL)
                self.musicClasses.append(musicClass)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    func loadInstruments() {
        print("loadInstruments")
        self.instruments.removeAll()
        Database.database().reference().child("instruments").observe(.childAdded, with: {(snapshot) in
                print("observer")
                    if let dict = snapshot.value as? [String:Any] {
                        print(dict)
                        let nameText = dict["name"] as! String
                        let stockText = dict["stock"] as! String
                        let priceText = dict["price"] as! String
                        let phoneText = dict["phone"] as! String
                        let discountText = dict["discount"] as! String
                        let descriptionText = dict["description"] as! String
                        let commentsText = dict["comments"] as! String
                        let imageURL = dict["image"] as! String
                        let instrument = Instrument(nameText: nameText, stockText: stockText, priceText: priceText, phoneText: phoneText, discountText: discountText, descriptionText: descriptionText, commentsText: commentsText, imageURL: imageURL)
                        self.instruments.append(instrument)
                    }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
        Database.database().reference().removeAllObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
        Database.database().reference().removeAllObservers()
        Database.database().reference().child("classes").removeAllObservers()
        Database.database().reference().child("instruments").removeAllObservers()
        if index == 0 {
            loadMusicClasses()
        } else {
            loadInstruments()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logOutUser(_ sender: Any) {
        print("button logOut pressed")
        try! Auth.auth().signOut()
        FBSDKLoginManager().logOut()
    }
    
    func loadData() {
        guard let uid = Auth.auth().currentUser?.uid else { return}
        print(uid)
        
        let userprofilesRef = Database.database().reference().child("user-profiles").child(uid)
        print(userprofilesRef)
        
        DispatchQueue.global().async {
            userprofilesRef.observeSingleEvent(of: .value, with: { (snapshot) in
                if let userDict = snapshot.value as? [String:Any] {
                    print(userDict)
                    self.business = (userDict["enabledBusiness"] as? Bool)!
                    print(self.business)
                    if self.business {
                        print("business is true")
                        self.btnAdd.isHidden = false
                    } else {
                        self.btnAdd.isHidden = true
                    }
                }
        })}
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("tableView counting")
        if index == 0 {
            return musicClasses.count
        } else {
            return instruments.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("tableView setting cell")
        print(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicClassCell") as! MusicClassCell
        if index == 0 {
            print(musicClasses.count)
            let value = musicClasses[indexPath.row]
            cell.musicClassInit(item1: value.title, item2: value.price, item3: value.professor)
        } else {
            print(instruments.count)
            let value = instruments[indexPath.row]
            cell.musicClassInit(item1: value.name, item2: value.price, item3: value.phone)
        }
        return cell
    }
    
    @IBAction func goToForm(_ sender: Any) {
        if(index == 0) {
            if let controllerTravel = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "musicClassForm") as? MusicClassFormViewController {
                controllerTravel.view.layoutIfNeeded()
                present(controllerTravel, animated: true, completion: nil)
            }
        } else {
            if let controllerTravel = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "instrumentForm") as? InstrumentFormViewController {
                controllerTravel.view.layoutIfNeeded()
                present(controllerTravel, animated: true, completion: nil)
            }
        }
    }
    

    @IBAction func switchEventsAction(_ sender: UISegmentedControl) {
        print("switchEventsAction")
        index = sender.selectedSegmentIndex
        if index == 0 {
            loadMusicClasses()
        } else {
            loadInstruments()
        }
    }
}
