# Dashgo Robotic Platform SDK

## Install & Run

1. Clone the source codes
    - file structure:
        - `${HOME}/Workspace/dashgo_ws` for this repo. This is a catkin ws.
        - `${HOME}/Workspace/rosweb_ws` for the [web controller](https://github.com/LXYYY/rosweb_controller).

      *note: Foler paths are mounted in `docker run` params*, if you really need to change the paths, change the host paths in the mounting options in `Makefile`

    1. `cd ${HOME}/Workspace/`
    2. `git clone git@github.com:LXYYY/dashgo.git dashgo_ws/src/dashgo`
    3. `git clone git@github.com:LXYYY/rosweb_controller.git rosweb_ws`


2. Install docker. Since the source code provided is based on Ubuntu14, also tested on 16, anyway it's better to use it inside a docker.

3. Compile the docker
    ```
    cd dashgo
    git submodule update --init --recursive
    cd dashgo_docker && make build
    ```

4. compile the dashgo driver inside docker
    ```
    cd dashgo_docker && make attach
    # now you inside docker
    cd ${HOME}/Workspace/dashgo_ws
    catkin init
    catkin config --extend /opt/ros/kinetic --merge-devel 
    catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release
    catkin build dashgo_driver
    ```

4. Run the nodes
    ```
    cd dashgo_docker && sh dashgo_startup_host.sh # run this outside docker and this will also start the web controller
    ```

## Web Controller (really rough)
(inside docker)
1. Install modules of the website using npm, by npm install or something, **I can't remember, look it up!**
2. Change the ip of the robot **manually**, [here](https://github.com/LXYYY/rosweb_controller/blob/2b866761264ab18b0d0d5d36d55f00c93395f687/main.js#L8). I know this is really stupid, maybe change it to `0.0.0.0` will be a good idea. And you can change speed limit [here](https://github.com/LXYYY/rosweb_controller/blob/2b866761264ab18b0d0d5d36d55f00c93395f687/main.js#L15).
3. Then find a cellphone, open a browser. **Only works on some old browser, i.e. Edge, or some android-built-in browser. Chrome, Firefox, Safari... None of them can work**
4. Open the address `<RobotIP>:8000`, and change the rosbridge address on the website to the address in Step 2. `8000` is the http port for the website, `9090` you will find in Step 2 is the rosbridge port for control.
5. Click `Connect`, and use the on-screen joystick to control. The joystick is not very handy, need some practice.

Pain in the ass:
1. Change ip every time connected to a new network.