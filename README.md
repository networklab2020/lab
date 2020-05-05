To start the lab simply execute the run.sh script. The GUI requires you to
setup a SSH key. You can either use the keygen script provided in the gns3gui
folder or add your own key. Note that it takes a considerable amount of time to
build the lab (~20min). You can edit the docker-compose yaml file to modify the
mount point of the docker-in-docker container (default is ./docker).

The terminal.sh script can be used to connect to the nodes in the topology. To
run the scan on the master simply run 

```
scan file scans/example.scan
```

in the interactive shell of the master node after the slave have been
registered.
