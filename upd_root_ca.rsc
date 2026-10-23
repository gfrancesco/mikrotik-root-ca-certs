# https://github.com/gfrancesco/mikrotik-root-ca-certs

# === Settings
:local url          "https://mkcert.org/generate/"
:local file_path    "root_ca_certs.pem"
:local script_desc  "CA Root Update"

# === Download / Remove old / Install new
:do {
    /tool fetch url=$url dst-path=$file_path check-certificate=yes
    :log info "$script_desc: successfully downloaded $url to $file_path"
} on-error={
    :log error "$script_desc: failed to download $url"
    :error "$script_desc: download failed"
}

:do {
    /certificate remove [find]
    :log info "$script_desc: successfully removed all installed certificates"
} on-error={
    :log error "$script_desc: failed to remove installed certificates"
    :error "$script_desc: certificates delete failed"
}

:do {
    /certificate/ import file-name=$file_path trusted=yes
    :log info "$script_desc: successfully imported new certificates"
} on-error={
    :log error "$script_desc: failed to import new certificates"
    :error "$script_desc: certificates import failed"
}