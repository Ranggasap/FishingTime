//
//  MainView.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 14/05/24.
//

import SwiftUI
import SwiftUICharts
import CoreMotion
import Combine

struct GraphView: View {
    @ObservedObject private var viewModel = MotionViewModel()
    @ObservedObject private var pathViewModel = PathViewModel()
    
    var body: some View {
        VStack{
            MultiLineChartView(
                data:
                    [
                        (viewModel.x, GradientColors.green),
                        (viewModel.y, GradientColors.purple),
                        (viewModel.z, GradientColors.orange)
                    ],
                title: "Motion Graph",
                form: ChartForm.extraLarge,
                dropShadow: false
            )
            .padding(5)
        }
        .onAppear{
            viewModel.startUpdates()
        }
        .onDisappear{
            viewModel.stopUpdates()
        }
    }
    
}


#Preview {
    GraphView()
}
