//
//  SettingsView.swift
//  Hike
//
//  Created by Isaac Urbina on 2/18/25.
//

import SwiftUI

struct SettingsView: View {
	
	
	// MARK: - properties
	
	private let alternateAppIcons: [String] = [
		"AppIcon-MagnifyingGlass",
		"AppIcon-Map",
		"AppIcon-Mushroom",
		"AppIcon-Camera",
		"AppIcon-Backpack",
		"AppIcon-Campfire"
	]
	
	var body: some View {
		
		List {
			Section {
				HStack{
					
					// MARK: - section header
					Spacer()
					Image(systemName: "laurel.leading")
						.font(.system(size: 80, weight: .black))
					
					VStack (spacing: -10){
						Text("Hike")
							.font(.system(size: 66, weight: .black))
						Text("Editors' Choice")
							.fontWeight(.medium)
					}
					
					Image(systemName: "laurel.trailing")
						.font(.system(size: 80, weight: .black))
					Spacer()
				}
				.foregroundStyle(
					LinearGradient(
						colors: [
							.customGreenLight,
							.customGreenMedium,
							.customGreenDark
						],
						startPoint: .top,
						endPoint: .bottom)
				)
				.padding(.top, 8)
				
				VStack(spacing: 8) {
					Text("Where can you find \nperfect tracks?")
						.font(.title2)
						.fontWeight(.heavy)
					
					Text("The hike which looks gorgeous in photos but is even better once you are actully there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
						.font(.footnote)
						.italic()
					
					Text("Dust off the boots! It's time for a walk.")
						.fontWeight(.heavy)
						.foregroundColor(.customGreenMedium)
				}
				.multilineTextAlignment(.center)
				.padding(.bottom, 16)
				.frame(maxWidth: .infinity)
			}
			.listRowSeparator(.hidden)
			
			// MARK: - section icons
			
			Section(
				header: Text("Alternate Icons")
			) {
				ScrollView(.horizontal, showsIndicators: false) {
					
					HStack(spacing: 12) {
						
						ForEach(alternateAppIcons.indices, id: \.self) { item in
							let appIcon = alternateAppIcons[item]
							
							Button {
								print("Icon \(appIcon) was pressed.")
								UIApplication.shared.setAlternateIconName(appIcon) { error in
									if (error != nil) {
										print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
										
									} else {
										print("Success! You have changed the app's icon to \(appIcon)")
									}
								}
								
							} label: {
								
								Image("\(appIcon)-Preview")
									.resizable()
									.scaledToFit()
									.frame(width: 80, height: 80)
									.cornerRadius(16)
							}
							.buttonStyle(.borderless)
							
						}
					}
				}
				.padding(.top, 12)
				
				Text("Choose your favourite app icon from the selection above")
					.frame(minWidth: 0, maxWidth: .infinity)
					.multilineTextAlignment(.center)
					.foregroundColor(.secondary)
					.font(.footnote)
					.padding(.bottom, 12)
			}
			.listRowSeparator(.hidden)
			
			// MARK: - section about
			
			Section(
				header: Text("ABOUT THE APP"),
				footer: HStack {
					Spacer()
					Text("Copyright © All rights reserved. ")
					Spacer()
				}
					.padding(.vertical, 8)
			) {
				CustomListRowView(
					rowLabel: "Application",
					rowIcon: "apps.iphone",
					rowContent: "HIKE",
					rowTintColor: .blue
				)
				CustomListRowView(
					rowLabel: "Compatibility",
					rowIcon: "info.circle",
					rowContent: "iOS, iPadOS",
					rowTintColor: .red
				)
				CustomListRowView(
					rowLabel: "Technology",
					rowIcon: "swift",
					rowContent: "Swift",
					rowTintColor: .orange
				)
				CustomListRowView(
					rowLabel: "Version",
					rowIcon: "gear",
					rowContent: "1.0",
					rowTintColor: .purple
				)
				CustomListRowView(
					rowLabel: "Developer",
					rowIcon: "ellipsis.curlybraces",
					rowContent: "Isaac Urbina",
					rowTintColor: .mint
				)
				CustomListRowView(
					rowLabel: "Designer",
					rowIcon: "paintpalette",
					rowContent: "Robert Petras",
					rowTintColor: .pink
				)
				CustomListRowView(
					rowLabel: "Website",
					rowIcon: "globe",
					rowTintColor: .indigo,
					rowLinkLabel: "Credo Academy",
					rowLinkDestination: "https://credo.academy"
				)
			}
		}
	}
}

#Preview {
	SettingsView()
}
