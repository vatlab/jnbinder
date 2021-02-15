## A simple SoS workflow to generate website from Jupyter notebooks

Copyright 2016 Gao Wang


## Run from a docker image

1. Install [`docker`](https://docs.docker.com/get-docker/). Double-check
   after installation that `docker` is properly installed, by typing:

   ```bash
   docker run hello-world
   # Hello from Docker.
   # This message shows that your installation appears to be working correctly.
   ```

2. Pull the docker image that contains dependency software to generate the website:

   ```bash
   docker pull gaow/jnbinder
   ```
3. Download the script [`jnbinder_docker.sh`](https://github.com/vatlab/jnbinder/blob/master/jnbinder_docker.sh) 
   from this repository to your project folder and load it:

     ```bash
     source jnbinder_docker.sh
     ```
   After this, command prompt `jnbinder` should be available from your terminal.
   To verify, the following command should display the command interface:

    ```bash
    jnbinder -h
    ```

4. If it is your first time using this program please run the following to initialize:

    ```bash
    jnbinder setup-jnbinder
    ```
   Then open up the file `config.yml` and edit it, particularly set the `include_dir` to point to where your Jupyter notebooks are.
   A simplified example can be found [here](https://github.com/stephenslab/gtex-eqtls/blob/master/config.yml).

5. Inside your new project directory, generate
   all the webpages using the following command:

    ```bash
    jnbinder
    ```

6. Next time when you generate the files, if you want to skip existing pages please type `jnbinder -s build`. 
   If you want to force generate every page from scratch you can use:

   ```bash
   jnbinder clean
   jnbinder -s force
   ```

## [For advanced users only] Run source code

### Step 0: install dependencies

```
pip install sos bs4 
```

### Step 1: install `jnbinder`
```bash
wget https://raw.githubusercontent.com/vatlab/jnbinder/master/release
chmod +x release
./release setup-jnbinder
```

### Step 2: edit `config.yml` to include notebooks under various folders

See the template `config.yml` file in this repo. Uncomment them as you customize the contents. Particularly, configure `include_dir` to include folders where you keep the notebooks you want to publish as HTML pages. [Here](https://github.com/statgenetics/statgen-courses/blob/master/config.yml) is a minimal example configuration file in action. To reproduce it you can download some example notebooks [here](https://github.com/statgenetics/statgen-courses/tree/master/notebooks) and put them to a folder (or multiple folders) consistent with what's specified in `include_dir`.

### Step 3: build website
```
./release -j 10
```
Or, when things go wrong (pages not updated as expected).

```
./release -s force -j 10
```
where `-j 10` means running 10 conversion commands in parallel -- useful when there is a lot of notebooks to bind.

You should see the result in `docs/` folder. You can click on `docs/index.html` to open it in your browser.

### Mics: upgrade `jnbinder`
```
./release upgrade-jnbinder
```

The software is intented for my personal use but I'm happy to help if you request a feature or report a bug 
(it is not fully documented so do not worry about requesting for features that already exist!).

Here are more examples of generated research websites:

* https://github.com/stephenslab/ipynb-website
* https://stephenslab.github.io/gtex-eqtls
* https://stephenslab.github.io/susie-paper
