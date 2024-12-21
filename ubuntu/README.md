# Programmers QWERTY
## Installing on Ubuntu

- ```cp programmers-qwerty /usr/share/X11/xkb/symbols/```

- ```vim /usr/share/X11/xkb/rules/evdev.xml```

- Add the below layout to the end of 
```
...
  <layoutList>
  ...
  <-- ADD <layout> HERE -->
  </layoutList>
...
```
  ```
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