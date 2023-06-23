# Copyright (c) 2021 Mike "KemoNine" Crosson
# SPDX-License-Identifier: Apache-2.0

COMMAND_ENABLE = no
CONSOLE_ENABLE = no
EXTRAKEY_ENABLE = yes
MOUSEKEY_ENABLE = yes
NKRO_ENABLE = yes
SPACE_CADET_ENABLE = no
TERMINAL_ENABLE = no
VIA_ENABLE = no
LTO_ENABLE = no # We support arm qmk devices which are incompatabl with this avr specific option

# Bootloader selection
#   Teensy       halfkay
#   Pro Micro    caterina
#   Atmel DFU    atmel-dfu
#   LUFA DFU     lufa-dfu
#   QMK DFU      qmk-dfu
#   ATmega32A    bootloadHID
#   ATmega328P   USBasp
BOOTLOADER = caterina # New QMK versions seem to require this. For now we specify the bootloader here.

# Work around limitation with userland and the way we have 'dynamic' direct wiring
#     This *should* live in config.h but KemoNine can't figure out how to check which keymap is in use at that level
# Splinky
# PINS_HAND_LEFT = -DDIRECT_PINS="{ { 26, 27, 28, 29 }, { 21, 23, 20, 22 } }"
# KB2040
# PINS_HAND_LEFT = -DDIRECT_PINS="{ { 26, 27, 28, 29 }, { 10, 19, 20, 18 } }"
# Pro Micro
PINS_HAND_LEFT = -DDIRECT_PINS="{ { F7, F6, F5, F4 }, { B6, B2, B3, B1 } }"
PINS_HAND_RIGHT = -DDIRECT_PINS="{ { F4, F5, F6, F7 }, { B1, B3, B2, B6 } }"
ifeq ($(KEYBOARD), ardux/thepaintbrush)
	ifeq ($(KEYMAP), left)
		OPT_DEFS += $(PINS_HAND_LEFT)
	endif
	ifeq ($(strip $(ARDUX_HAND)), left)
	   OPT_DEFS += $(PINS_HAND_LEFT)
	endif

	ifeq ($(KEYMAP), right)
		OPT_DEFS += $(PINS_HAND_RIGHT)
	endif
	ifeq ($(strip $(ARDUX_HAND)), right)
	   OPT_DEFS += $(PINS_HAND_RIGHT)
	endif
endif
