# Tab Nabbing & Reverse Tab Nabbing Demo Lab

This is a self contained lab to demonstrate both attacks in action. This lab is bound to localhost.

### Requirements
- Linux / MacOS / Windows (WSL) with Python3
- A browser

### Layout

```
demo-lab/
├── run-lab.sh                          # starts the 4 servers below
├── trusted-site/
│   ├── vulnerable.html                 # reverse tab nabbing: unfixed
│   └── fixed.html                      # reverse tab nabbing: remediated
├── attacker-site/
│   └── malicious.html                  # the window.opener.location payload
├── phishing-site/
│   └── login.html                      # the fake login clone
└── classic-tabnabbing/
    ├── inactive-tab.html                # JS / visibilitychange variant
    ├── meta-refresh.html                # no-JS <meta refresh> variant
    └── meta-refresh-target.html         # its redirect target
```

---

**READ THE BLOG [HERE](https://ziomsec.com/blog/tab-nabbing/)**
