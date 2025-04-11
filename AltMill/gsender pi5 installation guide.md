# gSender Edge installation guide for Raspberry Pi 5



## Prerequisites

- Raspberry Pi 4 or later
- Raspberry Pi OS (64 Bit) installed on an SD card
- ssh client
- Internet connection
- Basic knowledge of Linux commands
- VNC Client for remote desktop access such as RealVNC (Optional)


## Step 1: Install Raspberry Pi OS (64-bit) with Desktop

- Download and install the Raspberry Pi Imager from the official Raspberry Pi website if you haven’t already.
- Open Raspberry Pi Imager, select Raspberry Pi OS (64-bit) as the operating system.
- Choose your SD card as the storage location and click Next.

{ Insert image here }

- After selecting Next, you will be presented with the option to customize settings. Click EDIT SETTINGS.
    - On the General tab, make the following changes:
        - Hostname: Change the hostname to altmill (or any name you prefer).
        - Username: Set to pi.
        - Password: Set to gsender (you can change this to any secure password you desire).
        - Wireless Network: Enter your Wi-Fi network SSID and password.
    - Go to the Services tab:
        - Enable SSH: Make sure to check the box to enable SSH, allowing remote access.
    - Leave the rest of the options as default and click SAVE.
- Click Yes to apply the custom settings and Yes again proceed with flashing the SD card.
- After the flashing is complete, remove the SD card from your computer, insert it into your Raspberry Pi, and power it on. Give it 2 to 5 minutes to initialize the OS before proceeding to the next step.


## Step 2: Install gSender, enable Remote Access and set auto-start.

ssh to the Rasberry pi. Password is gsender or the password you enter from Step 1.

```bash
ssh pi@altmill.local
```


Execute the following commands.

```bash
# Download gSender (change the URL of Pi installer)
cd ~/Downloads
wget -O gsender.deb https://github.com/siganberg/gsender/releases/download/v.1.5.0-Edge-6.3/gSender-1.5.0-Edge-6-PI-64Bit.deb 
 
# Install gSender
sudo dpkg -i gsender.deb

# Generate autostart, Note: there should be no space before `>` else it will create CRLF issue. 
mkdir ~/.config/autostart
echo -e "[Desktop Entry]\nType=Application\nName=gSender\nExec=/opt/gSender/gsender -H 0.0.0.0 -p 8080 --remote true --controller grblHal"> ~/.config/autostart/gSender.desktop

# Turn Rasberry PI AutoLogin 
sudo sed -i 's/^#\?\(autologin-user=\).*/\1pi/; s/^#\?\(autologin-user-timeout=\).*/\10/; s/^#\?\(user-session=\).*/\1PIXEL/' /etc/lightdm/lightdm.conf

sudo reboot
```

That’s it. From here, you can simply use a browser from any device on your network, such as your laptop or tablet, to access the URL http://altmill.local:8080

## Step 3: (Optional) Install VNC Server and update all packages

These are optional and not required. I only use this for remote login to Raspberry PI desktop and do some troubleshooting. Also updating packages incase there some security updates.

ssh to the Rasberry pi. Password is gsender or the password you enter from Step 1.

```bash 
ssh pi@altmill.local
```

Then execute the following commands:

```bash
# (Optional) Update packages
sudo apt update && sudo apt upgrade -y


# Enable VNC Server. Useful for troubleshooting.
sudo systemctl enable wayvnc.service --now
sudo systemctl start wayvnc.service
```

## Other Optional Tips and Tricks 

### Installing Filezilla so you can easily FTP file to the SLB-EXT micro-sd card. 

```bash
sudo apt update
sudo apt install snapd

# Reboot after installing snapd package manager
sudo reboot
```

After reboot, open the terminal again and execute the command to install the Filezilla.

```bash
sudo snap install filezilla --beta
```

Reference: https://snapcraft.io/install/filezilla/raspbian



### Setting Vertical screen orientation 

You need to rotate both screen and touch screen orientation to make it work. 


```bash
sudo nano ~/.config/wayfire.ini
```

Add the following. Assuming TSTP MTouch is your input device for touch screen. 

```
[input-device:TSTP MTouch]
output=HDMI-A-2
transform = 270

[output:HDMI-A-2]
mode=1920x1080@60000
position=0,0
transform = 270
```