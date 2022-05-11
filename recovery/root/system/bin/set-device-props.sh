#!/sbin/sh

set_device_codename() {
	resetprop "ro.build.product" "$1"
	resetprop "ro.omni.device" "$1"
	resetprop "ro.product.device" "$1"
	for i in odm product system system_ext vendor; do
		resetprop "ro.product.${i}.device" "$1"
	done
}

set_device_model() {
	resetprop "ro.product.model" "$1"
	for i in odm product system system_ext vendor; do
		resetprop "ro.product.${i}.model" "$1"
	done
}

workaround_gpio_flashlight() {
	echo 1 > /sys/class/leds/flashlight/max_brightness;
	echo 0 > /sys/class/leds/flashlight/brightness;
}

case "$(cat /sys/firmware/devicetree/base/model)" in
	"Qualcomm Technologies, Inc. MSM8917-PMI8937 QRD SKU5")
		if [ -e /sys/class/leds/infrared/transmit ]; then
			set_device_codename "rolex"
			set_device_model "Redmi 4A"
		else
			set_device_codename "riva"
			set_device_model "Redmi 5A (Nougat bootloader)"
		fi
		workaround_gpio_flashlight
		;;
	"Qualcomm Technologies, Inc. MSM8917 QRD SKU5")
		set_device_codename "riva"
		set_device_model "Redmi 5A (Oreo bootloader)"
		workaround_gpio_flashlight
		;;
	"Qualcomm Technologies, Inc. MSM8917-PMI8937 MTP")
		set_device_codename "ugglite"
		set_device_model "Redmi Note 5A / Y1 Lite"
		workaround_gpio_flashlight
		;;
	"Qualcomm Technologies, Inc. MSM8940-PMI8937 MTP")
		set_device_codename "ugg"
		set_device_model "Redmi Note 5A / Y1 Prime"
		workaround_gpio_flashlight
		;;
	"Qualcomm Technologies, Inc. MSM8937-PMI8950 QRD SKU1")
		set_device_codename "land"
		set_device_model "Redmi 3S / 3X"
		;;
	"Qualcomm Technologies, Inc. MSM8940-PMI8950 QRD SKU7")
		set_device_codename "santoni"
		set_device_model "Redmi 4X"
		;;
	"Qualcomm Technologies, Inc. MSM8937-PMI8950 MTP")
		set_device_codename "prada"
		set_device_model "Redmi 4 Standard"
		;;
	# Non-MSM8937 devices
	"Qualcomm Technologies, Inc. E7 QRD SKU3")
		set_device_codename "vince"
		set_device_model "Redmi 5 Plus"
		;;
	"Qualcomm Technologies, Inc. MSM8953 + PMI8950 MTP D7")
		set_device_codename "uter"
		set_device_model "UTER"
		;;
	"Qualcomm Technologies, Inc. MSM8953 MTP")
		set_device_codename "oxygen"
		set_device_model "MI MAX 2"
		;;
esac

exit 0
