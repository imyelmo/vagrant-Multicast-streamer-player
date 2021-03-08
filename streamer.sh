#!/bin/bash
sudo apt update
 sudo apt install vlc vim -y


# streamer
cat > /tmp/streamer.sh <<EOD
#!/bin/bash
ip=$(date +'%y')
vlc ./video.mp4 ":sout=#duplicate{dst=rtp{dst=225.0.0.1,port=5004,mux=ts,sap,name=Prob,ttl=16},dst=display}" ":sout-all" ":sout-keep"
EOD

# player
cat > /tmp/player.sh <<EOD
ip=$(date +'%y')
vlc rtp://225.0.0.1:5004
EOD

#sudo cp /tmp/streamer.sh /etc/dhcp/dhclient.conf
#sudo cp /tmp/player.sh /etc/default/varnish
#sudo cp /tmp/varnish_default /etc/varnish/default.vcl

#sudo ifdown eth0; sudo ifup eth0
