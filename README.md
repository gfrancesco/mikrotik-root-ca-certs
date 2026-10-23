# What's this?

It's a script for Mikrotik devices running RouterOS. The script removes all the installed Root CA Certificates, downloads a new set from the beta branch of Mozilla Firefox and installs them as trusted in local storage on the device.

# Important!

Installing trusted Root CA Certificates is a sensitive operation that can expose your device to MITM attacks and other threats.
You should not trust anybody instructing you to do that, including this repository.
This script is based on certificates distributed by Mozilla and an online service provided by [mkcert](https://mkcert.org/).
You should not proceed if you don't have a full understanding and trust in the source code of this repository, the [mkcert](https://mkcert.org/) service and Mozilla.

# How to use

- Create a new script in RouterOS, use the source code in `upd_root_ca.rsc`, you can name it `upd_root_ca`;
- Enable only the `write` permission on the script;
- [OPTIONAL] Schedule the script to run periodically, e.g. you can run it every 15 weeks with:
`/system/scheduler add !days interval=15w name=schedule_upd_root_ca on-event=upd_root_ca policy=read,write,ftp,test`
