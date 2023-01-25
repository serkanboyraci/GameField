//
//  AddNewNoteViewModel.swift
//  GameField
//
//  Created by Ali serkan Boyracı  on 21.01.2023.
//

import Foundation

protocol AddNewNoteViewModelDelegate {
    var view: AddNewNoteVCDelegate? { get }
    
    func viewDidLoad(note: Note?)
    func saveNote(newNote: NewNote)

}

class AddNewNoteViewModel: AddNewNoteViewModelDelegate {
    //MARK: - Property
    weak var view: AddNewNoteVCDelegate?
    
    
    //MARK: - Lifecycle
    func viewDidLoad(note: Note?) {
        configureComponents(with: note)
    }
    
    
    //MARK: - Methods
    func saveNote(newNote: NewNote){
        CoreDataNoteClient.shared.saveNote(newNote: newNote) { [weak self] result in
            switch result {
            case .success(let success):
                self?.view?.showSuccessAlert(message: success.message)
                self?.view?.dismiss()
                CommunicationBetweenModules.shared.post(name: CommunicationMessage.noteListChanged.rawValue)
            case .failure(let error):
                self?.view?.showErrorAlert(message: error.message)
            }
        }
    }
    
    func editNote(newNote: NewNote){
        CoreDataNoteClient.shared.saveNote(newNote: newNote) { [weak self] result in
            switch result {
            case .success(let success):
                self?.view?.showSuccessAlert(message: success.message)
                self?.view?.dismiss()
                CommunicationBetweenModules.shared.post(name: CommunicationMessage.noteListChanged.rawValue)
            case .failure(let error):
                self?.view?.showErrorAlert(message: error.message)
            }
        }
    }
    
    //MARK: - Private Methods
    private func configureComponents(with note: Note?){
        guard let note else {
            view?.configureComponents()
            return
        }
        view?.configureComponents(with: note)
    }
}
