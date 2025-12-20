# Ricty + Nerd Fonts
```
mkdir /tmp/fonts
cd /tmp/fonts
cp ~/.fonts/Ricty-Regular.ttf ./
docker run --rm -v $(pwd):/in -v $(pwd):/out nerdfonts/patcher --complete --careful
cp RictyNerdFont-Regular.ttf ~/.fonts/
fc-cache -f
# logout -> login

# choice Ricty Nerd Font Regular
```

# Moralerspace

```
brew install font-moralerspace
cp ~/.local/share/fonts/MoralerspaceNeon* ~/.fonts
fc-cache

# choice MoralerspaceNeon-Regular NF
```
