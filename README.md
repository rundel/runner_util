## Start a VM

* Setup a machine with Research Toolkits - https://rtoolkits.web.duke.edu/
    * Create a new project
    * Add RAPID service
        * Recommend Linux Ubuntu Server 20.04
        * Choose VM size - 2-4 cores, probably 1 per runner is a good idea
    * Install docker - `sudo apt install docker.io`
    * Start docker - `sudo service docker start`
    * Add user account to docker group - `sudo usermod -aG docker $USER`


## Add Runners

### Manual

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

### Helper scripts

* Connect to VM via ssh
* Clone this repository or copy the `*.sh` scripts and `chmod +x *.sh`.
* Create a folder for your class and `cd` into it
* Create the subfolders and download the latest version of the runner:
   ```
   ../runner_util/create_folders.sh
   ```
* Check that folders with the name `actions-runner*` have been created
* Manually, change into each `action-runner*` directory and run the config command given by the "Create self-hosted runner" step
   ```
   ./config.sh --url https://github.com/sta523-fa22 --token ***
   ```
   * Refresh the page to generate new tokens for each directory
   * Default options for each config step are fine other than picking different names for each runner
* Once configured, start the runner service by running `start_service.sh` as root.
   ```
   sudo ../runner_util/start_service.sh
   ```
* If successful the new runners should show as idle on `https://github.com/organizations/<org>/settings/actions/runners`
