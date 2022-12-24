//
//  RecipeListViewController.swift
//  Burger
//
//  Created by Tedtya rady on 13/1/22.
//

import UIKit

class RecipeListViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var model = BurgerModel()
    var selectedType: BurgerType?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let burger = model.burgers[indexPath.row]
                let detailVC = segue.destination as? RecipeDetailViewController
                detailVC?.burger = burger
            }
        }
    }

    @IBAction func didChangeFilter(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            selectedType = nil
        case 1:
            selectedType = .meat
        case 2:
            selectedType = .vegetarian
        default:
            break;
        }
        
        tableView.reloadData()
    }
    
}


extension RecipeListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.burgers(forType: selectedType).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BurgerCell", for: indexPath)
        
        let burger = model.burgers(forType: selectedType)[indexPath.row];
        
        cell.textLabel?.text = burger.name
        cell.detailTextLabel?.text = burger.ingredients
        cell.imageView?.image = UIImage(named: burger.thumbnailName)
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
}

extension RecipeListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
