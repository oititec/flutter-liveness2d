package br.com.oiti.flutter.oiti_liveness2d.utils

enum class Environment {
    HML, PRD;

    companion object {
        @Throws(IllegalArgumentException::class)
        fun getEnvironment(string: String): Environment {
            return when (string) {
                "hml" -> HML
                "prd" -> PRD
                else -> throw IllegalArgumentException()
            }
        }
    }
}