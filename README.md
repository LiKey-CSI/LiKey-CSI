### Hi there 👋

<!--
**LiKey-CSI/LiKey-CSI** is a ✨ _special_ ✨ repository because its `README.md` (this file) appears on your GitHub profile.

Here are some ideas to get you started:

- 🔭 I’m currently working on ...
- 🌱 I’m currently learning ...
- 👯 I’m looking to collaborate on ...
- 🤔 I’m looking for help with ...
- 💬 Ask me about ...
- 📫 How to reach me: ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...
-->
## Introduction
LiKey is the first location-independent keystroke recognition system on numeric keypads, consisting of one transmitter and two receivers. Through comparative experiments, we prove that the features and the deep learning model used by LiKey are superior to those of traditional keystroke recognition systems. In addition, LiKey has no limitations on the shape of the keyboard and performs well for keyboards above a certain size and tolerates tilting of the keyboard within a certain angle range.

The details are illustrated in our paper *LiKey: Location-independent Keystroke Recognition on Numeric Keypads using WiFi Signal*.

## Raw unprocessed data
Linux CSI Tool and Atheros CSI Tool Dual-platform basic experimental data: 

https://drive.google.com/file/d/1bmThqA6XYEWBRcZ-GIuYIvyppXt_iBhl/view?usp=sharing

https://drive.google.com/file/d/1VXTZOL191DVdbNjnfGp5FK9j1B_H4Yz3/view?usp=sharing

Data at different tilt angles of the keyboard:

https://drive.google.com/file/d/1w9HoNQU2XkXAbIygcpDVXdbo4VrW-L_r/view?usp=sharing

Data for keyboards of different shapes:

https://drive.google.com/file/d/16fjOxfjqX8R0_ABw0CxGsDWm5LCGhtvw/view?usp=drive_link

Data for keyboards of different sizes:

Please contact us for the relevant data.

## Code Folder
5300-Matlab-Code: Processing of keystroke data collected by Linux-CSI-Tool to generate features for individual samples.

5300-Python-Code: Process the sample features corresponding to Linux-CSI-Tool for classification and observe the final results.

Atheros-Matlab-Code: Processing of keystroke data collected by Atheros-CSI-Tool to generate features for individual samples.

Atheros-Python-Code: Process the sample features corresponding to Atheros-CSI-Tool for classification and observe the final results.
