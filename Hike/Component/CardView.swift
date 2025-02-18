//
//  CardView.swift
//  Hike
//
//  Created by Isaac Urbina on 2/15/25.
//

import SwiftUI

struct CardView: View {
	
	// MARK: - properties
	
	@State private var imageNumber: Int = 1
	@State private var randomNumber: Int = 1
	@State private var isShowingSheet: Bool = false
	
	// MARK: - functions
	
	func randomImage() {
		print("--- BUTTON WAS PRESSED")
		print("Status: Old Image Number = \(imageNumber)")
		
		repeat {
			randomNumber = Int.random(in: 1...5)
			print("Action: Random Number Generated = \(randomNumber)")
			
		} while randomNumber == imageNumber
		imageNumber = randomNumber
		
		print("Result: New Image Number = \(imageNumber)\n")
	}
	
	var body: some View {
		ZStack {
			CustomBackgroundView()
			
			VStack {
				
				// MARK: - header
				
				VStack(alignment: .leading) {
					HStack {
						Text("Hiking")
							.fontWeight(.black)
							.font(.system(size: 52))
							.foregroundStyle(
								LinearGradient(
									colors: [
										.customGrayLight,
										.customGrayMedium
									],
									startPoint: .top,
									endPoint: .bottom
								)
							)
						
						Spacer()
						
						Button {
							// ACTION: Show a Sheet
							print("The button was pressed.")
							isShowingSheet.toggle()
							
						} label: {
							CustomButtonView()
						}
						.sheet(isPresented: $isShowingSheet) {
							SettingsView()
								.presentationDragIndicator(.visible)
								.presentationDetents([.medium, .large])
						}
					}
					
					Text("Fun and enjoyable outdoor activity for friends and families.")
						.multilineTextAlignment(.leading)
						.italic()
						.foregroundColor(.customGrayMedium)
				}
				.padding(.horizontal, 30)
				
				// MARK: - main content
				
				ZStack {
					CustomCircleView()
					
					Image("image-\(imageNumber)")
						.resizable()
						.scaledToFit()
						.animation(.default, value: imageNumber)
				}
				
				// MARK: - footer
				
				Button {
					// ACTION: Generate a random number
					print("The button was pressed.")
					randomImage()
					
				} label: {
					Text("Explore More")
				}
				.tint(.indigo)
				.font(.title2)
				.fontWeight(.heavy)
				.foregroundStyle(
					LinearGradient(
						colors: [
							.customGreenLight,
							.customGreenMedium
						],
						startPoint: .top,
						endPoint: .bottom
					)
				)
				.buttonStyle(GradientButton())
			}
		}
		.frame(width: 320, height: 570)
	}
}

#Preview {
	CardView()
}
