#!/bin/bash

./gradlew clean build bootJar

./build/libs/food-truck*.jar
