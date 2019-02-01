## HTcondor  
### Introduction
 - 오픈소스 작업 분산 병렬처리 프레임워크  
 - xxx.jds 형식의 JobClassAd 언어로 구성된 Describtion file을 생성  
 - condor_submit xxx.jds 로 Job을 돌린다

### Description file
```bash
# Job type, General case ex) shellScript-> Vanialla
Universe = vanilla
# Path to program 
Executable = /path/hello.sh
# Command line argument
Argument = out.root 1 2 3 

# Comma separated list of input file
transfer_input_files = data1.txt,data2.txt 
# Force HTcondor not to use shared filesystema, Generally yes
Should_transfer_files = yes
when_to_transfer_output= ON_EXIT

# results(output), log, and error
log = job.log
output = job.out
error = job.err

# Input job to queue
# # of executions 
queue
```  


### Condor Cammands  
|  <center>Command</center> |  <center>explanation</center> |  
|:--------|:--------:| 
|**condor_status** | <center>display the pull status</center> |  
|**condor_q** | <center>display job queue</center> |  
|**condor_submit** | <center>submit job</center> |  
|**condor_rm** | <center>Remove job</center> |  
|**condor_prio** | <center>Change user priority</center> |  
|**condor_history** | <center>display completed jobs information</center> |  
|**condor_checkpoint* | <center>check point</center> |  
|**condor_compile** | <center>compile using confor lib</center> |  


