//
//  CardView.swift
//  Hike
//
//  Created by Isaac Urbina on 2/15/25.
//

import SwiftUI

struct CardView: View {
    var body: some View {
		ZStack {
			CustomBackgroundView()
			
			VStack(alignment: .leading) {
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
						} label: {
							CustomButtonView()
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
					Circle()
						.fill(
							LinearGradient(
								colors: [
									Color(.colorIndigoMedium),
									Color(.colorSalmonLight)
								],
								startPoint: .topLeading,
								endPoint: UnitPoint.bottomTrailing
							)
						)
						.frame(width: 256, height: 256)
					Image("image-1")
						.resizable()
						.scaledToFit()
				}
				
				// MARK: - footer
			}
		}
		.frame(width: 320, height: 570)
	}
}

#Preview {
    CardView()
}
