#! /usr/bin/bash -xe

[[ -z "$1" ]] && echo "prodivde a run number" && exit 1;

RUN_NUMBER=$1

mkdir -p ${RUN_NUMBER}; pushd ${RUN_NUMBER}
cat << EoF > envrc
#! /usr/bin/env bash

export ALIEN_JDL_LPMRUNNUMBER=${RUN_NUMBER}
export ALIEN_JDL_LPMINTERACTIONTYPE=pp
export ALIEN_JDL_LPMPRODUCTIONTAG=LHC22m
export ALIEN_JDL_LPMPASSNAME=apass2
export ALIEN_JDL_LPMANCHORYEAR=2022
export ALIEN_JDL_USETHROTTLING=1
export ALIEN_JDL_RUNANALYSISQC=0
export ALIEN_JDL_O2DPGPASSPATH=apass1
export ALIEN_JDL_O2DPGPATH=LHC22f
export ALIEN_JDL_NKEEP=0
export ALIEN_JDL_USETHROTTLING=1
EoF

ln -s ${O2DPG_ROOT}/DATA/production/configurations/asyncReco/async_pass.sh .
popd