//
//  AddNewNoteViewController.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 21.01.2023.
//

import UIKit

protocol AddNewNoteVCDelegate: AnyObject,Alert, NavigationPresentable {
    func configureComponents(with note: Note)
    func configureComponents()
}

class AddNewNoteViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var gameNameTextField: UITextField!
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteTextLabel: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    
    //MARK: - Property
    lazy var viewModel = AddNewNoteViewModel()
    class var identifier: String {
        return String(describing: self)
    }
    var note: Note?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad(note: note)
    }
    
    //MARK: - IBAction method
    @IBAction func saveButtonClicked(_ sender: Any) {
        guard  checkTextFields() == true else { return }
        
        let newNote = NewNote(id: UUID().uuidString,
                              gameName: gameNameTextField.text!,
                              title: noteTitleTextField.text!,
                              text: noteTextLabel.text!)
        viewModel.saveNote(newNote: newNote)
    
    }
        
    @IBAction func editButtonClicked(_ sender: Any) {
        guard  checkTextFields() == true else { return }
    }

    private func checkTextFields() -> Bool {
        guard !noteTextLabel.text.isNilOrEmpty,
              !noteTitleTextField.text.isNilOrEmpty,
              !gameNameTextField.text.isNilOrEmpty else {
            showErrorAlert(message: "Label can not empty")
            gameNameTextField.layer.borderWidth = 1
            noteTitleTextField.layer.borderWidth = 1
            noteTextLabel.layer.borderWidth = 1
            gameNameTextField.layer.borderColor = UIColor.red.cgColor
            noteTitleTextField.layer.borderColor = UIColor.red.cgColor
            noteTextLabel.layer.borderColor = UIColor.red.cgColor
            return false
        }
        return true
    }
}

extension AddNewNoteViewController: AddNewNoteVCDelegate {
    func configureComponents() {
        titleLabel.text = "Add new note"
        editButton.removeFromSuperview()
    }
    
    func configureComponents(with note: Note) {
        titleLabel.textColor = .systemGreen
        titleLabel.text = "Edit the note"
        saveButton.removeFromSuperview()
        gameNameTextField.text = note.gameName
        noteTitleTextField.text = note.title
        noteTextLabel.text = note.text
    }
}
