#!/usr/bin/env bats

@test "It computes the sha1 checksum of a string" {
    run source "$(dirname "${BATS_TEST_FILENAME}")/../src/hashes.sh" sha1 -t "my string"
    [ "${status}" -eq 0 ]
    [ "${output}" == "e19343e6c6c76f8f634a685eba7c0880648b1389" ]
}

@test "It computes the sha1 checksum of a file" {
    run source "$(dirname "${BATS_TEST_FILENAME}")/../src/hashes.sh" sha1 -f "$(dirname "${BATS_TEST_FILENAME}")/support/data.txt"
    [ "${status}" -eq 0 ]
    [ "${output}" == "89a09ea1a55e3e81045f725008e23a37254de1ba" ]
}

@test "It does not recognise unkown parameters" {
    run source "$(dirname "${BATS_TEST_FILENAME}")/../src/hashes.sh" sha1 -u "my string"
    [ "${status}" -eq 100 ]
    [ "${output}" == "Unrecognised parameter '-u'." ]
}
