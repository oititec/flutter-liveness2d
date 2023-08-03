package com.example.oiti_liveness2d.utils.liveness2d

open class Liveness2dException(val code: String, message: String) : Exception(message) {}

class InvalidAppKey(code: String = "INVALID_APP_KEY", message: String = "INVALID_APP_KEY") :
    Liveness2dException(code, message) {}
