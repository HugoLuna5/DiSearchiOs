//
//  CreatePatientView.swift
//  DiSearch
//
//  Created by Hugo Luna on 24/10/21.
//

import SwiftUI

struct CreatePatientView: View {
    
    @Environment(\.presentationMode) var presentation
    @ObservedObject var createPatientViewModel = CreatePatientViewModel()
    
    var body: some View {
        VStack {
            
            ScrollView {
                
                VStack {
                    
                    
                    HStack {
                        
                        
                        VStack(alignment: .leading) {
                            
                            Text("Name(s)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            ZStack(alignment: .leading) {
                                
                                if createPatientViewModel.name.isEmpty  {
                                    Text("Escribe tu nombre")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                
                                TextField("", text: $createPatientViewModel.name)
                                    .foregroundColor(.gray)
                                
                                
                            }
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
                            
                            ZStack(alignment: .leading) {
                                
                                if createPatientViewModel.last_name.isEmpty  {
                                    Text("Escribe tu nombre")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                
                                TextField("", text: $createPatientViewModel.last_name)
                                    .foregroundColor(.gray)
                                
                                
                            }
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
                        
                        ZStack(alignment: .leading) {
                            
                            if createPatientViewModel.email.isEmpty  {
                                Text("ejemplo@gmail.com")
                                    .font(.caption)
                                    .accentColor(.gray)
                                    .foregroundColor(.gray)
                            }
                            
                            TextField("", text: $createPatientViewModel.email)
                                .foregroundColor(.gray)
                                .accentColor(.gray)
                                .textContentType(.emailAddress)
                                .keyboardType(.emailAddress)
                            
                            
                        }
                        Divider()
                            .frame(height: 1)
                            .background(Color(.gray))
                            .padding(.bottom)
                        
                        Text("Phone")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        ZStack(alignment: .leading) {
                            
                            if createPatientViewModel.phone.isEmpty  {
                                Text("7891002059")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            TextField("", text: $createPatientViewModel.phone)
                                .foregroundColor(.gray)
                                .textContentType(.telephoneNumber)
                                .keyboardType(.phonePad)
                            
                            
                        }
                        Divider()
                            .frame(height: 1)
                            .background(Color(.gray))
                            .padding(.bottom)
                        
                        
                    }
                    
                    
                    VStack(alignment: .leading) {
                        
                        
                        Text("Age")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        ZStack(alignment: .leading) {
                            
                            if createPatientViewModel.age.isEmpty  {
                                Text("Escribe la edad")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            TextField("", text: $createPatientViewModel.age)
                                .foregroundColor(.gray)
                                .textContentType(.telephoneNumber)
                                .keyboardType(.numberPad)
                            
                            
                        }
                        Divider()
                            .frame(height: 1)
                            .background(Color(.gray))
                            .padding(.bottom)
                        
                        
                        Text("Weight")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        ZStack(alignment: .leading) {
                            
                            if createPatientViewModel.weight.isEmpty  {
                                Text("Escribe el peso en Kg")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            TextField("", text: $createPatientViewModel.weight)
                                .foregroundColor(.gray)
                                .keyboardType(.numberPad)
                            
                            
                        }
                        Divider()
                            .frame(height: 1)
                            .background(Color(.gray))
                            .padding(.bottom)
                        
                        
                        VStack(alignment: .leading) {
                            
                            Text("Heigh")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            ZStack(alignment: .leading) {
                                
                                if createPatientViewModel.height.isEmpty  {
                                    Text("Escribe la estatura")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                
                                TextField("", text: $createPatientViewModel.height)
                                    .foregroundColor(.gray)
                                    .keyboardType(.numberPad)
                                
                                
                            }
                            Divider()
                                .frame(height: 1)
                                .background(Color(.gray))
                                .padding(.bottom)
                            
                            
                            Text("Gender")
                                .font(.subheadline)
                                .foregroundColor(.gray)

                            
                            Picker(createPatientViewModel.sex, selection: $createPatientViewModel.sex) {
                                ForEach(createPatientViewModel.typeSex, id: \.self) {
                                    Text($0)
                                        .foregroundColor(.gray)
                                }
                            }
                            .foregroundColor(.gray)
                            .pickerStyle(MenuPickerStyle())
                        
                            Divider()
                                .frame(height: 1)
                                .background(Color(.gray))
                            
                        }
                        
                        
                    }
                    
                    
                    
                    
                    Button(action: {
                        createPatientViewModel.createPatient { res in
                            if res?.status == "error" {
                                createPatientViewModel.titleAlert = "Error"
                                createPatientViewModel.messageAlert = res!.message
                                createPatientViewModel.showDialog = true
                            }else{
                                createPatientViewModel.titleAlert = "Great"
                                createPatientViewModel.messageAlert = res!.message
                                createPatientViewModel.showDialog = true
                                self.presentation.wrappedValue.dismiss()
                            }
                            
                        }
                    }, label: {
                        
                        
                        ZStack {
                            
                            
                            RoundedRectangle(cornerRadius: 26.0)
                                .frame(height: 50)
                                .foregroundColor(Color("accent"))
                            
                            
                            
                            Text("REGISTER")
                                .foregroundColor(.white)
                                .frame(alignment: .leading)
                            
                            
                            
                            
                            
                            
                            
                        }
                        
                        
                    }).padding(.bottom, 15)
                    
                    
                }
                .padding(.horizontal, 35)
                
            }.alert(isPresented: $createPatientViewModel.showDialog){
                
                Alert(title: Text(createPatientViewModel.titleAlert), message: Text(createPatientViewModel.messageAlert), dismissButton: .default(Text("Entendido")))
            }
            
            
        }
    }
}

struct CreatePatientView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePatientView()
    }
}
