//
//  GameViewController.swift
//  TabBarApp
//
//  Created by Zholbarys on 21.11.2024.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let games: [VideoGame] = [
       VideoGame(title: "The Legend of Zelda: Breath of the Wild", platform: "Nintendo Switch", releaseYear: 2017, coverImageName: "zelda_botw", description: "Explore a vast open world in this action-adventure game. As Link, you must save Princess Zelda and defeat Calamity Ganon while discovering the secrets of a fallen kingdom."),
       VideoGame(title: "Red Dead Redemption 2", platform: "PS4/Xbox One", releaseYear: 2018, coverImageName: "rdr2", description: "An epic tale of honor and loyalty in the dying days of the outlaw era. Play as Arthur Morgan in this sprawling western adventure from Rockstar Games."),
       VideoGame(title: "God of War", platform: "PS4", releaseYear: 2018, coverImageName: "god_of_war", description: "Journey with Kratos and his son Atreus through Norse mythology. A deeply personal quest that reimagines the God of War series with stunning visuals and emotional storytelling."),
       VideoGame(title: "Super Mario Odyssey", platform: "Nintendo Switch", releaseYear: 2017, coverImageName: "mario_odyssey", description: "Join Mario on a globe-trotting adventure to save Princess Peach. Use your companion Cappy to possess creatures and objects in this innovative 3D platformer."),
       VideoGame(title: "The Last of Us Part II", platform: "PS4", releaseYear: 2020, coverImageName: "last_of_us_2", description: "Experience a brutal, emotional journey of revenge through a post-apocalyptic America. Follow Ellie's quest for justice in this critically acclaimed narrative adventure."),
       VideoGame(title: "Cyberpunk 2077", platform: "PS4/Xbox One/PC", releaseYear: 2020, coverImageName: "cyberpunk", description: "Become a cyberpunk mercenary in the dangerous megalopolis of Night City. Navigate a world of corporate warfare, cybernetic enhancement, and street-level crime."),
       VideoGame(title: "Ghost of Tsushima", platform: "PS4", releaseYear: 2020, coverImageName: "ghost_tsushima", description: "Fight as Jin Sakai to protect Tsushima Island from Mongol invaders. Master the way of the samurai in this visually stunning open-world action game."),
       VideoGame(title: "Hades", platform: "Nintendo Switch/PC", releaseYear: 2020, coverImageName: "hades", description: "Battle out of the Underworld as Zagreus, son of Hades. This roguelike dungeon crawler combines Greek mythology with fast-paced action and compelling character development."),
       VideoGame(title: "Final Fantasy VII Remake", platform: "PS4", releaseYear: 2020, coverImageName: "ff7_remake", description: "Revisit Midgar in this reimagining of the classic RPG. Follow Cloud Strife and the resistance group Avalanche in their fight against the Shinra Corporation."),
       VideoGame(title: "Animal Crossing: New Horizons", platform: "Nintendo Switch", releaseYear: 2020, coverImageName: "animal_crossing", description: "Create your own paradise on a deserted island. Build, craft, and develop your community while making friends with charming animal neighbors in this relaxing life simulation.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: "GameTableViewCell")
        tableView.rowHeight = 100
    }
}

extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell", for: indexPath) as! GameTableViewCell
        let game = games[indexPath.row]
        cell.configure(with: game)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showGameDetail", sender: tableView.cellForRow(at: indexPath))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGameDetail" {
            guard let detailVC = segue.destination as? GameDetailsViewController,
                  let selectedCell = sender as? GameTableViewCell,
                  let indexPath = tableView.indexPath(for: selectedCell) else { return }
            
            detailVC.game = games[indexPath.row]
        }
    }
}
