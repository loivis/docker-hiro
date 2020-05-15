# hiro

# usage

```
docker run --rm -v (pwd):/docs loivis/hiro -h

docker run --rm -v (pwd):/docs loivis/hiro .

docker run --rm -v (pwd):/docs loivis/hiro -input=example.md
```

# Convenience

create alias in .bashrc or .bash_profile

```
alias hiro='docker run --rm -v (pwd):/docs loivis/hiro'
```
