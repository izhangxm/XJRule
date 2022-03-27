#!MANAGED-CONFIG {{ downloadUrl }} interval=43200 strict=false

[General]
# 日志等级: warning, notify, info, verbose (默认值: notify)
loglevel = notify
# 跳过某个域名或者 IP 段，这些目标主机将不会由 Surge Proxy 处理。(在 macOS
# 版本中，如果启用了 Set as System Proxy,  那么这些值会被写入到系统网络代理
# 设置中.)
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, 100.84.0.0/10, localhost, *.local
# 强制使用特定的 DNS 服务器
dns-server = system, 119.29.29.29, 223.5.5.5, 1.1.1.1

# 将特定 IP 段跳过 Surge TUN，详见 Manual
bypass-tun = 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12
# 是否截取并保存 HTTP 流量 (启用后将对性能有较大影响) (默认值: false)
replica = false
# 是否启动完整的 IPv6 支持 (默认值: false)
ipv6 = false

# 以下参数仅供 macOS 版本使用（多端口监听仅 Surge 3 支持）
http-listen = 0.0.0.0:6152
socks5-listen = 0.0.0.0:6153

# 测速地址
internet-test-url = {{ proxyTestUrl }}
proxy-test-url = {{ proxyTestUrl }}

# 其它
external-controller-access = zaqqwe@0.0.0.0:6155
show-primary-interface-changed-notification = true
proxy-settings-interface = Primary Interface (Auto)
menu-bar-show-speed = false
allow-wifi-access = true
hide-crashlytics-request = true
show-error-page-for-reject = true

[Proxy]
{{ getSurgeNodes(nodeList) }}

[Proxy Group]
♻️ 自动切换 = url-test, {{ getNodeNames(nodeList) }}, url = {{ proxyTestUrl }}, interval = 300
🚀 Proxy = select, ♻️ 自动切换, {{ getNodeNames(nodeList) }}
🍎 Apple = select, DIRECT, 🚀 Proxy, 🇺🇸 US, 🇭🇰 HK
🍎 Apple CDN = select, DIRECT, 🚀 Proxy, 🍎 Apple, 🇺🇸 US, 🇭🇰 HK
🍎 Apple iCloud = select, DIRECT, 🚀 Proxy, 🍎 Apple, 🇺🇸 US, 🇭🇰 HK
🛑 广告拦截 = select, REJECT, DIRECT, ♻️ 自动切换
✈️ Telegram = select, ♻️ 自动切换, 🚀 Proxy, 🇺🇸 US, 🇭🇰 HK
🎬 Netflix = select, ♻️ 自动切换, 🚀 Proxy, {{ getNodeNames(nodeList, netflixFilter) }}
📺 YouTube = select, ♻️ 自动切换, 🚀 Proxy, 🇺🇸 US, 🇭🇰 HK
👾 机场专线 = select, ♻️ 自动切换, 🚀 Proxy, 🇺🇸 US, 🇭🇰 HK
Ⓜ️ 微软服务 = select, DIRECT, ♻️ 自动切换, 🚀 Proxy
☠️ AdobeCrack = select, REJECT, DIRECT, ♻️ 自动切换, 🚀 Proxy
🤖 谷歌分析 = select, ♻️ 自动切换, DIRECT, 🚀 Proxy
📲 社交媒体 = select, ♻️ 自动切换, DIRECT,🚀 Proxy
🎥 其他国外流媒体 = select, ♻️ 自动切换,  {{ getNodeNames(nodeList) }}
🇺🇸 US = url-test, {{ getNodeNames(nodeList, usFilter) }}, url = {{ proxyTestUrl }}, interval = 300
🇭🇰 HK = url-test, {{ getNodeNames(nodeList, hkFilter) }}, url = {{ proxyTestUrl }}, interval = 300
🐟 Final = select, ♻️ 自动切换, DIRECT, REJECT, 🚀 Proxy

