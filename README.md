# Recovery for Mi MSM8937 Devices

**To compile:**

```
$ export ALLOW_MISSING_DEPENDENCIES=true
$ . build/envsetup.sh && lunch omni_mi8937-eng && mka recoveryimage
```

After compilation find recovery.img in out/target/product/mi8937/recovery.img

**Requires python2.7:**  

If using pyenv:
```
$ pyenv install 2.7.18
$ nano ~/.pyenv/version
```
~/.pyenv/version file opened up in nano, edit the version and put `2.7.18` instead.  

_If not using pyenv:_ [Refer Here](https://telegra.ph/Install-Python-27-on-Linux-03-07)  

If `pyenv versions` returns 2.7.18 version as default but `python -V` returns 3.x as default:
```
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
```

**Kernel Source:** [mi-msm8937/android_kernel_xiaomi_msm8937](https://github.com/mi-msm8937/android_kernel_xiaomi_msm8937)
