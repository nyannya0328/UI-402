//
//  CardView.swift
//  UI-402
//
//  Created by nyannyan0328 on 2021/12/23.
//

import SwiftUI

struct CardView: View {
    var user : User
    @EnvironmentObject var model : HomeViewModel
    
    @State var offset : CGFloat = 0
    
    @GestureState var isDragging : Bool = false
    
    @State var endAnimation : Bool = false
    
    var body: some View {
        GeometryReader{proxy in
            
            let size = proxy.size
            
            let index = CGFloat(model.getIndex(user: user))
            
            let topOffset = (index <= 2 ? index : 2) * 15
            
            
            
            
            
            ZStack{
                
            
                Image(user.profilePick)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - topOffset, height: size.height)
                    .cornerRadius(10)
                    .offset(y: -topOffset)
                  
                
                
                
            }
            
            .frame(maxWidth:.infinity,maxHeight: .infinity)
        
            
            
            
            
            
        }
        .rotationEffect(.init(degrees: getRotation(angle: -20)))
        .offset(x: offset)
        .contentShape(Rectangle().trim(from: 0, to: endAnimation ? 0 : 1))
        .gesture(
        
            DragGesture().updating($isDragging, body: { _, out, _ in
                out = true
            })
                .onChanged({ value in
                    
                    
                    let translation = value.translation.width
                    
                    offset = (isDragging ? translation : .zero)
                    
                    
                    
                })
                .onEnded({ value in
                    
                    let width = getRect().width - 50
                    
                    let translation = value.translation.width
                    
                    
                    let chackStatus = (translation > 0 ? translation : -translation)
                    
                    
                    if chackStatus > (width / 2){
                        
                        
                        offset = (translation > 0 ? width : -width) * 2
                        
                        
                        
                       endSwipActions()
                        
                        if translation > 0{
                            
                            
                            rigthSwip()
                        }
                        else{
                            
                            leftSwip()
                        }
                        
                        
                    }
                    
                    else{
                        
                        
                        offset = .zero
                    }
                    
                })
        
        
        )
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("ACTIONFROMBUTTON"), object: nil)) { deta in
            
            
            guard let info = deta.userInfo else{
                
                return
            }
            
            let id = info["id"] as? String ?? ""
            
            let rightSwip = info["RightSwip"] as? Bool ?? false
            
            let width = getRect().width - 50
            
            
            if user.id == id{
                
                
                withAnimation{
                    
                    offset = (rightSwip ? width : -width) * 2
                    
                    
                    endSwipActions()
                    
                    if width > 0{
                        
                        
                        rigthSwip()
                    }
                    else{
                        
                        leftSwip()
                    }
                }
                
            }
            
            
        }
        
    }
    
    func endSwipActions(){
        
        withAnimation(.none){
            
            
            endAnimation = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            
        
            if let _ = model.displayUser?.first{
                
                let _ = withAnimation{
                    
                    model.displayUser?.removeFirst()
                    
                    
                }
                
                
            }
            
            
        }
        
        
        
    }
    
    func rigthSwip(){
        
        
    }
    
    
    func leftSwip(){
        
        
    }
    
    func getRotation(angle : Double) -> Double{
        
        let rotation = (offset / (getRect().width - 50) * angle)
        
        return rotation
        
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}
