Get a new copy of a repository:

```git clone https://github.com/whoever/whatever```

Add ```--recurse-submodules``` to get all submodules; ```--depth=1``` to only get the most recent rev (really useful if cloning a kernel).

If you forgot to do recurse-submodules, you can then ```cd``` into your repo and then execute 

```git submodule update --init --recursive```
