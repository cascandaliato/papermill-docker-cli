# [Papermill](https://github.com/nteract/papermill) Docker Image · [![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/cascandaliato/papermill?logo=docker&style=flat-square)](https://hub.docker.com/repository/docker/cascandaliato/papermill)

A dockerized version of [papermill](https://github.com/nteract/papermill), a tool for parameterizing and executing Jupyter Notebooks.

I use it to update my [COVID-19 notebook](https://github.com/casca/covid19-notebook) automatically every day.


### Usage Instructions
1. Install [Docker](https://www.docker.com/).
2. Open a command prompt or shell, move to the folder containing your notebooks.
3. Run:
   - (Windows) `docker run --mount type=bind,source=%CD%,destination=/notebooks cascandaliato/papermill <options>`
   - (Linux) `docker run --mount type=bind,source=$(pwd),destination=/notebooks cascandaliato/papermill <options>`

For example, `docker run --mount type=bind,source=$(pwd),destination=/notebooks cascandaliato/papermill input.ipynb output.ipynb` will execute notebook `input.ipynb` and save the updated notebook to `output.ipynb`.

For the list of supported `<options>`, read the [official usage instructions](https://papermill.readthedocs.io/en/latest/usage-workflow.html) or run:
- (Windows) `docker run --mount type=bind,source=%CD%,destination=/notebooks cascandaliato/papermill`
- (linux) `docker run --mount type=bind,source=$(pwd),destination=/notebooks cascandaliato/papermill`


### Custom Package Requirements

If your notebook requires additional packages, you can specify them within text files to be placed in same folder as your notebooks:
- (Ubuntu packages) `apt-requirements.txt`
- (Python3 packages) `requirements.txt`

These files should contain one package per line.
