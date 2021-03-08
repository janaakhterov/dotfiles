#!/bin/python3

import subprocess
import os
import sys
from pathlib import Path

def directory(project):
    return "/".join(project.split("/")[5:])

paths = subprocess.check_output([
        "ghq",
        "list",
        "--full-path"
        ]).decode("ASCII").split("\n")[0:-1]

projects = ["Alacritty"] + list(map(lambda project: directory(project), paths))
serialized = "\n".join(projects)

output, error = subprocess.Popen(
        f"echo -e \"{serialized}\" | rofi -dmenu -theme $HOME/.config/rofi/launchers/text/style_3 -p ' '",
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
