//
//  WeatherForecastWidgetEntryView.swift
//  WeatherForecastWidgetExtension
//
//  Created by Bruno Bencevic on 25.10.2022..
//

import SwiftUI
import WidgetKit

struct WeatherForecastWidgetEntryView : View {
    var entry: WeatherForecastProvider.Entry

    @Environment(\.widgetFamily) var widgetFamily
    
    var body: some View {
        switch widgetFamily {
        case .accessoryCircular:
            WeatherForeacastCircularAccessory(entry: entry)
        case .accessoryInline:
            WeatherForeacastInlineAccessory(entry: entry)
        case .accessoryRectangular:
            WeatherForeacastRectangularAccessory(entry: entry)
        case .systemLarge:
            WeatherForeacastSystemLarge(entry: entry)
        case .systemMedium:
            WeatherForeacastSystemMedium(entry: entry)
        case .systemSmall:
            WeatherForeacastSystemSmall(entry: entry)
        case .systemExtraLarge:
            WeatherForeacastSystemLarge(entry: entry)
        @unknown default:
            Text("Unsupported")
        }
    }
}

struct WeatherForecastWidget_Previews: PreviewProvider {
    
    static let previewFamilies: [WidgetFamily] = [.accessoryCircular, .accessoryInline, .accessoryRectangular, .systemExtraLarge, .systemLarge, .systemMedium, .systemSmall]
    
    static var previews: some View {
        ForEach(Self.previewFamilies, id: \.self) { family in
            WeatherForecastWidgetEntryView(entry: .sample)
                .previewContext(WidgetPreviewContext(family: family))
                .previewDisplayName(String(describing: family))
                .previewMultipleDevices([.iPhone13, .iPhone14Pro])
        }
    }
}
