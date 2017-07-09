#!/bin/sh


WANDSAS_OVERLAY="${WANDSAS_OVERLAY:-/var/repos/wandsas}"

SCRIPTS_ROOT="${SCRIPTS_ROOT:-${WANDSAS_OVERLAY}/scripts}"

SETS_ROOT="${SETS_ROOT:-${WANDSAS_OVERLAY}/sets}"

typeset -U sets

sets=(
	${SETS_ROOT}/*.set)
	)


