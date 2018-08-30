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
        //loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadData()
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
        return data[index].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicClassCell") as! MusicClassCell
        let value = data[index][indexPath.row].components(separatedBy: "@")
        cell.musicClassInit(item1: value[0], item2: value[1], item3: value[2])
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
        tableView.reloadData()
    }
}
