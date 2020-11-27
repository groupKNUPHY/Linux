### Geant with Docker   


1. Install docker-geant  

```bash
source run_geant.sh
docker images
source install_geant_image.sh
```  


2. Try B1 example  

 - Working directory  
```bash
cd /opt/geant4
```  

 - Copy example directory  
```bash
cp -r install/share/Geant4-10.6.1/examples/ .
```  

 - Run B1 example  
```bash
cd examples/basic/B1
mkdir build
cd build
cmake ../
make
./exampleB1
/run/beamOn 100
```  

