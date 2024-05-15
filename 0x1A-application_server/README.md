Understanding Application Servers

Project Focus

This project delves into the concept of application servers and their role in web development. We'll explore the following:

Web Servers: We'll revisit web servers and their core functionalities.
Servers: We'll gain a broader understanding of servers in general.
Web Stack Debugging: We'll refresh our skills in debugging web applications.
Background

Your current web infrastructure utilizes Nginx, a web server, to deliver static web pages (as you set up in your prior web stack project). Although web servers can sometimes handle dynamic content, application servers are typically better suited for this task. In this project, you'll be introducing an application server to your setup, integrating it with Nginx, and ultimately using it to serve your Airbnb clone application.

Learning Resources

To bolster your understanding, consider reviewing the following materials:

Contrasting Application and Web Servers: Gain a clear distinction between these server types.
Serving Flask Applications with Gunicorn and Nginx (Ubuntu 16.04): This guide (remember, avoid installing Gunicorn within a virtualenv) walks you through the setup process.
Running Gunicorn: Learn how to operate Gunicorn, the chosen application server.
Flask Routing and Strict Slashes: Pay attention to how Flask manages slashes in route definitions, particularly the strict_slashes setting.
Upstart Documentation: Familiarize yourself with Upstart, a process management system used in Ubuntu 16.04.
Project Requirements

General:

README File: A mandatory README.md file is required at the project's root directory.
Python 3: All Python-related tasks must employ python3.
Commented Configuration Files: Include comments within all configuration files for clarity.
Bash Scripts:

Ubuntu 16.04 Compatibility: Your scripts should function flawlessly on Ubuntu 16.04 LTS.

Newline Endings: Conclude all files with a newline character.

Executable Scripts: Ensure your Bash script files are executable.

Shellcheck Compliance: Your Bash scripts must pass Shellcheck (version 0.3.7-5~ubuntu16.04.1, installable using apt-get) without errors.

Script Headings: Consistently begin your Bash scripts with the following lines:

#!/usr/bin/env bash
# Script Description (Explain the script's purpose)

