#!/usr/bin/env kotlin

val illegalArguments = listOf("--format", "--output", "record", "--shards", "-s", "--shard-all", "--shard-split")

illegalArguments.forEach {
    if (args[0].contains(it)) {
        throw IllegalArgumentException("$it is not supported for the action. Please remove the $it flag from the command")
    }
}

val input = args[0].replace("maestro", "").replace("test", "").trim()
val finalCommand = "maestro test --format junit --output report.xml $input"
println(finalCommand)
