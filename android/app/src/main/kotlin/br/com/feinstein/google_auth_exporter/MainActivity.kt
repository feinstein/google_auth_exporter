package br.com.feinstein.google_auth_exporter

import com.google.mlkit.vision.barcode.common.Barcode
import com.google.mlkit.vision.codescanner.GmsBarcodeScannerOptions
import com.google.mlkit.vision.codescanner.GmsBarcodeScanning
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
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

            else -> result.notImplemented()
        }
    }
}
