import subprocess
import os
from pathlib import Path

try:
    paths = subprocess.check_output([
            "ghq",
            "list",
            "--full-path"
        ]).decode("ASCII").split("\n")

    projects = list(map(
        lambda project:
            project.split("/")[-1],
        paths))

    projects.insert(0, "Alacritty")

    projects_str = "\n".join(projects)

    output, error = subprocess.Popen(
            f"echo -e \"{projects_str}\" | rofi -dmenu",
            shell=True,
            executable="bash",
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
        ).communicate()

    project = output.decode("ASCII").strip()
    index = projects.index(project)
    path = str(Path.home()) if index == 0 else paths[index-1]

    os.system(f"alacritty --title {project} --working-directory {path}")
except:
    os.system(f"alacritty")
