#!/bin/bash

xinput | perl -ne 'while(/.*Das Keyboard.*id=(\d+)/g){system("setxkbmap", "-device", $1, "-option", "altwin:swap_alt_win", "-option", "caps:swapescape");}'


