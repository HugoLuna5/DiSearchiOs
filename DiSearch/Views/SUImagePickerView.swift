//
//  SUImagePickerView.swift
//  DiSearch
//
//  Created by Hugo Luna on 24/10/21.
//

import SwiftUI
import UIKit
import FirebaseStorage

struct SUImagePickerView: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var image: Image?
    @Binding var isPresented: Bool
    @Binding var downloadUrl: String
    @Binding var showProgressBar: Bool
    @Binding var status: String
    
    func makeCoordinator() -> ImagePickerViewCoordinator {
        return ImagePickerViewCoordinator(image: $image, isPresented: $isPresented, downloadUrl: $downloadUrl, showProgressBar: $showProgressBar, status: $status)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.delegate = context.coordinator
        return pickerController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Nothing to update here
    }

}

class ImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var image: Image?
    @Binding var isPresented: Bool
    @Binding var downloadUrl: String
    @Binding var showProgressBar: Bool
    @Binding var status: String
    
    init(image: Binding<Image?>, isPresented: Binding<Bool>, downloadUrl: Binding<String>, showProgressBar: Binding<Bool>, status: Binding<String>) {
        
        self._image = image
        self._isPresented = isPresented
        self._downloadUrl = downloadUrl
        self._showProgressBar = showProgressBar
        self._status = status
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let UiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image = Image(uiImage: UiImage)
            
            
            if let data = UiImage.pngData() {
                
                let storage = Storage.storage()
                let storageRef = storage.reference()
                
                let metadata = StorageMetadata()
                metadata.contentType = "image/png"
        
                let randomName: String = randomString(of: 10)
                let imagesRef = storageRef.child("uploads/\(randomName).png")
                
                
                let uploadTask = imagesRef.putData(data, metadata: metadata)
                
                
                
                
                uploadTask.observe(.success) { snapshot in
                    
                    
                    imagesRef.downloadURL { (url, error) in
                        
                        guard url != nil else {
                              // Uh-oh, an error occurred!
                                self.showProgressBar = false
                                self.status = "Error"
                              return
                        }
                        
                        self.showProgressBar = false
                        self.status = "success"
                        self.downloadUrl = url!.absoluteString
                        
                        
                        
                    }
                    
                    
                }
                
                uploadTask.observe(.failure) { snapshot in
                    
                    self.showProgressBar = false
                    self.status = "Error"
                    
                }
           
            
            }
            
            
        }
        
        
        
        
        
        
        self.isPresented = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
    
    
    func randomString(of length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var s = ""
        for _ in 0 ..< length {
            s.append(letters.randomElement()!)
        }
        return s
    }
    
}
