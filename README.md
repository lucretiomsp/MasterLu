# MasterLu
MasterLu is your electronic music teacher in Pharo. MasterLu will teach you Phausto, to program you own DSP (Digital Signal Processors) and Coypu to program music on-the-fly with Pharo.
If Phausto is not already working in your Pharo image, download the Phausto libraries for your platform, open the package, and place the librariesBundle folder into documents/Pharo/images/yourPhaustimage/

Then, copy and execute in a Playground

```Smalltalk
Metacello new
    baseline: 'MasterLu';
    repository: 'github://lucretiomsp/phausto:main';
    load
```
