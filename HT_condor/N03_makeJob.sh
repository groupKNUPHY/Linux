#!/bin/bash

maxfile=5
tag=$RANDOM
tmp=tag_$tag
mkdir $tmp
cp N03_sampling.sh $tmp/

nfile=`cat data.dat | wc -l`
nfile=`expr $maxfile + $nfile -1`
njob=`expr $nfile / $maxfile`

cat << EOF > $tmp/job.jds
executable = N03_sampling.sh
universe = vanilla
output   = $tmp/condorLog_\$(Cluster)_\$(Process).log
error    = $tmp/condorLog_\$(Cluster)_\$(Process).log
log      = /dev/null
should_transfer_files = yes
transfer_input_files = data.dat
when_to_transfer_output = ON_EXIT
transfer_output_files = condorOut
requirements = (machine != "wn3015.sdfarm.kr") 
requirements = \$(requirements) && (machine != "wn3021.sdfarm.kr") 
requirements = \$(requirements) && (machine != "wn3004.sdfarm.kr") 
requirements = \$(requirements) && (machine != "wn3014.sdfarm.kr") 
requirements = \$(requirements) && (machine != "wn3012.sdfarm.kr") 
arguments = \$(Process) ${outName}_\$(Cluster)_\$(Process).root $EleIdType $EnCorr $KinLLType $maxFile data.list
queue $nJob
EOF

