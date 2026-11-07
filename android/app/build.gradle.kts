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

val releaseStoreFile = prop("storeFile") ?: prop("KEYSTORE_PATH")
val hasReleaseSigning =
    releaseStoreFile != null &&
        file(releaseStoreFile).exists() &&
        !prop("storePassword").isNullOrBlank() &&
        !prop("keyAlias").isNullOrBlank() &&
        !prop("keyPassword").isNullOrBlank()

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
            // Never fall back to the debug key: a debug-signed AAB is rejected
            // by Play with a confusing error. Unsigned output is only produced
            // when no release build is requested.
            signingConfig = if (hasReleaseSigning) {
                signingConfigs.getByName("release")
            } else {
                null
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


// A release build without a keystore must fail with a clear message instead of
// producing an artifact signed with the debug key.
gradle.taskGraph.whenReady {
    val releaseRequested = allTasks.any { it.name.contains("Release", ignoreCase = true) }
    if (releaseRequested && !hasReleaseSigning) {
        throw GradleException(
            "Release builds require a signing keystore. " +
                "Create android/key.properties (gitignored) or set " +
                "KEYSTORE_PATH, STOREPASSWORD, KEYALIAS and KEYPASSWORD. " +
                "See CONTRIBUTING.md.",
        )
    }
}
