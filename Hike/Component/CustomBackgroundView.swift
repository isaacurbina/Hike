//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Isaac Urbina on 2/15/25.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
		ZStack {
			// MARK: - 3. Depth
			Color.customGreenDark
				.cornerRadius(40)
				.offset(y: 12)
			
			// MARK: - 2. Light
			Color.customGreenLight
				.cornerRadius(40)
				.offset(y: 3)
				.opacity(0.85)
			
			// MARK: - Surface
			LinearGradient(
				colors: [
					Color.customGreenLight,
					Color.customGreenMedium
				],
				startPoint: .top,
				endPoint: .bottom
			)
			.cornerRadius(40)
		}
    }
}

#Preview {
    CustomBackgroundView()
		.padding()
}
