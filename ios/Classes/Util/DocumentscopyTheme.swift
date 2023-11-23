//
//  DocumentscopyTheme.swift
//  oiti_liveness2d
//
//  Created by Gabriel Catelli Goulart on 06/11/23.
//

import OILiveness2D
import OICommons
import OIComponents
import Foundation

extension SwiftOitiLiveness2dPlugin {
    func createCustomization(
        builder: DocumentscopyCustomizationBuilder,
        custom: Dictionary<String,Any>?
    ) -> DocumentscopyCustomizationBuilder {
        builder
            .setLoadingBackgroundColor(.init(hex: custom?["setLoadingBackgroundColor"] as! String))
            .setLoadingSpinner(
                withColor: .init(hex: custom?["setLoadingSpinnerColor"] as! String),
                width: CGFloat(custom?["setLoadingSpinerWidth"] as? Int ?? 1),
                scaleFactor: custom?["setLoadingSpinnerScale"] as? Int ?? 1
            )
        
            .setCaptureBackgroundColor(.init(hex: custom?["setCaptureBackgroundColor"] as! String))
            .setCaptureFrontIndicatorText(custom?["setTextFront"] as! String)
            .setCaptureBackIndicatorText(custom?["setTextBack"] as! String)
            .setCaptureInstructionGuideText(forFront: custom?["setCaptureInstructionGuideTextFront"] as? String, back: custom?["setCaptureInstructionGuideTextBack"] as? String)
            .setCaptureInstructionConfirmationText(custom?["setTextOk"] as! String)
            .setCaptureTakeNewPictureButton(withText: custom?["setCaptureTakeNewPictureButtonText"] as? String)
            .setCaptureInstructionTextColor(.init(hex: custom?["setCaptureInstructionGuideTextColor"] as! String))
            .setCaptureConfirmationMessage(
                withText: custom?["setTextConfirmation"] as? String,
                color: .init(hex:  custom?["setBackgroundOkColor"] as! String)
            )
            .setCaptureBackButtonColors(
                forIcon: .init(hex: custom?["setCaptureBackButtonColorsIcon"] as! String),
                background: .init(hex: custom?["setCaptureBackButtonColorsBackground"] as! String),
                border: .init(hex: custom?["setCaptureBackButtonColorsBorder"] as! String)
            )
            .setCaptureCloseButtonColors(
                forIcon: .init(hex: custom?["setCaptureCloseButtonColorsIcon"] as! String),
                background: .init(hex: custom?["setCaptureCloseButtonColorsBackground"] as! String),
                border: .init(hex: custom?["setCaptureCloseButtonColorsBorder"] as! String)
            )
            .setCaptureFrontIndicatorColor(.init(hex: custom?["setCaptureFrontIndicatorColor"] as! String))
        
            .setCaptureFrontIndicatorFocusedState(
                withImage: nil,
                textColor: .init(hex: custom?["setCaptureFrontIndicatorColor"] as! String)
            )
            .setCaptureFrontIndicatorUnfocusedState(
                withImage: nil,
                textColor: .init(hex: custom?["setCaptureFrontIndicatorUnfocusedStateColor"] as! String)
            )
            .setCaptureBackIndicatorColor(.init(hex: custom?["setCaptureBackIndicatorColor"] as! String))
            .setCaptureBackIndicatorFocusedState(
                withImage: nil,
                textColor: .init(hex: custom?["setCaptureBackIndicatorFocusedStateTextColor"] as! String)
            )
            .setCaptureBackIndicatorUnfocusedState(
                withImage: nil,
                textColor: .init(hex: custom?["setCaptureBackIndicatorUnfocusedStateTextColor"] as! String)
            )
            .setCaptureInstructionTextColor(.init(hex: custom?["setCaptureInstructionTextColor"] as! String))
            .setCapturePreviewBorderColor(
                forCaptured: .init(hex: custom?["setCapturePreviewBorderColorForCapture"] as! String),
                uncapturedState: .init(hex: custom?["setCapturePreviewBorderColorForUncapturedState"] as! String)
            )
            .setCaptureCaptureButtonHighlightedStateColors(
                forIcon: .init(hex: custom?["setCaptureCaptureButtonHighlightedStateColorsIcon"] as! String),
                background: .init(hex: custom?["setCaptureCaptureButtonHighlightedStateColorsBackground"] as! String),
                border: .init(hex: custom?["setCaptureCaptureButtonHighlightedStateColorsBorder"] as! String)
            )
            .setCaptureCaptureButtonNormalStateColors(
                forIcon: .init(hex: custom?["setCaptureCaptureButtonNormalStateColorsIcon"] as! String),
                background: .init(hex: custom?["setCaptureCaptureButtonNormalStateColorsBackground"] as! String),
                border: .init(hex: custom?["setCaptureCaptureButtonNormalStateColorsBorder"] as! String)
            )
            .setCaptureCaptureButtonDisabledStateColors(
                forIcon: .init(hex: custom?["setCaptureCaptureButtonDisabledStateColorsIcon"] as! String),
                background: .init(hex: custom?["setCaptureCaptureButtonDisabledStateColorsBackground"] as! String),
                border: .init(hex: custom?["setCaptureCaptureButtonDisabledStateColorsBorder"] as! String)
            )
            .setCaptureBottomSheetShape(
                withColor: .init(hex: custom?["setCaptureBottomSheetShapeColor"] as! String),
                cornerRadius: CGFloat(custom?["setCaptureBottomSheetShapeCornerRadius"] as? CGFloat ?? 6)
            )
            .setCaptureTakeNewPictureButtonHighlightedStateColors(
                forText: .init(hex: custom?["setCaptureTakeNewPictureButtonHighlightedStateColorsText"] as! String),
                background: .init(hex: custom?["setCaptureTakeNewPictureButtonHighlightedStateColorsBackground"] as! String),
                border: .init(hex: custom?["setCaptureTakeNewPictureButtonHighlightedStateColorsBorder"] as! String)
            )
            .setCaptureTakeNewPictureButtonNormalStateColors(
                forText: .init(hex: custom?["setCaptureTakeNewPictureButtonNormalStateColorsText"] as! String),
                background: .init(hex: custom?["setCaptureTakeNewPictureButtonNormalStateColorsBackground"] as! String),
                border: .init(hex: custom?["setCaptureTakeNewPictureButtonNormalStateColorsBorder"] as! String)
            )
            .setCaptureTakeNewPictureButtonDisabledStateColors(
                forText: .init(hex: custom?["setCaptureTakeNewPictureButtonDisabledStateColorsText"] as! String),
                background: .init(hex: custom?["setCaptureTakeNewPictureButtonDisabledStateColorsBackground"] as! String),
                border: .init(hex: custom?["setCaptureTakeNewPictureButtonDisabledStateColorsBorder"] as! String)
            )
            .setCaptureUsePictureButton(
                withText: custom?["setCaptureUsePictureButtonText"] as? String,
                confirmationText: custom?["setCaptureUsePictureButtonConfirmationText"] as? String
            )
            .setCaptureUsePictureButtonHighlightedStateColors(
                forText: .init(hex: custom?["setCaptureUsePictureButtonHighlightedStateColorsText"] as! String),
                background: .init(hex: custom?["setCaptureUsePictureButtonHighlightedStateColorsBackground"] as! String),
                border: .init(hex: custom?["setCaptureUsePictureButtonHighlightedStateColorsBorder"] as! String)
            )
            .setCaptureUsePictureButtonNormalStateColors(
                forText: .init(hex: custom?["setCaptureUsePictureButtonHighlightedStateColorsText"] as! String),
                background: .init(hex: custom?["setCaptureUsePictureButtonHighlightedStateColorsBackground"] as! String),
                border: .init(hex: custom?["setCaptureUsePictureButtonHighlightedStateColorsBorder"] as! String)
            )
            .setCaptureUsePictureButtonDisabledStateColors(
                forText: .init(hex: custom?["setCaptureUsePictureButtonHighlightedStateColorsText"] as! String),
                background: .init(hex: custom?["setCaptureUsePictureButtonHighlightedStateColorsBackground"] as! String),
                border: .init(hex: custom?["setCaptureUsePictureButtonHighlightedStateColorsBorder"] as! String)
            )
            .setResultBackgroundColor(.init(hex: custom?["setResultBackgroundColorSuccess"] as! String), forResultType: .success)
            .setResultBackgroundColor(.init(hex: custom?["setResultBackgroundColorError"] as! String), forResultType: .error)
            .setResultBackgroundColor(.init(hex: custom?["setResultBackgroundColorTryAgain"] as! String), forResultType: .error)
        
            .setResultMessage(custom?["setResultMessageSuccess"] as! String, forResultType: .success)
            .setResultMessage(custom?["setResultMessageError"] as! String, forResultType: .error)
            .setResultMessage(custom?["setResultMessageTryAgain"] as! String, forResultType: .tryAgain)
        
            .setResultMessageColor(.init(hex: custom?["setResultMessageColorSuccess"] as! String), forResultType: .success)
            .setResultMessageColor(.init(hex: custom?["setResultMessageColorError"] as! String), forResultType: .error)
            .setResultMessageColor(.init(hex: custom?["setResultMessageColorTryAgain"] as! String), forResultType: .tryAgain)
        
            .setResultTryAgainButton(withText: custom?["setResultTryAgainButtonText"] as? String)
        
            .setResultTryAgainButtonHighlightedStateColors(
                forText: .init(hex: custom?["setResultMessageColorTryAgain"] as! String),
                background: .init(hex: custom?["setResultMessageColorTryAgain"] as! String),
                border: .init(hex: custom?["setResultMessageColorTryAgain"] as! String)
            )
            .setResultTryAgainButtonNormalStateColors(
                forText: .init(hex: custom?["setResultTryAgainButtonNormalStateColorsText"] as! String),
                background: .init(hex: custom?["setResultTryAgainButtonNormalStateColorsBackground"] as! String),
                border: .init(hex: custom?["setResultTryAgainButtonNormalStateColorsBorder"] as! String)
            )
        
        
        return builder
    }
}
