//
//  CarsViewController.swift
//  Car Inventory
//
//  Created by Arthur Ataide on 2020-03-28.
//  Copyright © 2020 Arthur Ataide. All rights reserved.
//

import UIKit

class CarsViewController: UIViewController {
    
    var segueName: String?

    @IBOutlet weak var createCarsBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
        
        title = "Cars"
        
        if segueName != K.Segues.menuToCarsAdministration {
            self.navigationItem.leftBarButtonItem = nil
        }
        
        // Do any additional setup after loading the view.
    }
    @IBAction func logOutBtnPressed(_ sender: UIBarButtonItem) {
         navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func createButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != K.Segues.carsToAdd {
            let destinationVC = segue.destination as! CarDetailsViewController
            if segueName == K.Segues.menuToCarsAdministration{
                destinationVC.segueName = segueName
            }
        }
    }
}

extension CarsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        return cell
    }
    
}

extension CarsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.Segues.carsToDetails, sender: self)
    }
    
}
