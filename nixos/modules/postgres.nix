{pkgs, ...}:{
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "postgres" ];
    authentication = pkgs.lib.mkOverride 10 ''
    # PostgreSQL Client Authentication Configuration File

# TYPE  DATABASE        USER            ADDRESS                 METHOD

# Local connections (via Unix domain socket)
local   all             all                                     trust

# IPv4 local connections
host    all             all             127.0.0.1/32            trust

# IPv6 local connections
host    all             all             ::1/128                 trust

    '';
  };
}
