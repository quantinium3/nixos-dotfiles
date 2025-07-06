find /nix/store -name "*openssl*" -type d | grep -E 'openssl-[0-9]'
set -gx OPENSSL_LIB_DIR /nix/store/8pviily4fgsl02ijm65binz236717wfs-openssl-3.4.1/lib/ # this would only have /lib and /etc
set -gx OPENSSL_INCLUDE_DIR /nix/store/74z4cw9g5fhzkhydpsaac9d41b073dy6-openssl-3.3.2-dev/include # this would have /include /nix-support /lib
