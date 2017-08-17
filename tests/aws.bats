#!/usr/bin/env bats

@test "Check awslogs has a pid file" {
	run test -f /var/run/awslogs.pid
	[ $status = 0 ]
}

@test "Check awslogs is running" {
	run ps -p "$(cat /var/run/awslogs.pid)"
	[ $status = 0 ]
}

@test "Check aws-cli is available" {
	run aws --version
	echo "status = ${status}"
	echo "output = ${output}"
	[ $status = 0 ]
}