//
//  ImageCellStyle.swift
//  
//
//  Created by Enes Karaosman on 29.07.2020.
//

import SwiftUI

public struct ImageCellStyle: CommonViewStyle {
    
    public var cellWidth: (CGSize) -> CGFloat
    
    // MARK: - CellContainerStyles
    public let cellBackground: any ShapeStyle
    public let cellCornerRadius: CGFloat
    public let cellBorderColor: Color
    public let cellBorderWidth: CGFloat
    public let cellShadowRadius: CGFloat
    public let cellShadowColor: Color
    
    public init(
        cellWidth: @escaping (CGSize) -> CGFloat = { $0.width * (UIDevice.isLandscape ? 0.4 : 0.75) },
        cellBackground: any ShapeStyle = Color.secondary.opacity(0.1),
        cellCornerRadius: CGFloat = 8,
        cellBorderColor: Color = .clear,
        cellBorderWidth: CGFloat = 0,
        cellShadowRadius: CGFloat = 3,
        cellShadowColor: Color = .secondary
    ) {
        self.cellWidth = cellWidth
        self.cellBackground = cellBackground
        self.cellCornerRadius = cellCornerRadius
        self.cellBorderColor = cellBorderColor
        self.cellBorderWidth = cellBorderWidth
        self.cellShadowRadius = cellShadowRadius
        self.cellShadowColor = cellShadowColor
    }
}
