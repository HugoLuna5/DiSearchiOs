//
//  PatientView.swift
//  DiSearch
//
//  Created by Hugo Luna on 24/10/21.
//

import SwiftUI

struct PatientView: View {
    
    @ObservedObject var patientViewModel = PatientViewModel()
    var patient: Patient?
    
    var body: some View {
        ZStack {
            
            ScrollView {
                
                VStack {
                    
                    
                    HStack {
                        
                        
                        VStack(alignment: .leading) {
                            
                            Text("Name(s)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            Text(patientViewModel.name)
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Divider()
                                .frame(height: 1)
                                .background(Color(.gray))
                                .padding(.bottom)
                            
                            
                            
                        }
                        .padding(.trailing, 8)
                        
                        
                        VStack(alignment: .leading) {
                            
                            Text("Last name")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            Text(patientViewModel.last_name)
                                .font(.caption)
                                .foregroundColor(.gray)
                            Divider()
                                .frame(height: 1)
                                .background(Color(.gray))
                                .padding(.bottom)
                            
                            
                            
                        }
                        .padding(.leading, 8)
                        
                        
                        
                    }
                    
                    
                    
                    VStack(alignment: .leading) {
                        
                        
                        Text("Email")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        Text(patientViewModel.email)
                            .font(.caption)
                            .accentColor(.gray)
                            .foregroundColor(.gray)
                        
                        Divider()
                            .frame(height: 1)
                            .background(Color(.gray))
                            .padding(.bottom)
                        
                        Text("Phone")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        Text(patientViewModel.phone)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Divider()
                            .frame(height: 1)
                            .background(Color(.gray))
                            .padding(.bottom)
                        
                        
                    }
                    
                    
                    VStack(alignment: .leading) {
                        
                        
                        Text("Age")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        Text(patientViewModel.age)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Divider()
                            .frame(height: 1)
                            .background(Color(.gray))
                            .padding(.bottom)
                        
                        
                        Text("Weight")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        Text(patientViewModel.weight)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Divider()
                            .frame(height: 1)
                            .background(Color(.gray))
                            .padding(.bottom)
                        
                        
                        VStack(alignment: .leading) {
                            
                            Text("Heigh")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            Text(patientViewModel.height)
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Divider()
                                .frame(height: 1)
                                .background(Color(.gray))
                                .padding(.bottom)
                            
                            
                            Text("Gender")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Text(patientViewModel.sex)
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            
                            Divider()
                                .frame(height: 1)
                                .background(Color(.gray))
                            
                        }
                        
                        
                    }
                    
                    
                    
                }
                .padding(.horizontal, 35)
                .sheet(isPresented: $patientViewModel.isPhotoLibraryActive, content: {
                    
                    SUImagePickerView(sourceType: .photoLibrary, isPresented: $patientViewModel.isPhotoLibraryActive, downloadUrl: self.$patientViewModel.downloadURL, showProgressBar: self.$patientViewModel.showProgressBar, status: self.$patientViewModel.status)
                    
                })
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Menu {
                        
                        Button("Covid 2019", action: {
                            patientViewModel.isPhotoLibraryActive = true
                            patientViewModel.showProgressBar = true
                        })
                        Button("Melanoma", action: {})
                    } label: {
                        Text("+")
                            .font(.system(.largeTitle))
                            .frame(width: 77, height: 70)
                            .foregroundColor(.white)
                            .padding(.bottom, 7)
                    }.background(Color("greenCustom"))
                        .cornerRadius(38.5)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                       
                    
                    
                    
                }
                
            }
            
        }.onAppear {
            patientViewModel.patient = patient
            patientViewModel.loadData()
        }
    }
}

//struct PatientView_Previews: PreviewProvider {
//    static var previews: some View {
//        PatientView()
//    }
//}
