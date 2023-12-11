FROM odoo:17.0
USER root

RUN pip3 install -U pip
RUN pip3 install oauth2
# password_security module
RUN python3 -m pip install -U zxcvbn
# auto_backup module
RUN python3 -m pip install -U pysftp
# For the code reload to work
RUN pip3 install -U watchdog