#!/bin/bash
# global params
DATA_LIST="data.list"
# global arguments
GLO_ARG="--shm-segment-size 24000000000"
# reco arguments
CLPAR_SQ3=" --configKeyValues fastMultConfig.cutMultClusLow=-1;fastMultConfig.cutMultClusHigh=-1;fastMultConfig.cutMultVtxHigh=-1;ITSVertexerParam.phiCut=0.5;ITSVertexerParam.clusterContributorsCut=3;ITSVertexerParam.tanLambdaCut=0.2"

o2-raw-tf-reader-workflow $GLO_ARG --input-data $DATA_LIST --onlyDet ITS -b --delay 0.01 --max-cached-files 10 | \
o2-itsmft-stf-decoder-workflow $GLO_ARG -b | \
o2-its-reco-workflow $GLO_ARG --disable-mc --clusters-from-upstream --trackerCA $CLPAR_SQ3 --tracking-mode sync -b --run | tee its-reco.log

# o2-qc -b --config json:///home/its/iravasen/QualityControl/Modules/ITS/itsTrack.json
