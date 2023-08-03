package com.example.oiti_liveness2d.utils.doccore

open class DocException(val code: String, message: String) : Exception(message) {}

class InvalidAppKey(code: String = "INVALID_APP_KEY", message: String = "INVALID_APP_KEY") :
    DocException(code, message) {}
