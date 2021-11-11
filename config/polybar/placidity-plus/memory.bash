#!/usr/bin/env bash

free -m | awk '{print $2}' | sed -n 2p

