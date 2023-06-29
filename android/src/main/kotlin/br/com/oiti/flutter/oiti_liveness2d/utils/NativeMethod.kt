package br.com.oiti.flutter.oiti_liveness2d.utils

enum class NativeMethod {
    OPEN_FACECAPTCHA,
    OPEN_DOCUMENTSCOPY;
    
    companion object {
        fun getMethod(value: String): NativeMethod? {
            return when (value) {
                "oiti.request.open_facecaptcha" -> OPEN_FACECAPTCHA
                "oiti.request.open_documentscopy" -> OPEN_DOCUMENTSCOPY
                else -> null
            }
        }
    }
}