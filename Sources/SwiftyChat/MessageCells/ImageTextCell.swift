//
//  ImageTextCell.swift
//
//
//  Created by Karl Söderberg on 25.10.2021.
//
//

import SwiftUI

internal struct ImageTextCell<Message: ChatMessage>: View {
    
    public let message: Message
    public let imageLoadingType: ImageLoadingKind
    public let text: String
    public let size: CGSize
    @EnvironmentObject var style: ChatMessageCellStyle
    
    private var imageWidth: CGFloat {
        cellStyle.cellWidth(size)
    }
    
    private var cellStyle: ImageTextCellStyle {
        style.imageTextCellStyle
    }
    
    @ViewBuilder private var imageView: some View {
        if case let ImageLoadingKind.local(uiImage) = imageLoadingType {
            let width = uiImage.size.width
            let height = uiImage.size.height
            let isLandscape = width > height
            ImageLoadingKindCell(
                imageLoadingType,
                width: imageWidth,
                height: isLandscape ? nil : height * (imageWidth / width)
            )
        } else {
            ImageLoadingKindCell(
                imageLoadingType,
                width: imageWidth
            )
        }
    }
    
    @ViewBuilder public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            imageView
            Text(text)
                .fontWeight(cellStyle.textStyle.fontWeight)
                .modifier(EmojiModifier(text: text, defaultFont: cellStyle.textStyle.font))
                .lineLimit(nil)
                .foregroundColor(cellStyle.textStyle.textColor)
                .padding(cellStyle.textPadding)
        }
        .background(AnyShapeStyle(cellStyle.cellBackground))
        
        .clipShape(RoundedCornerShape(radius: cellStyle.cellCornerRadius, corners: cellStyle.cellRoundedCorners))
        .overlay(
            
            RoundedCornerShape(radius: cellStyle.cellCornerRadius, corners: cellStyle.cellRoundedCorners)
                .stroke(
                    cellStyle.cellBorderColor,
                    lineWidth: cellStyle.cellBorderWidth
                )
                .shadow(
                    color: cellStyle.cellShadowColor,
                    radius: cellStyle.cellShadowRadius
                )
        )
    }
}
