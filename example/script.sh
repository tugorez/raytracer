#!/bin/sh
dart ./raytracer_example.dart > image.txt
python3 ./show_image.py&
