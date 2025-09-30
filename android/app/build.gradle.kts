plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.mckakos.corp.gel"
    compileSdk = 34  // Asegúrate de usar 34 o superior

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true  // Habilita core library desugaring
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.mckakos.corp.gel"
        minSdk = flutter.minSdkVersion  // Asegúrate de que sea al menos 21
        targetSdk = 34  // Usa 34 para compatibilidad
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true  // Habilita multidex
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")  // Actualiza a 2.1.4
}
