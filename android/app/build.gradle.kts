import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}
android {
    namespace = "com.app.nawy"
    compileSdk = 36
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true

    }

    kotlin {
        compilerOptions {
            jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_11)
        }
    }
    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.app.nawy"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = 34
        versionCode = flutter.versionCode
        versionName = flutter.versionName

    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = keystoreProperties["storeFile"]?.let { file(it as String) }
            storePassword = keystoreProperties["storePassword"] as String
        }
    }
    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
//            signingConfig = signingConfigs.getByName("debug")
            signingConfig = signingConfigs.getByName("release")
        }
    }

    flavorDimensions += "app"

    productFlavors {
        create("prod") {
            dimension = "app"
            resValue("string", "app_name", "Nawy")
            applicationId = "com.app.nawy"
        }

        create("dev") {
            dimension = "app"
            resValue("string", "app_name", "Dev Nawy")
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
        }
        create("uat") {
            dimension = "app"
            resValue("string", "app_name", "Uat Nawy")
            applicationIdSuffix = ".uat"
            versionNameSuffix = "-uat"
        }
        create("qc") {
            dimension = "app"
            resValue("string", "app_name", "Qc Nawy")
            applicationIdSuffix = ".qc"
            versionNameSuffix = "-qc"
        }
    }

}
dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    implementation("com.google.firebase:firebase-analytics")
    implementation("com.android.billingclient:billing:6.1.0")
    implementation(platform("com.google.firebase:firebase-bom:34.6.0"))

    implementation("androidx.credentials:credentials:1.6.0-rc01")
    implementation("androidx.credentials:credentials-play-services-auth:1.6.0-rc01")
    implementation("com.google.android.libraries.identity.googleid:googleid:1.2.0")

}
flutter {
    source = "../.."
}
