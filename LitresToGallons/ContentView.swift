//
//  ContentView.swift
//  LitresToGallons
//
//  Created by Noah Alexandre Soubliere on 2021-12-11.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    
    
    // what ever the user adds to the text field
    @State var providedLitres = ""
    
    
    
    // MARK: Computed properties
    //Check the input given by the user
    // If possible, return a double
    //otherwise (bad input) return nil
    
    var litres: Double? {
        
        //Test on the provided input
        //1. Ensure that we can simply change the input into a Double
        //2. Ensure that the value as a Double is more then 0
        //with a guard statement we list the things we wish to be true... provide an action to carry out when those
        //conditions are not met.
        guard let litres = Double(providedLitres),
              litres > 0
        else {
            //when we test our failed, we do not have a valid litres# given
            return nil
        }
        //if we get here then we know our litres# is good
        return litres
    }
    
    // attempts to calculate the gallons
    //and if cant... returns nil
    var area: Double? {
        //is the input actually a double, or is it Double?(might be nil)
        
        guard let litres = litres
        else {
            //we didnt have a valid litres#, we cant calculate the area...
            return nil
        }
        
        return Double.pi * litres * 0.265
    }
    
    
    // "body" property is only for input and output
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                DiagramView(image: "litresToGallons",
                            horizontalPadding: 0)
                
                
                //Input: Litres
                Text("Litres:")
                    .bold()
                TextField("Litres", text: $providedLitres, prompt: Text("Please enter a value greater than 0"))
                //Condition       True       False
                    .foregroundColor(litres == nil ? Color.red : Color.primary)
                
                // Output: Gallons
                Text("Gallons:")
                    .bold()
                OutputValueView(value: area, suffix: "gallons")
            }
        }
        .padding(5)
        
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}


