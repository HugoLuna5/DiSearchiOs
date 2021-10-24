//
//  HomeView.swift
//  DiSearch
//
//  Created by Hugo Luna on 22/10/21.
//

import SwiftUI

struct HomeView: View {
    @State var patients = [Patient]()
    @State var goToCreatePatient: Bool = false
    @State var goToPatient: Bool = false
    @ObservedObject var homeViewModel = HomeViewModel()
    @State var selectedPatient: Patient? = nil
    
    
    var body: some View {
        ZStack {
            
            
            List(patients) { item in
                itemPatient(patient: item).onTapGesture {
                    selectedPatient = item
                    self.goToPatient.toggle()
                }
                
            }.refreshable {
                homeViewModel.patients.removeAll()
                homeViewModel.getListUsers { patients in
                    self.patients = patients!
                }
            }
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        goToCreatePatient.toggle()
                    }, label: {
                        Text("+")
                            .font(.system(.largeTitle))
                            .frame(width: 77, height: 70)
                            .foregroundColor(.white)
                            .padding(.bottom, 7)
                    })
                        .background(Color("greenCustom"))
                        .cornerRadius(38.5)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                }
                VStack {
                    NavigationLink(
                        destination: CreatePatientView(),
                        isActive: $goToCreatePatient,
                        label: {
                            EmptyView()
                        }).isDetailLink(false)
                    
                    NavigationLink(
                        destination: PatientView(patient: selectedPatient),
                        isActive: $goToPatient,
                        label: {
                            EmptyView()
                        }).isDetailLink(false)
                    
                    NavigationLink(
                        destination: LoginView(),
                        isActive: $homeViewModel.goToLogin,
                        label: {
                            EmptyView()
                        }).isDetailLink(false)
                    
                }
                
            }
            
        }.toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    homeViewModel.logOut()
                    homeViewModel.goToLogin = true
                    
                } label: {
                    Image(systemName: "iphone.and.arrow.forward")
                        .resizable()
                        
                }

                        }
        })
        .onAppear(perform: {
            homeViewModel.patients.removeAll()
            homeViewModel.getListUsers { patients in
                self.patients = patients!
            }
        })
        .navigationTitle("Patients")
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
    }
}

struct itemPatient: View {
    @State var patient: Patient
   
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(patient.name!+" "+patient.lastname!)
                .font(.title3)
                .padding(5)
            
            
            Text("Age: "+patient.age!)
                .font(.body)
                .padding(5)
           
            
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 80,
                maxHeight: 80,
                alignment: .topLeading)
            .padding(5)
    }
    
    
}

/*
 struct HomeView_Previews: PreviewProvider {
 static var previews: some View {
 HomeView()
 }
 }
 */
