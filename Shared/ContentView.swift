//
//  ContentView.swift
//  Shared
//
//  Created by Tri Nguyen on 25/12/2020.
//

import SwiftUI

struct ContentView: View {
    @StateObject var coffeeModel = CoffeeModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(spacing: 20) {
                    VStack {
                        Text("☕️")
                            .font(.system(size: 100))
                    }
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 230,
                        maxHeight: .infinity
                    )
                    .padding(.top, 20)
                    .background(Color.white)

                    VStack(spacing: 20) {

                        VStack(spacing: 25) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Kopper kaffe")
                                        .fontWeight(.semibold)
                                    Spacer()
                                    Text("\(coffeeModel.amountOfCups, specifier: "%.0f") kopper")
                                        .foregroundColor(Color.coffeePrimary)

                                }
                                Slider(
                                    value: Binding(get: {
                                        coffeeModel.amountOfCups
                                    },
                                    set: {
                                        coffeeModel.amountOfCups = $0
                                        coffeeModel.amountOfCupsUpdated()
                                    }),
                                    in: 1...coffeeModel.sliderMaxAmountOfCups,
                                    step: 1
                                )
                            }

                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Mengde kaffe")
                                        .fontWeight(.semibold)
                                    Spacer()
                                    Text("\(coffeeModel.amountOfCoffee, specifier: "%.0f") g")
                                        .foregroundColor(Color.coffeePrimary)

                                }
                                Slider(
                                    value: Binding(get: {
                                        coffeeModel.amountOfCoffee
                                    }, set: {
                                        coffeeModel.amountOfCoffee = $0
                                        coffeeModel.amountOfCoffeeUpdated()
                                    }),
                                    in: 1...coffeeModel.sliderMaxAmountOfCoffee,
                                    step: 1
                                )
                            }

                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Mengde vann")
                                        .fontWeight(.semibold)
                                    Spacer()
                                    Text("\(coffeeModel.amountOfWater, specifier: "%.0f") ml")
                                        .foregroundColor(Color.coffeePrimary)


                                }
                                Slider(
                                    value: Binding(get: {
                                        coffeeModel.amountOfWater
                                    }, set: {
                                        coffeeModel.amountOfWater = $0
                                        coffeeModel.amountOfWaterUpdated()
                                    }),
                                    in: 1...coffeeModel.maxAmountOfWater,
                                    step: 1
                                )
                            }
                        }
                        .padding()
                        .background(Color.white)


                        VStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Innstillinger".uppercased())
                                        .font(.caption)
                                        .fontWeight(.semibold)

                                        .opacity(0.3)

                                    Spacer()

                                    Button(action: {
                                        coffeeModel.resetSettings()
                                    }) {
                                        Text("Tilbakestill innstillinger")
                                            .font(.caption)
                                            .opacity(0.4)
                                    }
                                }
                                .padding(.bottom)

                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Mengde kaffe per kaffekopp")
                                        Spacer()
                                        Text("\(coffeeModel.amountOfCoffePerCup, specifier: "%.0f") ml")
                                            .foregroundColor(Color.coffeePrimary)
                                    }
                                    Slider(value: $coffeeModel.amountOfCoffePerCup, in: 100...250,
                                           step: 10)
                                }

                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Mengde vann per gram kaffe")
                                        Spacer()
                                        Text("\(coffeeModel.amountOfWaterPerGramCoffee, specifier: "%.1f") ml")
                                            .foregroundColor(Color.coffeePrimary)
                                    }
                                    Slider(value: $coffeeModel.amountOfWaterPerGramCoffee, in: 10...25,
                                           step: 0.5)
                                }


                            }
                            .padding()
                        }
                        .background(Color.coffeeLight)
                    }
                }

                VStack {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Hvordan lage god kaffe")
                            .font(.headline)
                            .foregroundColor(Color.coffeePrimary)

                        Text("En kaffekopp er definert til å romme 150ml kaffe. Her har du mulighet til å justere størrelsen på koppen selv etter det som passer.")
                            .font(.caption)

                        Text("Vi regner rundt 16.5ml vann per gram kaffe for et ballansert og fyldig brygg. Husk å tilpass kveringsgrad av kaffen slik at bryggetiden holdes til ~5-6 minutter.")
                            .font(.caption)
                    }
                    .padding()
                    .padding(.top, 20)


                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
    }
}
