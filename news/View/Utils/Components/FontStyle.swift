//
//  FontStyle.swift
//  news
//
//  Created by Teguh Satrio on 9/2/22.
//  Copyright © 2022 tgsatt. All rights reserved.
//

import Foundation
import SwiftUI

struct TitleModifierOSBold : ViewModifier {
    func body(content: Content) -> some View {
        content .font(.custom(Dictionary.openSansBold, size: 12))
            .foregroundColor(MyColor.articleColors)

    }
}

struct TitleModifierOSReg : ViewModifier {
    func body(content: Content) -> some View {
        content .font(.custom(Dictionary.openSansReg, size: 12))
            .foregroundColor(MyColor.articleColors)

    }
}

struct TitleModifierOSBoldN : ViewModifier {
    func body(content: Content) -> some View {
        content .font(.custom(Dictionary.openSansBold, size: 16))
            .foregroundColor(MyColor.articleColors)

    }
}

struct TitleModifierOSRegN : ViewModifier {
    func body(content: Content) -> some View {
        content .font(.custom(Dictionary.openSansReg, size: 16))
            .foregroundColor(MyColor.articleColors)

    }
}


struct TitleModifierPotentialBold : ViewModifier {
    func body(content: Content) -> some View {
        content .font(.custom(Dictionary.potentialBold, size: 12))
            .foregroundColor(MyColor.articleColors)

    }
}

struct TitleModifierPotentialReg : ViewModifier {
    func body(content: Content) -> some View {
        content .font(.custom(Dictionary.potentialReg, size: 12))
            .foregroundColor(MyColor.articleColors)

    }
}

