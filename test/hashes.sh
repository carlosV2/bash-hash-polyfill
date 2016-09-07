#!/usr/bin/env bats

@test "It does not recognise unkown hashes" {
    run source "$(dirname "${BATS_TEST_FILENAME}")/../src/hashes.sh" unknown -t "my string"
    [ "${status}" -eq 50 ]
    [ "${output}" == "Hash 'unknown' not supported." ]
}
