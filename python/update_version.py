"""
This is the global script that set the version information of APP.
This script runs and update all the locations that related to versions
List of affected files:
- app-root/python/app/libinfo.py
- app-root/conda/app/meta.yaml
"""
import os
import re

app = 'myapp'
# current version
# We use the version of the incoming release for code
# that is under development
__version__ = "0.1.0" + os.getenv('APP_PRERELEASE', '')
print(__version__)

# Implementations
def update(file_name, pattern, repl):
    update = []
    hit_counter = 0
    need_update = False
    for l in open(file_name):
        result = re.findall(pattern, l)
        if result:
            assert len(result) == 1
            hit_counter += 1
            if result[0] != repl:
                l = re.sub(pattern, repl, l)
                need_update = True
                print("%s: %s->%s" % (file_name, result[0], repl))
            else:
                print("%s: version is already %s" % (file_name, repl))

        update.append(l)
    if hit_counter != 1:
        raise RuntimeError("Cannot find version in %s" % file_name)

    if need_update:
        with open(file_name, "w") as output_file:
            for l in update:
                output_file.write(l)


def main():
    curr_dir = os.path.dirname(os.path.abspath(os.path.expanduser(__file__)))
    proj_root = os.path.abspath(os.path.join(curr_dir, ".."))
    # python path
    update(os.path.join(proj_root, "python", app, "libinfo.py"),
           r"(?<=__version__ = \")[.0-9a-z]+", __version__)
    # conda
    for path in [app]:
        update(os.path.join(proj_root, "conda", path, "meta.yaml"),
               "(?<=version: \")[.0-9a-z]+", __version__)

if __name__ == "__main__":
    main()
