//
//  AttractionsTableViewController.swift
//  TainanSightseeingAPI
//
//  Created by 羅承志 on 2021/10/1.
//

import UIKit

class AttractionsTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let attractionsCell = "attractionsCell"
    }
    
    var tourismItem = [TourismItem]()
    
    func fetchAttractionsData() {
        let urlStr = "https://www.twtainan.net/data/attractions_zh-tw.json"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) {
                data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    do {
                        let searchResponse = try decoder.decode([TourismItem].self, from: data)
                        self.tourismItem = searchResponse
                        DispatchQueue.main.async {
                            //將tableView的cell數量reload顯示cell
                            self.tableView.reloadData()
                        }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchAttractionsData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tourismItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.attractionsCell, for: indexPath) as! AttractionsTableViewCell
        let attraction = tourismItem[indexPath.row]
        cell.nameLabel.text = attraction.name
        cell.addressLabel.text = attraction.address
        cell.introduceLabel.text = attraction.introduction
        
        return cell
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
