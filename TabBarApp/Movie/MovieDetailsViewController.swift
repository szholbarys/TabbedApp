//
//  MovieDetailsViewController.swift
//  TabBarApp
//
//  Created by Zholbarys on 22.11.2024.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        guard let movie = movie else { return }
        
        title = movie.title
        coverImageView.image = UIImage(named: movie.coverImageName)
        titleLabel.text = movie.title
        platformLabel.text = "Platform: \(movie.platform)"
        yearLabel.text = "Released: \(movie.releaseYear)"
        descriptionLabel.text = movie.description
    }
}
