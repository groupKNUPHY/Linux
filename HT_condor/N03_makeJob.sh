#!/bin/bash

maxfile=20
tmp=condor_out
if [ ! -d condor_out]; then mkdir $tmp; fi
cp N03_sampling.sh $tmp/
cp data.list $tmp


nfile=`cat data.list | wc -l`
nfile=`expr $maxfile + $nfile -1`
njob=`expr $nfile / $maxfile`

cat << EOF > $tmp/job.jds
executable = N03_sampling.sh
universe = vanilla
output   = $tmp/condorLog_\$(Process).log
error    = $tmp/condorErr_\$(Process).log
log      = /dev/null
should_transfer_files = yes
transfer_input_files = data.dat
when_to_transfer_output = ON_EXIT
transfer_output_files = condorOut
arguments = \$(Process) $maxfile data.list
queue $nJob
EOF

cd $tmp
condor_submit job.jdl
