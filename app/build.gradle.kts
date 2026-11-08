plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

android {
    namespace = "com.example.roofs"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.example.roofs"
        minSdk = 26
        targetSdk = 35
        versionCode = 1
        versionName = "0.1.1"
    }

    // Постоянный ключ: обновления ставятся поверх без удаления приложения
    signingConfigs {
        getByName("debug") {
            storeFile = file("debug.keystore")
            storePassword = "android"
            keyAlias = "androiddebugkey"
            keyPassword = "android"
        }
    }

    buildTypes {
        release {
            isMinifyEnabled = false
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }
}
