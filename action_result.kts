#!/usr/bin/env kotlin

import java.io.File

try {
    val report = File(args[0]).readText()
    if (report.contains("status=\"ERROR\"")) {
        throw Exception("The report contains errors. Please check the report file for details.")
    }
} catch (e: Exception) {
    throw Exception("Failed to read the report file", e)
}
