import sys
PARTS = [int(p) for p in sys.argv[1].split('.')]
if PARTS[0] == 1:
    sys.exit(1)
elif PARTS[0] == 2 and PARTS[1] < 4:
    sys.exit(1)

