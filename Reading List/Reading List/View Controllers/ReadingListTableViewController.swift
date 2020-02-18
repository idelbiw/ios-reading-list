//
//  ReadingListTableViewController.swift
//  Reading List
//
//  Created by Waseem Idelbi on 2/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ReadingListTableViewController: UITableViewController {
    
    var bookController = BookController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let detailVC = segue.destination as? BookDetailViewController else {return}
        if segue.identifier == "AddBookSegue" {
            detailVC.bookController  = bookController
        } else if segue.identifier == "ShowBookSegue" {
            detailVC.bookController = bookController
            detailVC.book = bookFor(indexPath: self.tableView!.indexPathForSelectedRow!)
        }
    }
    
    // MARK: - Table view data source-
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var arrayCount = 0
        if section == 0 {
            arrayCount = bookController.readBooks.count
        } else if section == 1 {
            arrayCount = bookController.unreadBooks.count
        }
        return arrayCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookCell else { return UITableViewCell() }
        cell.delegate = self
        cell.book = bookFor(indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var headerString = ""
        if section == 0 {
            headerString = "Read Books"
        } else {
            headerString = "Unread Books"
        }
        return headerString
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let deletedBook = bookFor(indexPath: indexPath)
        bookController.delete(book: deletedBook)
        tableView.reloadData()
    }
    
    func bookFor(indexPath: IndexPath) -> Book {
        var myBook = Book(reasons: "", title: "")
        if indexPath.section == 0 {
            myBook = bookController.readBooks[indexPath.row]
        } else if indexPath.section == 1 {
            myBook = bookController.unreadBooks[indexPath.row]
        }
        return myBook
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//MARK: - Extensions -

extension ReadingListTableViewController: BookCellDelegate {
    func toggleHasBeenRead(cell: BookCell) {
        bookController.updateHasBeenRead(for: cell.book!)
        tableView.reloadData()
    }
}
