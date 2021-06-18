import re
import sys

SEMVER = re.compile(r"(\d+)\.(\d+)\.(\d+)")

PARTS = SEMVER.search(sys.argv[1])

if PARTS is None:
    print("No version string found!", file=sys.stderr)
    sys.exit(1)

PARTS = [int(p) for p in PARTS.groups()]
if PARTS[0] == 1:
    sys.exit(1)
elif PARTS[0] == 2 and PARTS[1] < 5:
    sys.exit(1)

