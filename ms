{  
"route": {
    "geoip": {
      "path": "geo-assets\\sagernet-sing-geoip-geoip.db"
    },
    "geosite": {
      "path": "geo-assets\\sagernet-sing-geosite-geosite.db"
    },
    "rules": [
      {
        "inbound": "dns-in",
        "outbound": "dns-out"
      },
      {
        "port": 53,
        "outbound": "dns-out"
      },
      {
        "clash_mode": "Direct",
        "outbound": "direct"
      },
      {
        "clash_mode": "Global",
        "outbound": "select"
      }
    ],
    "auto_detect_interface": true,
    "override_android_vpn": true
  },
  "outbounds": [
    {
      "type": "selector",
      "tag": "select",
      "outbounds": [
        "auto",
        "IP->مهدی, ",
        "IP->Mahdi, "
      ],
      "default": "auto"
    },
    {
      "type": "urltest",
      "tag": "auto",
      "outbounds": [
        "IP->مهدی, ",
        "IP->Mahdi, "
      ],
      "url": "http://cp.cloudflare.com/",
      "interval": "10m0s"
    },
    {
      "type": "wireguard",
      "tag": "IP->مهدی, ",
      "local_address": [
        "172.16.0.2/32",
        "2606:4700:110:8b76:b426:6b4:f304:a639/128"
      ],
      "private_key": "sBQDbt8VwkNm+muomXZB+Fx9Fbp/lIchYNuUdkBEa1w=",
      "server": "162.159.192.110",
      "server_port": 894,
      "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
      "reserved": [ 136, 230, 87 ],
      "mtu": 1280,
      "fake_packets": "5-10"
    },
    {
      "type": "wireguard",
      "tag": "IP->Mahdi, ",
      "detour": "IP->مهدی, ",
      "local_address": [
        "172.16.0.2/32",
        "2606:4700:110:8d02:9610:6bcd:8635:3ece/128"
      ],
      "private_key": "kB21iHPVKQckoQkQ7RvhVrJ2jWUQXuRMSrp4LJyy1kg=",
      "server": "162.159.192.110",
      "server_port": 894,
      "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
      "reserved": [ 95, 208, 111 ],
      "mtu": 1280,
      "fake_packets": "5-10"
    },
    {
      "type": "dns",
      "tag": "dns-out"
    },
    {
      "type": "direct",
      "tag": "direct"
    },
    {
      "type": "direct",
      "tag": "bypass"
    },
    {
      "type": "block",
      "tag": "block"
    }
  ]  
}
