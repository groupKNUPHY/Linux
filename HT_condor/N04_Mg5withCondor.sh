#!/bin/bash

if [ ! $1 ]; then echo "usage $0 gridpack"; exit; fi
gridpack=`readlink -e $1`
if [ ! -f $gridpack ] || [ ! $1 ]; then echo "Error NotFound GridPack $1"; exit; fi

cat << EOF > runCondor.sh
#!/bin/bash

source /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc6_amd64_gcc630
cd /x4/cms/ycyang/MadGraph/CMSSW_10_1_10
eval \`scramv1 runtime -sh\`
cd -

tar xvf `basename $gridpack`
./run.sh 10000 \$RANDOM
if [ ! -d condorOut ]; then mkdir condorOut; fi
mv events.lhe.gz condorOut/events_\${1}_\${2}.lhe.gz
EOF
chmod   +x runCondor.sh


cat << EOF > job.jdl
executable = runCondor.sh
universe = vanilla
output   = condorLog/condorLog_\$(Cluster)_\$(Process).log
error    = condorLog/condorLog_\$(Cluster)_\$(Process).log
log      = /dev/null
should_transfer_files = yes
transfer_input_files = $gridpack
when_to_transfer_output = ON_EXIT
transfer_output_files = condorOut
requirements = (machine != "node06")
arguments = \$(Cluster) \$(Process)
queue 5
EOF
if [ ! -d condorLog ]; then mkdir condorLog; fi

condor_submit job.jdl

