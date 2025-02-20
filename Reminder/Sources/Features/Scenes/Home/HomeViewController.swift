//
//  HomeViewController.swift
//  Reminder
//
//  Created by Marcos Roberto Lemos Veloso on 13/02/25.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    let contentView: HomeView
    public weak var flowDelegate: HomeFlowDelegate?
    
    init(contentView: HomeView, flowDelegate: HomeFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        let logOutButton = UIBarButtonItem(image: UIImage(named: "log-out-icon"), style: .plain, target: self, action: #selector(logoutAction))
        logOutButton.tintColor = Colors.primaryRedBase
        navigationItem.rightBarButtonItem = logOutButton
    }
    
    private func setup() {
        view.addSubview(contentView)
        contentView.delegate = self
        setupContraints()
    }
    
    private func setupContraints() {
        setupContentViewToBounds(contentView: contentView)
    }
    
    @objc
    private func logoutAction() {
        UserDefaultsManager.removeUser()
        self.flowDelegate?.logout()
    }
}

extension HomeViewController: HomeViewDelegate {
    func didTapProfileImage() {
        // call method to present image selector
        selectProfileImage()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func selectProfileImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            contentView.profileImage.image = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            contentView.profileImage.image = originalImage
        }
        
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
