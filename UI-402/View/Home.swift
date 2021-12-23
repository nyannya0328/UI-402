//
//  Home.swift
//  UI-402
//
//  Created by nyannyan0328 on 2021/12/23.
//

import SwiftUI

struct Home: View {
    @StateObject var model = HomeViewModel()
    var body: some View {
      
        
        VStack{
            
            HStack{
                
                Button {
                    
                } label: {
                    Image("menu")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                        .frame(maxWidth:.infinity,alignment: .leading)
                }

        
                
                
                
            }
            .padding()
            .overlay(
            
            Text("Discover")
                .font(.title.bold())
                .foregroundColor(.gray)
            )
            
            
            ZStack{
                
                
                if let users = model.displayUser{
                    
                    
                    if users.isEmpty{
                        
                       Image("User2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                        
                    }
                    
                    else{
                        
                        ForEach(users.reversed()){user in
                            
                            
                            CardView(user: user)
                                .environmentObject(model)
                        }
                    }
                    
                    
                    
                    
                    
                }
                
                else{
                    
                    ProgressView()
                }
                
                
            }
            .padding()
            .padding(.vertical)
            .padding(.top,30)
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            
            
            
            HStack(spacing:18){
                
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .font(.system(size: 25, weight: .bold))
                        .padding(15)
                        .foregroundColor(.white)
                        .background(Color("Gray"))
                        .clipShape(Circle())
                }
                
                Button {
                    
                    doSwipe()
                } label: {
                    
                    Image(systemName: "xmark")
                        .font(.system(size: 35, weight: .bold))
                        .padding(15)
                        .foregroundColor(.white)
                        .background(Color("Blue"))
                        .clipShape(Circle())
                }
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "star.fill")
                        .font(.system(size: 20, weight: .bold))
                        .padding(15)
                        .foregroundColor(.white)
                        .background(Color("Yellow"))
                        .clipShape(Circle())
                }
                
                Button {
                    
                    doSwipe(rigthSwipe: true)
                    
                } label: {
                    
                    Image(systemName: "suit.heart.fill")
                        .font(.system(size: 35, weight: .bold))
                        .padding(15)
                        .foregroundColor(.white)
                        .background(Color("Pink"))
                        .clipShape(Circle())
                }



                
                
            }
            .padding(.bottom,13)
            .disabled(model.displayUser?.isEmpty ?? false)
            .opacity(model.displayUser?.isEmpty ?? false ? 0.6 : 1)
            
            
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
        
    }
    
    func doSwipe(rigthSwipe : Bool = false){
        
        
        guard let first = model.displayUser?.first else{
            
            return
            
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("ACTIONFROMBUTTON"), object: nil,userInfo:[
            
            "id" : first.id,
            "RightSwip" : rigthSwipe
        
    ])
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
