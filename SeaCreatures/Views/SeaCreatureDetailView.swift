//
//  SeaCreatureDetailView.swift
//  SeaCreatures
//
//  Created by Justin Hold on 5/1/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct SeaCreatureDetailView: View {
	
	// MARK: - PROPERTIES
	let modelName: String
	
	@State private var horizontalRotation = CGFloat.zero
	@State private var verticalRotation = CGFloat.zero
	
	@State private var endHorizontalRotation = CGFloat.zero
	@State private var endVerticalRotation = CGFloat.zero
	
	
	// MARK: - VIEW BODY
	var body: some View {
		Model3D(named: modelName, bundle: realityKitContentBundle)
			.rotation3DEffect(
				.degrees(horizontalRotation), axis: .y
			)
			.rotation3DEffect(
				.degrees(-verticalRotation), axis: .x
			)
			.gesture(
				DragGesture()
					.onChanged({ value in
						horizontalRotation = value.translation.width + endHorizontalRotation
						verticalRotation = value.translation.height + endVerticalRotation
					})
					.onEnded({ value in
						endHorizontalRotation = value.translation.width
						endVerticalRotation = value.translation.height
					})
			)
	}
}

#Preview {
	SeaCreatureDetailView(modelName: "Clam")
}
