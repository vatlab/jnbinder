## A simple SoS workflow to generate website from Jupyter notebooks

Copyright 2016 Gao Wang

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
* https://gaow.github.io/mnm-gtex-v8
* https://stephenslab.github.io/susie-paper
