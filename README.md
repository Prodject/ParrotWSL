# ParrotWSL
 Installing Parrot distribution in WSL2
 --------------------------------------
 Based on script by the4rchangel.

To install the distribution you need a base. This may be Kali Linux or Ubuntu.

To install, use the following instructions:

1. Install the Kali Linux or Ubuntu distribution from the Microsoft Store.
2. Update available repositories, install the update and the gnupg, git utility. You can do this with the command:

```bash
sudo apt update
apt upgrade -y 
apt install gnupg git -y
```

3. Clone this repository and run the script with the command: 

```bash
git clone https://github.com/Prodject/ParrotWSL.git 
cd ParrotWSL 
chmod a+x parrot-wsl.sh ./parrot-wsl.sh
```

4. During installation, you must select the distribution version (home, security, etc.)

5. Add a folder with ParrotOS to Windows Defender exceptions (Kali Linux). You can open the folder with Parrot OS using the command "explorer.exe ."

6. You can install the full version of the system with the command:

```bash
sudo apt install parrot-tools-full
```

7. All done)

![neofetch](https://github.com/Prodject/ParrotWSL/raw/master/.raw/parrot.png)

Note: if you run the parrot-wsl-mirror.sh file, then during the installation process you can select a mirror for your location.

 Environment
 --------------------------------------
 
 By default, mate environment is set, but if you are using X410 in Windowed Apps mode, you will not be able to use this mode. In this case, it is recommended to install XFCE, you can install from script additions wsl.post.sh
