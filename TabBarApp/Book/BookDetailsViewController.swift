//
//  BookDetailsViewController.swift
//  TabBarApp
//
//  Created by Zholbarys on 22.11.2024.
//

import UIKit

class BookDetailsViewController: UIViewController {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        guard let book = book else { return }
        
        title = book.title
        coverImageView.image = UIImage(named: book.coverImageName)
        titleLabel.text = book.title
        publisherLabel.text = "Publisher: \(book.publisher)"
        yearLabel.text = "Published: \(book.releaseYear)"
        descriptionLabel.text = book.description
    }
}