[Rule]
DOMAIN-SET,https://cdn.jsdelivr.net/gh/geekdada/surge-list/domain-set/adaway.txt,🛑 广告拦截 
DOMAIN-SET,https://cdn.jsdelivr.net/gh/geekdada/surge-list/domain-set/annoyances-filter.txt,🛑 广告拦截 
DOMAIN-SET,https://cdn.jsdelivr.net/gh/geekdada/surge-list/domain-set/base-filter.txt,🛑 广告拦截 
DOMAIN-SET,https://cdn.jsdelivr.net/gh/geekdada/surge-list/domain-set/chinese-filter.txt,🛑 广告拦截 
DOMAIN-SET,https://cdn.jsdelivr.net/gh/geekdada/surge-list/domain-set/neohosts-full.txt,🛑 广告拦截 
DOMAIN-SET,https://cdn.jsdelivr.net/gh/geekdada/surge-list/domain-set/social-media-filter.txt,🛑 广告拦截 
RULE-SET,https://raw.githubusercontent.com/izhangxm/XJRule/main/rule-set/surge/xj_proxy.list,🚀 Proxy
RULE-SET,https://raw.githubusercontent.com/izhangxm/XJRule/main/rule-set/surge/xj_direct.list,DIRECT
RULE-SET,https://raw.githubusercontent.com/izhangxm/XJRule/main/rule-set/surge/apple_api.list,🍎 Apple
RULE-SET,https://raw.githubusercontent.com/izhangxm/XJRule/main/rule-set/surge/apple_cdn.list,🍎 Apple CDN
RULE-SET,https://raw.githubusercontent.com/izhangxm/XJRule/main/rule-set/surge/apple_icloud.list,🍎 Apple iCloud
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Extra/Telegram/Telegram.list,✈️ Telegram
RULE-SET,https://raw.githubusercontent.com/limbopro/Profiles/master/limbopro/Microsoft.list,Ⓜ️ 微软服务
RULE-SET,https://raw.githubusercontent.com/limbopro/Profiles4limbo/main/adobecc.list,☠️ AdobeCrack
RULE-SET,https://raw.githubusercontent.com/limbopro/Profiles/master/limbopro/Googleanalytics.list,🤖 谷歌分析
RULE-SET,https://raw.githubusercontent.com/limbopro/Profiles4limbo/main/airports.list,👾 机场专线 
RULE-SET,https://raw.githubusercontent.com/geekdada/surge-list/master/youtube.list,📺 YouTube
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Global.list,📲 社交媒体
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/Streaming.list,🎥 其他国外流媒体
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/Video/Netflix.list,🎬 Netflix
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/China.list,DIRECT
RULE-SET,https://raw.githubusercontent.com/limbopro/Profiles/master/limbopro/Local.list,DIRECT
RULE-SET,SYSTEM,DIRECT
RULE-SET,LAN,DIRECT
GEOIP,CN,DIRECT
FINAL,🐟 Final

[URL Rewrite]
^https?://(www.)?g.cn https://www.google.com 302
^https?://(www.)?google.cn https://www.google.com 302


