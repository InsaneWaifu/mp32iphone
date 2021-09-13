import plistlib, random, os, sys, string

with open("ios_fuse/iTunes_Control/iTunes/Ringtones.plist", "rb") as f:
	p = plistlib.load(f)
p["Ringtones"][sys.argv[1]] = {'Name': str(sys.argv[1]).split('.')[0],
	'GUID': ''.join(random.choice(string.ascii_uppercase + string.digits) for i in range(16)),
	'Total Time': int(float(sys.argv[2]) * 1000),
	'Protected Content': False}

print(p["Ringtones"][sys.argv[1]])



with open("ios_fuse/iTunes_Control/iTunes/Ringtones.plist", "wb") as f:
	plistlib.dump(p, f, fmt=plistlib.FMT_BINARY)
