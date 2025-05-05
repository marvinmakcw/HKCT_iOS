//
//  ContentView.swift
//  WarCardGame
//
//  Created by terry on 27/4/2021.
//  Copyright © 2021 Marvin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randPlayerCard = 0
    @State private var randCpuCard = 0
    
    @State private var playerScore = 0
    @State private var CpuScore = 0
    
    @State 	private var won : Bool = false
    
    
    var body: some View {
       	 
        
        
        ZStack{
            
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
        
            VStack {
                Spacer()
                
                
                Image("wcg")
                    .resizable()
                    .frame(width: 350, height: 150)
            
            
                Spacer()
                
                HStack{
                    if self.randPlayerCard < 2{
                        Image("back")
                        .padding(40)
                        
                        
                    }else {Image("card" + String(randPlayerCard))
                        .padding(40)
                    }
                    
                    Spacer()
                    
                    if self.randCpuCard < 2{
                        Image("back")
                        .padding(40)
                        
                    }else {Image("card" + String(randCpuCard))
                        .padding(40)
                    }
                    
                }
                
                Spacer()
                
                HStack{
                    VStack{
                        Text("Player Score")
                            .font(.system(size:25))
                            .bold()
                            .padding(.bottom, 20)
                        Text(String(playerScore))
                        .font(.system(size:25))
                        
                    }
                    .padding(.leading, 20)
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    VStack{
                        Text("CPU Score")
                            .font(.system(size:25))
                            .bold()
                            .padding(.bottom, 20)
                        Text(String(CpuScore))
                        .font(.system(size:25))
                        
                    }
                    .padding(.trailing, 20)
                    .foregroundColor(.white)
                    
                }
                
                Spacer()
                
                
                Button(action: {
                                
                                     
                    if (self.won == false){
                        
                        //Random player & CPU cards
                        self.randPlayerCard = Int.random(in: 2...14)
                        self.randCpuCard = Int.random(in: 2...14)                    //Update scores
                        if self.randPlayerCard > self.randCpuCard {
                            self.playerScore += 1
                        }
                        else if self.randCpuCard > self.randPlayerCard {
                            self.CpuScore += 1
                        }
                        if self.playerScore == 10 || self.CpuScore == 10{
                            self.won = true
                        }
                    }else {
                        // return to home page.
                    }
                                    
                }){
                    if won == true{
                        Image("home").renderingMode(.original)
                        .resizable()
                        .frame(width: 60, height: 60)
                    }else {Image("dealbutton").renderingMode(.original)
                        .resizable()
                        .frame(width: 120, height: 60)                    }
                }
                Spacer()
                
                Button(action: {
                    self.won = false
                    self.randPlayerCard = 0
                    self.randCpuCard = 0
                    
                    self.playerScore = 0
                    self.CpuScore = 0
                                    
                }) {
                    Image("reset").renderingMode(.original)
                    .resizable()
                    .frame(width: 70, height: 70)
                
                }
                
                
                
                
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

