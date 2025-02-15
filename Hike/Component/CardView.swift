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
			
			ZStack {
				Circle()
					.fill(
						LinearGradient(
							colors: [
								Color("ColorIndigoMedium"),
								Color("ColorSalmonLight")
							],
							startPoint: .topLeading,
							endPoint: UnitPoint.bottomTrailing
						)
					)
					.frame(width: 256, height: 256)
			}
			Image("image-1")
				.resizable()
				.scaledToFit()
		}
		.frame(width: 320, height: 570)
	}
}

#Preview {
    CardView()
}
