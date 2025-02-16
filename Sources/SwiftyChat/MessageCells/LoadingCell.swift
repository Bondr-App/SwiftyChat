//
//  LoadingCell.swift
//  SwiftyChat
//
//  Created by Karl Söderberg on 16.11.2021.
//  Copyright © 2020 All rights reserved.
//

import SwiftUI

internal struct LoadingCell<Message: ChatMessage>: View {
    
    public let message: Message
    public let size: CGSize
    
    @EnvironmentObject var style: ChatMessageCellStyle
    
    private var cellStyle: TextCellStyle {
        message.isSender ? style.outgoingTextStyle : style.incomingTextStyle
    }
    
    
    private var maxWidth: CGFloat {
        size.width * (UIDevice.isLandscape ? 0.6 : 0.75)
    }
    
    @ViewBuilder public var body: some View {
        LoadingThreeBalls(color: cellStyle.textStyle.textColor, size: .init(width: 40, height: 8))
            .frame(height: 42)
            .foregroundColor(cellStyle.textStyle.textColor)
            .padding(.horizontal, cellStyle.textPadding)
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

struct Loadingcell_Previews: PreviewProvider {
    static var previews: some View {
        LoadingCell(message: MockMessages.generateMessage(kind: .Text), size: .zero)
            .environmentObject(ChatMessageCellStyle.init())
    }
}
