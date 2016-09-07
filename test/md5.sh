#!/usr/bin/env bats

@test "It computes the md5 checksum of a string" {
    run source "$(dirname "${BATS_TEST_FILENAME}")/../src/hashes.sh" md5 -t "my string"
    [ "${status}" -eq 0 ]
    [ "${output}" == "2ba81a47c5512d9e23c435c1f29373cb" ]
}

@test "It computes the md5 checksum of a file" {
    run source "$(dirname "${BATS_TEST_FILENAME}")/../src/hashes.sh" md5 -f "$(dirname "${BATS_TEST_FILENAME}")/support/data.txt"
    [ "${status}" -eq 0 ]
    [ "${output}" == "d504afb1e72778750f16b84ddb63e26a" ]
}

@test "It does not recognise unkown parameters" {
    run source "$(dirname "${BATS_TEST_FILENAME}")/../src/hashes.sh" md5 -u "my string"
    [ "${status}" -eq 100 ]
    [ "${output}" == "Unrecognised parameter '-u'." ]
}
