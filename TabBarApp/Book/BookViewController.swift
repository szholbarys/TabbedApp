//
//  BookViewController.swift
//  TabBarApp
//
//  Created by Zholbarys on 22.11.2024.
//

import UIKit

class BookViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let books: [Book] = [
        Book(title: "1984", publisher: "Penguin Books", releaseYear: 1949, coverImageName: "1984", description: "Set in a totalitarian future society, the story follows Winston Smith, a low-ranking civil servant who rebels against the oppressive rule of The Party and their leader Big Brother. A chilling dystopian masterpiece about surveillance, censorship, and the destruction of truth."),
        Book(title: "To Kill a Mockingbird", publisher: "HarperCollins", releaseYear: 1960, coverImageName: "mockingbird", description: "Through the eyes of Scout Finch, we witness her father Atticus defend a black man wrongly accused of a crime in a small Southern town. A powerful exploration of racial injustice, moral growth, and the loss of innocence."),
        Book(title: "The Great Gatsby", publisher: "Scribner", releaseYear: 1925, coverImageName: "gatsby", description: "Set in the Jazz Age, the novel follows the mysterious millionaire Jay Gatsby and his obsession with his former love Daisy Buchanan. A masterful critique of the American Dream in the Roaring Twenties."),
        Book(title: "Pride and Prejudice", publisher: "Penguin Classics", releaseYear: 1813, coverImageName: "pride", description: "Elizabeth Bennet must navigate issues of manners, upbringing, morality, and marriage in the society of early 19th century England. A witty and romantic masterpiece of the Regency era."),
        Book(title: "The Lord of the Rings", publisher: "Allen & Unwin", releaseYear: 1954, coverImageName: "lotr", description: "In a world of hobbits, elves, and dark forces, Frodo Baggins must undertake a perilous quest to destroy the One Ring and defeat the dark lord Sauron. An epic high-fantasy adventure that defined the genre."),
        Book(title: "Harry Potter and the Philosopher's Stone", publisher: "Bloomsbury", releaseYear: 1997, coverImageName: "harry_potter", description: "An orphaned boy discovers he's a wizard and begins his education at Hogwarts School of Witchcraft and Wizardry. The beginning of an enchanting series that captured the imagination of millions."),
        Book(title: "The Catcher in the Rye", publisher: "Little, Brown", releaseYear: 1951, coverImageName: "catcher", description: "Holden Caulfield's three-day journey through New York City is a raw, honest portrayal of teenage alienation and the search for authenticity. A landmark novel of adolescent angst and rebellion."),
        Book(title: "One Hundred Years of Solitude", publisher: "Harper & Row", releaseYear: 1967, coverImageName: "solitude", description: "The multi-generational saga of the Buendía family in the mythical town of Macondo. A masterwork of magical realism that blends fantasy with Colombian history."),
        Book(title: "The Handmaid's Tale", publisher: "McClelland & Stewart", releaseYear: 1985, coverImageName: "handmaid", description: "In the dystopian Republic of Gilead, Offred is a Handmaid forced to bear children for the ruling class. A haunting vision of a future where women are stripped of their rights."),
        Book(title: "Don Quixote", publisher: "Francisco de Robles", releaseYear: 1605, coverImageName: "quixote", description: "The adventures of an aging gentleman who, driven mad by reading too many chivalric romances, decides to become a knight-errant. Considered the first modern novel and a cornerstone of Western literature.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "BookTableViewCell")
        tableView.rowHeight = 100
    }
}

extension BookViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        let book = books[indexPath.row]
        cell.configure(with: book)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showBookDetail", sender: tableView.cellForRow(at: indexPath))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBookDetail" {
            guard let detailVC = segue.destination as? BookDetailsViewController,
                  let selectedCell = sender as? BookTableViewCell,
                  let indexPath = tableView.indexPath(for: selectedCell) else { return }
            
            detailVC.book = books[indexPath.row]
        }
    }
}
