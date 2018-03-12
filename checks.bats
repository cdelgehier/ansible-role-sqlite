#! /usr/bin/env bats

# Variable SUT_ID should be set outside this script and should contain the ID
# number of the System Under Test.


# Tests
@test 'Directory databases exists' {
  run bash -c "docker exec -ti ${SUT_ID} ls -d /var/lib/travis"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ "/var/lib/travis" ]]
}

@test 'Database exists' {
  run bash -c "docker exec -ti ${SUT_ID} ls /var/lib/travis"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ "travisDB.db" ]]
}


@test 'Create table' {
  run bash -c "docker exec -ti ${SUT_ID} sqlite3 /var/lib/travis/travisDB.db 'create table TravisTBL(id INTEGER PRIMARY KEY, Name TEXT)'"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
}


@test 'Insert Row' {
  run bash -c "docker exec -ti ${SUT_ID} sqlite3 /var/lib/travis/travisDB.db 'INSERT INTO TravisTBL VALUES (0, \"TEST\")'"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
}

@test 'Select data' {
  run bash -c "docker exec -ti ${SUT_ID} sqlite3 /var/lib/travis/travisDB.db 'select * from TravisTBL'"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ "0|TEST" ]]
}

@test 'Drop table' {
  run bash -c "docker exec -ti ${SUT_ID} sqlite3 /var/lib/travis/travisDB.db 'drop table TravisTBL'"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
}
