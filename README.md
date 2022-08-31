# Start a VM

* Setup a machine with Research Toolkits - https://rtoolkits.web.duke.edu/
    * Create a new project
    * Add RAPID service
        * Recommend Linux Ubuntu Server 20.04
        * Choose VM size - 2-4 cores, probably 1 per runner is a good idea
    * Install docker - `sudo apt install docker.io`
    * Start docker - `sudo service docker start`
    * Add user account to docker group - `sudo usermod -aG docker $USER`


# Add Runners

* Connect to VM via ssh
* On GitHub : Org page >  Settings > Actions > Runners - Select add new runner
    * Select Linux, x64
    * Follow download and configure steps
    * Setup as a service:
      ```
      sudo ./svc.sh install
      sudo ./svc.sh start
      sudo ./svc.sh status
      ```
    * Runner should show on the Runners page as idle
    * repeat for additional runners, create separate folder for each, e.g. `runner1`, `runner2`, etc.
        * Each runner will only differ in the token used

