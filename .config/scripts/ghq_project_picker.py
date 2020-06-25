#!/bin/python3

import subprocess
import os
import sys
from pathlib import Path

def directory(project):
    dirs = project.split("/")
    return f"{dirs[-2]}/{dirs[-1]}"

paths = subprocess.check_output([
        "ghq",
        "list",
        "--full-path"
        ]).decode("ASCII").split("\n")[0:-1]

projects = ["Alacritty"] + list(map(lambda project: directory(project), paths))
serialized = "\n".join(projects)

output, error = subprocess.Popen(
        f"echo -e \"{serialized}\" | rofi -dmenu",
        shell=True,
        executable="bash",
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    ).communicate()

project = output.decode("ASCII").strip()

if project == "":
    sys.exit()

index = projects.index(project)
path = str(Path.home()) if index == 0 else paths[index-1]

os.system(f"alacritty --title {project} --working-directory {path}")
