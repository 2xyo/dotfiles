## Perso
privatekey=/home/yoyo/Dropbox/Keys/

# FUN

# VPN
freedomip=/home/yoyo/Dropbox/perso/Mdp/VPN/freedomip
freedom_option="--script-security 2"
alias vpn_freedom_NL='sudo openvpn $freedom_option --config $freedomip/NL_freedomip.ovpn --auth-user-pass $freedomip/freedeom-ip.txt'
alias vpn_freedom_NL='sudo openvpn $freedom_option --config $freedomip/NL_freedomip.ovpn --auth-user-pass $freedomip/freedeom-ip.txt'
alias vpn_freedom_NL2='sudo openvpn $freedom_option --config $freedomip/NL2_freedomip.ovpn --auth-user-pass $freedomip/freedeom-ip.txt'
alias vpn_freedom_NL3='sudo openvpn $freedom_option --config $freedomip/NL3_freedomip.ovpn --auth-user-pass $freedomip/freedeom-ip.txt'
alias vpn_freedom_NL4='sudo openvpn $freedom_option --config $freedomip/NL4_freedomip.ovpn --auth-user-pass $freedomip/freedeom-ip.txt'
alias vpn_freedom_IE='sudo openvpn $freedom_option --config $freedomip/IE_freedomip.ovpn --auth-user-pass $freedomip/freedeom-ip.txt'
alias vpn_freedom_IE2='sudo openvpn $freedom_option --config $freedomip/IE2_freedomip.ovpn --auth-user-pass $freedomip/freedeom-ip.txt'
alias vpn_freedom_IE3='sudo openvpn $freedom_option --config $freedomip/IE3_freedomip.ovpn --auth-user-pass $freedomip/freedeom-ip.txt'
alias vpn_freedom_IE4='sudo openvpn $freedom_option --config $freedomip/IE4_freedomip.ovpn --auth-user-pass $freedomip/freedeom-ip.txt'

# TUNNEL
alias ssh_tun_kim_1111='ssh -i ~/.ssh/id_rsa -D 1111 -p 22 yoyo@ks3096509.kimsufi.com'

# SSH
alias ssh_kim='ssh -i ~/.ssh/id_rsa yoyo@ks3096509.kimsufi.com'
alias ssh_vks='ssh -i ~/.ssh/id_rsa yoyo@142.4.193.130'
alias ssh_tmux='ssh -i ~/.ssh/id_rsa yoyo@ks3096509.kimsufi.com -t tmux -u a'
alias ssh_acer='ssh -i ~/.ssh/id_rsa yoyo@yoyo-acer.device.lepage.info -t tmux -u a'

# TOOLS
alias pbcopy='xclip -selection clipboard'
alias ap='sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove'
alias decrypt="encfs ~/Dropbox/.encrypted ~/Private"
alias gettorrent="srsync yoyo@ks3096509.kimsufi.com:/home/yoyo/download/"
alias uptorrent="srsync ~/Downloads/*.torrent yoyo@ks3096509.kimsufi.com:/home/yoyo/download/"
# Profile Net

# Build
alias build_indicator-ip='dh_clean && debuild -kBA048DC4 -S -sa --lintian-opts -i -I'
alias changelog_indicator_ip_p2q='sed -i s/precise/quantal/g'
alias changelog_indicator_ip_q2p='sed -i s/quantal/precise/g'
alias send_indicator-ip='dputs ppa:2xyo/indicator-ip'

export DEBFULLNAME="Yohann Lepage"
export DEBEMAIL="yohann@lepage.info"
