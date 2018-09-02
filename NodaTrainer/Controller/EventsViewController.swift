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
    
    let databaseRef = Database.database().reference()
    
    var musicClasses = [MusicClass]()
    var instruments = [Instrument]()
    var data = [
        ["Clase de Piano@40/h@Augusto Leguía",
         "Clase de Piano@25/h@Roberto Locke",
         "Clase de Piano@25/h@Roberto Locke",
        "Clase de Piano@25/h@Roberto Locke",
        "Clase de Piano@25/h@Roberto Locke"],
        ["Piano Roland FP-60@S/.5400@Nuevo",
         "Piano Kawai BI 51@S/.11190.43@Usado/Nuevo",
         "Piano Roland FP-60@S/.5400@Nuevo",
         "Piano Roland FP-60@S/.5400@Nuevo",
         "Piano Roland FP-60@S/.5400@Nuevo",
         "Piano Roland FP-60@S/.5400@Nuevo",
         "Piano Roland FP-60@S/.5400@Nuevo",
         "Piano Roland FP-60@S/.5400@Nuevo",
         "Piano Roland FP-60@S/.5400@Nuevo",
         "Piano Roland FP-60@S/.5400@Nuevo",
         "Piano Roland FP-60@S/.5400@Nuevo",
         "Piano Roland FP-60@S/.5400@Nuevo",
         "Piano Roland FP-60@S/.5400@Nuevo"]
    ]
    
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
        //loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadData()
    }
    
    func loadMusicClasses() {
        self.musicClasses.removeAll()
        databaseRef.child("classes").observe(.childAdded, with: {(snapshot) in
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
                self.tableView.reloadData()
            }
        })
    }
    
    func loadInstruments() {
        self.instruments.removeAll()
        databaseRef.child("instruments").observe(.childAdded, with: {(snapshot) in
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
                self.tableView.reloadData()
            }
        })
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
        
        let userprofilesRef = databaseRef.child("user-profiles").child(uid)
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
        if index == 0 {
            return musicClasses.count
        } else {
            //return data[index].count
            return instruments.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicClassCell") as! MusicClassCell
        if index == 0 {
            let value = musicClasses[indexPath.row]
            cell.musicClassInit(item1: value.title, item2: value.price, item3: value.professor)
        } else {
            //let value = data[index][indexPath.row].components(separatedBy: "@")
            //cell.musicClassInit(item1: value[0], item2: value[1], item3: value[2])
            let value = instruments[indexPath.row]
            cell.musicClassInit(item1: value.name, item2: value.price, item3: value.phone)
        }
        return cell
    }
    
    @IBAction func goToForm(_ sender: Any) {
        if(index == 0) {
            if let controllerTravel = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "musicClassForm") as? MusicClassFormViewController {
                present(controllerTravel, animated: true, completion: nil)
            }
        } else {
            if let controllerTravel = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "instrumentForm") as? InstrumentFormViewController {
                present(controllerTravel, animated: true, completion: nil)
            }
        }
    }
    

    @IBAction func switchEventsAction(_ sender: UISegmentedControl) {
        index = sender.selectedSegmentIndex
        //tableView.reloadData()
        if index == 0 {
            loadMusicClasses()
        } else {
            loadInstruments()
        }
    }
}
