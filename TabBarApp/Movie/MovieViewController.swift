//
//  MovieViewController.swift
//  TabBarApp
//
//  Created by Zholbarys on 22.11.2024.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let movies: [Movie] = [
        Movie(title: "The Shawshank Redemption", platform: "Columbia Pictures", releaseYear: 1994, coverImageName: "shawshank", description: "A banker, Andy Dufresne, is sentenced to life in Shawshank State Penitentiary for the murder of his wife and her lover, despite his claims of innocence. During his time at the prison, he befriends Red and finds a way to fight despair."),
        Movie(title: "Inception", platform: "Warner Bros", releaseYear: 2010, coverImageName: "inception", description: "Dom Cobb is a skilled thief with the rare ability to 'extract' information from people's minds while they're dreaming. Now, he must plant an idea into a CEO's mind. A task thought to be impossible: inception."),
        Movie(title: "The Dark Knight", platform: "Warner Bros", releaseYear: 2008, coverImageName: "dark_knight", description: "Batman, Gordon and Harvey Dent are forced to deal with the chaos unleashed by an anarchist mastermind known as the Joker, as he drives Gotham into anarchy and forces Batman closer to crossing the fine line between hero and vigilante."),
        Movie(title: "Pulp Fiction", platform: "Miramax", releaseYear: 1994, coverImageName: "pulp_fiction", description: "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption."),
        Movie(title: "The Godfather", platform: "Paramount Pictures", releaseYear: 1972, coverImageName: "godfather", description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son."),
        Movie(title: "Forrest Gump", platform: "Paramount Pictures", releaseYear: 1994, coverImageName: "forrest_gump", description: "The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart."),
        Movie(title: "The Matrix", platform: "Warner Bros", releaseYear: 1999, coverImageName: "matrix", description: "A computer programmer discovers that reality as he knows it is a simulation created by machines, and joins a rebellion to break free from the system."),
        Movie(title: "Interstellar", platform: "Paramount Pictures", releaseYear: 2014, coverImageName: "interstellar", description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival."),
        Movie(title: "Gladiator", platform: "DreamWorks", releaseYear: 2000, coverImageName: "gladiator", description: "A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery."),
        Movie(title: "The Lion King", platform: "Disney", releaseYear: 1994, coverImageName: "lion_king", description: "Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        tableView.rowHeight = 100
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showMovieDetail", sender: tableView.cellForRow(at: indexPath))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovieDetail" {
            guard let detailVC = segue.destination as? MovieDetailsViewController,
                  let selectedCell = sender as? MovieTableViewCell,
                  let indexPath = tableView.indexPath(for: selectedCell) else { return }
            
            detailVC.movie = movies[indexPath.row]
        }
    }
}
