//
//  ContentView.swift
//  SeaCreatures
//
//  Created by Justin Hold on 4/30/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
	
	// MARK: - PROPERTIES
	@State private var selectedCreature: SeaCreatureModel?
	@Environment(\.openWindow) private var openWindow
	
	private var seaCreatures = [
		SeaCreatureModel(name: "Clam", modelName: "ClamScene"),
		SeaCreatureModel(name: "Fish", modelName: "FishScene"),
		SeaCreatureModel(name: "Slug", modelName: "SlugScene"),
		SeaCreatureModel(name: "Starfish", modelName: "StarfishScene")
	]
	
	
	// MARK: - VIEW BODY
    var body: some View {
		NavigationSplitView {
			List(seaCreatures) { creature in
				Button(action: {
					selectedCreature = creature
				}, label: {
					Text(creature.name)
				})
			}
			.navigationTitle("SeaCreatures")
		} detail: {
			if let selectedCreature {
				Model3D(
					named: selectedCreature.modelName,
					bundle: realityKitContentBundle
				)
				.navigationTitle(selectedCreature.name)
				.toolbar {
					Button(action: {
						openWindow(
							id: "creatureWindow",
							value: selectedCreature.modelName
						)
					},
						   label: {
						Text("View \(selectedCreature.name)")
					})
				}
			} else {
				Text("Select a Sea Creature")
			}
		}
		.frame(minWidth: 700, minHeight: 700)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
