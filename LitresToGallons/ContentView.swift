//
//  ContentView.swift
//  LitresToGallons
//
//  Created by Noah Alexandre Soubliere on 2021-12-11.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    @State var litres = 1.0
    
    // MARK: Computed properties
    //Process (the logic) goes here
    var gallons: Double {
        return litres * 0.265
    }
    
    // "body" property is only for input and output
    var body: some View {
        
        
        VStack {
            
            HStack {
                DiagramView(image: "litresToGallons",
                            horizontalPadding: 0)
                
                
                
                
            }
            
            HStack {
                Text("Litres")
                    .bold()
                
                Spacer()
            }
            
            // Input: Measurment in Litres
            Slider(value: $litres,
                   in: 1.0...100.0,
                   step: 0.1,
                   label: {
                Text("Litres:")
            },
                   minimumValueLabel: {
                Text("1")
            },
                   maximumValueLabel: {
                Text("100")
            })
            
            // Output: Measurment in Litres
            Text("\(String(format: "%.2f", litres)) L")
                .bold()
                .padding()
            
            HStack {
                Text("Gallons:")
                    .bold()
                
                Spacer()
            }
            
            // Output: Measurment in Gallons
            Text("\(String(format: "%.2f", gallons)) Gal")
                .bold()
                .padding()
            
            
            
            
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}


