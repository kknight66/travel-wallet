//
//  AddTransitTableViewController.swift
//  Travel Wallet
//
//  Created by Anand Kulkarni on 4/29/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class AddTransitTableViewController: UITableViewController {

    @IBOutlet weak var transitType: UITextField!
    @IBOutlet weak var transitFrom: UITextField!
    @IBOutlet weak var transitTo: UITextField!
    @IBOutlet weak var transitStartDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transitType.delegate = self as? UITextFieldDelegate
        transitFrom.delegate = self as? UITextFieldDelegate
        transitTo.delegate = self as? UITextFieldDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        transitType.resignFirstResponder()
        transitFrom.resignFirstResponder()
        transitTo.resignFirstResponder()
    }
    
    @IBAction func saveTransit(_ sender: Any) {
        let type = transitType.text
        let from = transitFrom.text
        let to = transitTo.text
        let date = transitStartDate.date
        
        if let transit = Transit(type: type, from: from, to: to, date: date) {
            do {
                let managedContext = transit.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            } catch {
                print("Tranist could not be saved")
            }
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}