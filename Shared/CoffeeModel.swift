//
//  CoffeeModel.swift
//  coffeetime
//
//  Created by Tri Nguyen on 26/12/2020.
//

import SwiftUI

class CoffeeModel: ObservableObject {

    let maxAmountOfWater: Double = 1250.0
    let maxAmountOfWaterPerGramCoffee = 25.0
    let maxAmountOfCoffeePerCup = 250.0

    var sliderMaxAmountOfCups: Double {
        get {
            return maxAmountOfWater / amountOfCoffePerCup
        }
    }

    var sliderMaxAmountOfCoffee: Double {
        get {
            return maxAmountOfWater / amountOfWaterPerGramCoffee
        }
    }


    /// Coffee per cup in ml
    @Published var amountOfCoffePerCup: Double = 150.0 {
        didSet {
            updateAll()
        }
    }

    /// Water per gram grounded coffee
    @Published var amountOfWaterPerGramCoffee: Double = 16.5 {
        didSet {
            updateAll()
        }
    }




    /// Coffee cups for current brew
    @Published var amountOfCups: Double = 5.0

    /// Coffe for the brew
    @Published var amountOfCoffee: Double = 50.0 {
        didSet {
            amountOfWater = amountOfCoffee * amountOfWaterPerGramCoffee
            amountOfCups = amountOfWater / amountOfCoffePerCup
        }
    }

    /// Water for current brew
    @Published var amountOfWater: Double = 750.0


    func amountOfCupsUpdated() {
        amountOfWater = amountOfCups * amountOfCoffePerCup
        amountOfCoffee = amountOfWater / amountOfWaterPerGramCoffee
    }

    func amountOfCoffeeUpdated() {
        amountOfWater = amountOfCoffee * amountOfWaterPerGramCoffee
        amountOfCups = amountOfWater / amountOfCoffePerCup
    }

    func amountOfWaterUpdated() {
        amountOfCoffee = amountOfWater / amountOfWaterPerGramCoffee
        amountOfCups = amountOfWater / amountOfCoffePerCup
    }

    func updateAll() {
        amountOfCoffee = amountOfWater / amountOfWaterPerGramCoffee
        amountOfCups = amountOfCoffee * amountOfWaterPerGramCoffee / amountOfCoffePerCup
        amountOfWater = amountOfCups * amountOfCoffePerCup
    }

    func resetSettings() {
        amountOfWaterPerGramCoffee = 16.5
        amountOfCoffePerCup = 150.0

        updateAll()
    }
}
