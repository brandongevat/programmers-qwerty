# Programmers QWERTY
## Installation
### Linux - Local Script Method
1. ```bash
    git clone https://github.com/brandongevat/programmers-qwerty
    cd ./programmers-qwerty/linux
    sudo chmod +x install.sh
    sudo ./install.sh
    ```

### Linux - Network Script Method
1. ```bash
    wget https://raw.githubusercontent.com/brandongevat/programmers-qwerty/refs/heads/main/linux/install.sh
    sudo chmod +x install.sh
    sudo ./install.sh --network
    ```
    
### Linux - Manual Method
1. ```bash
    sudo wget https://raw.githubusercontent.com/brandongevat/programmers-qwerty/refs/heads/main/linux/programmers-qwerty -P /usr/share/X11/xkb/symbols/
    sudo vim /usr/share/X11/xkb/rules/evdev.xml
    ```

2. Add the below layout:
    ```xml
        <layout>
            <configItem>
                <name>programmers-qwerty</name>
                <shortDescription>English (Programmers QWERTY) </shortDescription>
                <description>English (Programmers QWERTY)</description>
                <vendor>BrandonGevat</vendor>
            </configItem>
            <variantList/>
        </layout>
    ```
    
3. Here:
    ```xml
        ...
          <layoutList>
          ...
          <-- ADD ABOVE LAYOUT HERE -->
          </layoutList>
        ...
    ```
