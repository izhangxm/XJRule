# {{ downloadUrl }}
#从这里开始复制 包括开头这个#井号
;预配置作者
;毒奶博主
;limbopro.com
;05.19.2021 更新   
;https://t.me/limboprossr 关注更新
;https://t.me/Adblock4limbo 群组反馈与讨论交流

[general]

#解析器作者 @XIAO_KOP 
resource_parser_url=https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/resource-parser.js

#IP_API 改自 @XIAO_KOP
geo_location_checker=http://ip-api.com/json/?lang=zh-CN, https://raw.githubusercontent.com/limbopro/QuantumultX/master/Scripts/IP_API.js

[dns]
server=223.5.5.5
server=114.114.114.114
server=119.29.29.29
server=8.8.8.8
address=/raw.githubusercontent.com/185.199.110.133


[policy]
available=♻️ 自动切换, {{ getNodeNames(nodeList) }}, img-url=https://raw.githubusercontent.com/limbopro/Zure/master/IconSet/Available.png
static=🚀 Proxy , ♻️ 自动切换,{{ getNodeNames(nodeList) }}, img-url=https://raw.githubusercontent.com/limbopro/Zure/master/IconSet/rocket.png
static=🍎 Apple, DIRECT, 🚀 Proxy, 🇺🇸 US, 🇭🇰 HK, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=🍎 Apple CDN, DIRECT, 🚀 Proxy, 🍎 Apple, 🇺🇸 US, 🇭🇰 HK, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=🛑 广告拦截, REJECT, DIRECT, ♻️ 自动切换,  img-url=https://raw.githubusercontent.com/limbopro/Qure/master/IconSet/Advertising.png
static=✈️ Telegram, ♻️ 自动切换, 🚀 Proxy, 🇺🇸 US, 🇭🇰 HK, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
static=🎬 Netflix, ♻️ 自动切换, 🚀 Proxy, {{ getNodeNames(nodeList, netflixFilter) }}, img-url=https://raw.githubusercontent.com/limbopro/Zure/master/IconSet/Netflix_Letter.png
static=📺 YouTube, ♻️ 自动切换, 🚀 Proxy, 🇺🇸 US, 🇭🇰 HK
static=👾 机场专线, ♻️ 自动切换, 🚀 Proxy, 🇺🇸 US, 🇭🇰 HK
static=Ⓜ️ 微软服务, DIRECT, ♻️ 自动切换, 🚀 Proxy
static=☠️ AdobeCrack, REJECT, DIRECT, ♻️ 自动切换, 🚀 Proxy
static=🤖 谷歌分析, ♻️ 自动切换, DIRECT, 🚀 Proxy
static=📲 社交媒体, ♻️ 自动切换, DIRECT,🚀 Proxy
static=🎥 其他国外流媒体, ♻️ 自动切换, img-url=https://raw.githubusercontent.com/limbopro/Qure/master/IconSet/GlobalMedia.png
available=🇺🇸 US, {{ getNodeNames(nodeList, usFilter) }}
available=🇭🇰 HK, {{ getNodeNames(nodeList, hkFilter) }}
static=🐟 Final, DIRECT, REJECT, ♻️ 自动切换, 🚀 Proxy,  {{ getNodeNames(nodeList) }},img-url=https://raw.githubusercontent.com/limbopro/Zure/master/IconSet/Final.png


[server_local]
{{ getQuantumultXNodes(nodeList) }}

[server_remote]
# https://raw.githubusercontent.com/limbopro/Profiles4limbo/main/unlesssub.txt, tag=无用节点（❌请不要动它）, enabled=false
# 无用订阅（请勿删除）

[filter_remote]
https://raw.githubusercontent.com/limbopro/Profiles4limbo/main/airports.list, tag=机场专线, force-policy=👾 机场专线, enabled=true
https://limbopro.com/Adblock4limbo.list, tag=毒奶特供, force-policy=🛑 广告拦截, enabled=true
https://raw.githubusercontent.com/NobyDa/ND-AD/master/QuantumultX/AD_Block.txt, tag=野比(4W+), force-policy=🛑 广告拦截, enabled=true
https://raw.githubusercontent.com/NobyDa/ND-AD/master/QuantumultX/AD_Block_Plus.txt, tag=野比(6W+), force-policy=🛑 广告拦截, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/Extra/Apple/BlockiOSUpdate.list, tag=禁止🚫🍎更新, force-policy=🛑 广告拦截, update-interval=86400, opt-parser=false, enabled=false
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/StreamingMedia/Video/Netflix.list, tag=Netflix, force-policy=🎬 Netflix, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/StreamingMedia/Streaming.list, tag=其他国外流媒体, force-policy=🎥 其他国外流媒体, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/Global.list, tag=社交媒体, force-policy=📲 社交媒体, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/Extra/Apple/Apple.list, tag=苹果服务, force-policy=🍎 Apple, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/China.list, tag=大陆媒体, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/Extra/ChinaIP.list, tag=GEOIP(CN), enabled=true

[rewrite_remote]
https://limbopro.com/Adblock4limbo.conf, tag=毒奶特供, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Rewrite/Block/YouTubeAds.conf, tag=DivineEngine (Youtube AdsBlock), enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Rewrite/Block/Advertising.conf, tag=DivineEngine (Advertising), enabled=true
#https://raw.githubusercontent.com/ConnersHua/Profiles/master/Quantumult/X/Rewrite.conf, tag=ConnersHua （DivineEngine Rewrite）, enabled=true
https://raw.githubusercontent.com/NobyDa/Script/master/QuantumultX/Rewrite_lhie1.conf, tag=NoByDa（lhie1 Rewrite）, enabled=false
https://raw.githubusercontent.com/NobyDa/Script/master/QuantumultX/Js.conf, tag=NoByDa（NoByDa Rewrite）, enabled=true
https://raw.githubusercontent.com/limbopro/Profiles4limbo/main/tiktok.conf, tag=TikTok ublock, enabled=true


[filter_local]
geoip, cn, direct
ip-cidr, 10.0.0.0/8, direct
ip-cidr, 127.0.0.0/8, direct
ip-cidr, 172.16.0.0/12, direct
ip-cidr, 192.168.0.0/16, direct
ip-cidr, 224.0.0.0/24, direct
final, 🐟 Final

[rewrite_local]

[mitm]
passphrase = 09264972
p12 = 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