[MITM]
ca-passphrase = 2BFC2734
ca-p12 = MIIKPAIBAzCCCgYGCSqGSIb3DQEHAaCCCfcEggnzMIIJ7zCCBF8GCSqGSIb3DQEHBqCCBFAwggRMAgEAMIIERQYJKoZIhvcNAQcBMBwGCiqGSIb3DQEMAQYwDgQI8ERdLZTgPWQCAggAgIIEGICr1dSHEc0/qIzoFnAnS2Q1n/ZqD0J6Kqwti9BqBDFoS/Vd+ZNUC724oyGAtn7KMBnndZj+jIzFMC9wB29nddriWJ5mo/agjlNNX9kRfHInNXnFoHqu511MBFp2tak6h0HU+VYSQRtoihoMkSEverasdp2gpSkZ5zG1UXYupeQZUgZ+mxZ3R5Q6aEzBilb2wV9plCeHYImHAwZ7iP3JM0U0P68fMVpdTSs7G3EtlVzjQTb/cd/Vq/gdakZZY9yZ9U1BWGiR8NKPu2MLuqR+eBWixbKecA1TEBR0XprGgoFYnCGODBgck1otS0vahkvwtM7htiw+Rp6HsCb+zhYmDKRlui7BsRExZ7ti8/KaPn/0SkG+Yob+Rkw4nmRFEN6uZ3YBzR5VIDF4EXY6sR5L9MRRmoknP/JYKyE7skaIgwIZqai+UG8kCml9NjclA1AW2OfIR2+Ka5xrddFhTzbm6iNWzqYuj22o67bT9Q6dqwhCT2rkd81+Ewe/mT6ayX6Avpc1AcLSDiFpihOnc3CNgYKbMur+5qGpAozowy58PkaS7e7ayYN9AAKjuMqSqUzfv3r7Awu9bvWmrSIO7itRajgHGa+BMZsT0CdttARt3g8ZQ23oCemLHZpDnlh03wM0+QQ6ntZX25y/Pqi2ehPYKz1ilxelxIjvOK3xAFoNXa/2f03UXIhGjdNWOg6MZf9mjPxjl5p7h3mMHP9klKr/T5Hc9Z08qyEDp8XT1GDwFxh7OO7Mebf47rXWLVCGrLAkRLwUNGkNdSQlDvsC+aPbVVEAZWvxz77QEiJMGOQ7w4E9KhrOBqq4XIpP7mbx/Ko4tFlmIYCxYTdCIT/MewE3zdnXoxi7pvEta0m6ZibPjo7koJnIt2JkPc+GN6M/yXnS1+znkBdhVYcsid+DAJT8l19RQUVrOLe4GzghQOET5L2JpAkbwOb007RIx7iFR3ZOKL9ASZz+d2n4K1rM26iEpXwC75IMlmpkqe4nbZLS7fzPySphCt+NTdnno1QKZB7wUXU8GuQuEezDft8le6aR8R2KjjajXZSloC5H60CziOB5M2G3m9KmKdrV9kQIfxJXdZjQ3P6e1sYnJUAmOsEWHKIV37tmQv0DTP54dTAOk8EGZanh4Pfqc1ZIy9JFHzNW5HGi9kWpsSvBGb6j91rAMGBrzrDqh8aNSCcCY+uPIYA6B/aauIGF58LEN76jcWlUIRNHYvT8Jqd4obP+QR7yiZN3oBKLVxwNOTEyWHp7pzj0YNc4Yc3kQhgASyX7zjV6EWOpWFI8VLgm2+m/n+mIisNfCKLbSa/sTwhHjIl589z5926qDBjpWYzch+Kv/O0nflMX1qW3/uUvN/nyPsVL9DC3MIsVV3GoSSbs7kJ7hjhAhs2iQ9LIl6cwggWIBgkqhkiG9w0BBwGgggV5BIIFdTCCBXEwggVtBgsqhkiG9w0BDAoBAqCCBO4wggTqMBwGCiqGSIb3DQEMAQMwDgQIoO2hkDsqcGUCAggABIIEyNi3xbSHwGU5plaEvoD65mzaoVwDTDhzNZ1m1ZiK6VXj50pOi4PWhjrHy8NuH3muwo034gzYxlouJzHkR/tWZPwG8kwMoMU1twvPFRLp369mhmr5+E2GFnE90XaZP3Kh+2fG+v+j5Dj01Bs/LZPFJm6WubOt0l6voMCR0RMV1jLqmjhxD/jpmzM53GWyk6uCAoih6jKKQY+v44o77RN4b1/tL5KKYTUN1duKnoktc9s4G3GRpKLYbmu+5IX3yxL9+mGed7e9eOSPQMEwrBjTTlVop+Gg/eCwL6PqtmYgNSsOHO2TSxMM8EsPk/JfxYOsHAiFSFh43pZVpacBM8iXB6q0fhRCxGVyA2ZKHvfkydNmpBGp+Ld0/fEWhmcYMnkLL+J2t3cUErftlLMrKAM/idLA7K6z0WJwnHwJCdNfgfo05b5U9PGerXsxurpd8ByXIwQAcxuY08NjLhLV6M3mP//DvSYPQJpGIKxFfFtrmojj/jwwmYXPH69DNLxCGZa2y1c0MgkVFuXGIjYGQeabOJpy1cAxAcq4rMRqrvgiaWvvw65f+5VPFRqZ9eZ9xO4RvVShkmfUAqPaV4aUPDdTPxJ8FRsK3kczoysmldqH9EfGoirPCXjPOh8YkfUDHGmID1VBeGzKRylSb/+t9a3e949UQD0tDGFRKDZyzk4JnEdXAJFHBbntFl5V/lSiF6Xe1fpH8ADsV9/J0Pm2kf0DZp6oDigmFHRzCr5BKkiK3hRoq+K1DhTNOhmUbJSJTGIsvfcCwyebjyLBbCTmzAvqWaunkRyj3BSuRUH/bqsNB4sAu/Umyth0G2HnIv/NNY+wdsJOMt6xbB4UVxCLhTdI9JK8bT5v9g75ZAOQdtZFeQipN0GBJYDnGGoedGWzH3oJg/HLjcGFElG9lltx5gPZ1sA40XtxS5HysmZ/xVYNXk23LS4yR+iLVn3lmkQpUlQmij13/Nf0CXhpoQA5GV6qI0p1xC/jKSkUhGX3GxGph3vHAjdutyZx32Ob6NffmGru3FRxfUl4KJz1pJ/I5HrD/oL6d+ntVpwVnOqD2i30m/5HTmo4B0sbl4VvpTWUQAKw+duaZ7mHkzfzui5eRAoC+7EyPPZ2SmqWZsnoroMMr+Yd1JMS0g9v7sGcSiQL4YQD9g1lb1bL29EJ9fDwRd3y8B8Sn78pBIl2vNy3ZLesrJlnTe7ruxIKk3UHgD2oe36Yy5upzR30I2835wgahAa+uLMH3Mtl/VD8w6b1zuyYDW/iYDHUB9e4rAvgnD8skOnqc87hR+Pica0Lmah28Pr3yQaxft+EADcKseI0+R02pfzWHIGhHT3NrMarlAybjgrxkF0JSvjAX6LJO825NWCThaBEM7z0RCKB+TnNAWRbVmXDs1UlnnI98RemfJG8dwIdtJN4qXo5xtVVG3hmjh4qmu5mcekQeIfAJU9kASikQzTmYNz2LtJlwLYy1x6nruJmy9YvEWiPyIJODFHjsK1Deq67wqMYezPPv7CGYzxd464WR0CgEZHaKT9nX//5bpNkHwdP7uOUvowVvG0PiFSTD9pySrHumWJF5g01ke/uG79CVK0rt32Wkv/TirEfbBgRo6T3FB7uWHF9P1BMkFtuqvvcVMKboriuDDFsMCMGCSqGSIb3DQEJFTEWBBRPUUhkhP7flixPlA2LNIH1X9i27TBFBgkqhkiG9w0BCRQxOB42AFMAdQByAGcAZQAgAEcAZQBuAGUAcgBhAHQAZQBkACAAQwBBACAAMgBCAEYAQwAyADcAMwA0MC0wITAJBgUrDgMCGgUABBSyQNegkJtpl+71d+Hv/D+9AR2PIwQIoswmLZUEA/w=
