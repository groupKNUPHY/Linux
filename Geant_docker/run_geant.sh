
# Please modified -v "PATH" that match your path to mount 

docker run --rm -it \
-v "/home/jkim/geant4/:/opt/geant4/shared_dir" \
--volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
--net=host \
--env="DISPLAY" \
xination/geant4.10.06
