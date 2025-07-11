#!/bin/bash
python3 -m http.server & firefox localhost:8000/sankey.html && fg

