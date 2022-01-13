
# Skwal dotfiles
- **Picom**
- **I3-gaps**
- **rofi**
- **polybar** 
## Screenshot
![](screenshot.png)

## install packages

Add ppa for i3-gaps (if needed)

```bash
sudo add-apt-repository ppa:regolith-linux/release
sudo apt update
```
install required packages
```bash
sudo apt install rofi picom nitrogen i3-gaps lxappearance
```
install dependencies for polybar build 
```bash
sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libjsoncpp-dev libpulse-dev libiw-devast
```
clone polybar 
```bash
git clone --recursive https://github.com/polybar/polybar
```
build polybar
```bash
cd polybar
sudo ./build.sh
```

## add my dotfiles
clone this repo 
```bash
git clone https://skwal.net/SkwalExe/dotfiles
cd dotfiles 
cd .config
```
copy i3 config file 
```bash
cd i3
cp config ~/.config/i3/
```
copy picom config file
```bash
cd ..
cp picom.conf ~/.config/
```
copy rofi config file
```bash
mkdir ~/.config/rofi
cd rofi 
cp config.rasi ~/.config/rofi
```
copy polybar config file
```bash
cd ..
cd polybar 
mkdir ~/.config/polybar
cp * ~/.config/polybar
```
## install nerdfonts
download nerd fonts from [here](https://objects.githubusercontent.com/github-production-release-asset-2e65be/27574418/1ec18580-452f-11ea-8073-041a7cbaca61?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220113%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220113T201533Z&X-Amz-Expires=300&X-Amz-Signature=f011c6d65b14ef9e2376069e3660258f528f7802499be502b7401adf6734a4fb&X-Amz-SignedHeaders=host&actor_id=69600456&key_id=0&repo_id=27574418&response-content-disposition=attachment%3B%20filename%3DFiraCode.zip&response-content-type=application%2Foctet-stream)
```bash
mkdir NerdFonts
unzip FiraCode.zip -d NerdFonts 
mv NerdFonts ~/.local/share/fonts
```
update font cache
```bash
fc-cache -f -v
```
## final
You can now login to your i3 session, is you have any probleme, don't hesitate to open an issue
## contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


