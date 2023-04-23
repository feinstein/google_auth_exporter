package br.com.feinstein.google_auth_exporter

import android.util.Log
import com.google.android.gms.common.moduleinstall.InstallStatusListener
import com.google.android.gms.common.moduleinstall.ModuleInstall
import com.google.android.gms.common.moduleinstall.ModuleInstallRequest
import com.google.android.gms.common.moduleinstall.ModuleInstallStatusUpdate
import com.google.android.gms.common.moduleinstall.ModuleInstallStatusUpdate.InstallState.STATE_CANCELED
import com.google.android.gms.common.moduleinstall.ModuleInstallStatusUpdate.InstallState.STATE_COMPLETED
import com.google.android.gms.common.moduleinstall.ModuleInstallStatusUpdate.InstallState.STATE_FAILED
import com.google.mlkit.vision.barcode.common.Barcode
import com.google.mlkit.vision.codescanner.GmsBarcodeScannerOptions
import com.google.mlkit.vision.codescanner.GmsBarcodeScanning
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    val moduleInstallClient by lazy { ModuleInstall.getClient(context) }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "barcode_scanner"
        ).setMethodCallHandler(::barcodeScannerMethodCallHandler)
    }

    private fun barcodeScannerMethodCallHandler(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "scan" -> {
                val options = GmsBarcodeScannerOptions.Builder()
                    .setBarcodeFormats(Barcode.FORMAT_QR_CODE)
                    .build()
                val scanner = GmsBarcodeScanning.getClient(this, options)

                val listener = ModuleInstallProgressListener()
                val moduleInstallRequest = ModuleInstallRequest.newBuilder()
                    .addApi(scanner)
//                    .setListener(listener)
                    .build()

                moduleInstallClient
                    .installModules(moduleInstallRequest)
                    .addOnSuccessListener {
                        scanner.startScan()
                            .addOnSuccessListener { barcode ->
                                result.success(barcode.rawValue)
                            }
                            .addOnCanceledListener {
                                result.success(null)
                            }
                            .addOnFailureListener { e ->
                                result.error("GENERIC_ERROR", "Error while scanning", e.toString())
                            }
                    }
                    .addOnFailureListener {
                        result.error("MODULE_INSTALL_ERROR", "Error trying to install module", it.toString())
                    }
            }

            else -> result.notImplemented()
        }
    }

    inner class ModuleInstallProgressListener : InstallStatusListener {
        override fun onInstallStatusUpdated(update: ModuleInstallStatusUpdate) {
            // Progress info is only set when modules are in the progress of downloading.
            update.progressInfo?.let {
                val progress = (it.bytesDownloaded * 100 / it.totalBytesToDownload).toInt()
                // Set the progress for the progress bar.
                Log.d("SCANNER", progress.toString())
            }

            if (isTerminateState(update.installState)) {
                moduleInstallClient.unregisterListener(this)
            }
        }

        private fun isTerminateState(@ModuleInstallStatusUpdate.InstallState state: Int): Boolean {
            return state == STATE_CANCELED || state == STATE_COMPLETED || state == STATE_FAILED
        }
    }
}
