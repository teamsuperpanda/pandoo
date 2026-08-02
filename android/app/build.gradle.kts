plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}
import java.util.Properties
import java.io.FileInputStream

val possibleProps = listOf("key.properties", "keystore.properties")
val keystoreProperties = Properties()
val keystorePropertiesFile = possibleProps.map { rootProject.file(it) }.firstOrNull { it.exists() }
if (keystorePropertiesFile != null) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

fun prop(key: String): String? {
    val fromFile = if (keystoreProperties.isEmpty) null else keystoreProperties.getProperty(key)
    if (!fromFile.isNullOrBlank()) return fromFile
    val envKey = System.getenv(key.uppercase())
    if (!envKey.isNullOrBlank()) return envKey
    return null
}

android {
    namespace = "com.teamsuperpanda.pandoo"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.teamsuperpanda.pandoo"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            val storeFilePath = prop("storeFile") ?: prop("KEYSTORE_PATH")
            if (storeFilePath != null) {
                storeFile = file(storeFilePath)
            }
            val storePwd = prop("storePassword") ?: prop("KEYSTORE_PASSWORD")
            val alias = prop("keyAlias") ?: prop("KEY_ALIAS")
            val keyPwd = prop("keyPassword") ?: prop("KEY_PASSWORD")
            if (storePwd != null) storePassword = storePwd
            if (alias != null) keyAlias = alias
            if (keyPwd != null) keyPassword = keyPwd
        }
    }

    buildTypes {
        release {
            val envKeystore = System.getenv("KEYSTORE_PATH")
            val propsFileExists = possibleProps.map { rootProject.file(it) }.any { it.exists() }
            signingConfig = if (envKeystore != null || propsFileExists) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }
            isMinifyEnabled = true
            isShrinkResources = true
        }
    }

    packaging {
        jniLibs {
            useLegacyPackaging = false
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("androidx.core:core-ktx:1.16.0")
    implementation("androidx.activity:activity-ktx:1.9.2")
}
