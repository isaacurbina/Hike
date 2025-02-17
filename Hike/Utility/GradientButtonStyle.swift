//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Isaac Urbina on 2/17/25.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
	
	func makeBody(configuration: Configuration) -> some View {
		configuration
			.label
			.padding(.vertical)
			.padding(.horizontal, 30)
			.background(
				configuration.isPressed ? LinearGradient(
					colors: [
						.customGrayMedium,
						.customGrayLight
					],
					startPoint: .top,
					endPoint: .bottom
				) : LinearGradient(
					colors: [
						.customGrayLight,
						.customGrayMedium
					],
					startPoint: .top,
					endPoint: .bottom
				)
			)
			.shadow(
				color: .black.opacity(0.25),
				radius: 0.5,
				x: 1,
				y: 2
			)
			.cornerRadius(40)
	}
}
