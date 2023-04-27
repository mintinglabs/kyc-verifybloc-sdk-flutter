package com.mintinglabs.verifybloc_flutter

import network.mintex.module_kyc.entity.ui.style.VerifyBlocButtonTheme as AndroidVerifyBlocButtonTheme
import network.mintex.module_kyc.entity.ui.style.VerifyBlocStyle as AndroidVerifyBlocStyle
import network.mintex.module_kyc.entity.ui.style.VerifyBlocTheme as AndroidVerifyBlocTheme

fun VerifyblocTheme.toAndroid(): AndroidVerifyBlocTheme {
    return AndroidVerifyBlocTheme(
        style = when (style) {
            VerifyblocStyle.LIGHT -> AndroidVerifyBlocStyle.LIGHT
            VerifyblocStyle.DARK -> AndroidVerifyBlocStyle.DARK
        },
        mainColor = mainColor?.toInt(),
        buttonStyle = buttonStyle?.toAndroid(),
    )
}

fun VerifyblocButtonTheme.toAndroid(): AndroidVerifyBlocButtonTheme {
    return AndroidVerifyBlocButtonTheme(
        color = color?.toInt(),
        gradient = gradient?.let {
            Pair(it.first(), it.last())
        },
        textColor = textColor?.toInt(),
        borderRadius = borderRadius?.toFloat(),
    )
}
