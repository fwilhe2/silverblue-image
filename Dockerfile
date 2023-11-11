FROM quay.io/fedora-ostree-desktops/silverblue:39

# Keep container image for ~2 months
LABEL quay.expires-after=8w

RUN rpm-ostree install \
        htop \
        iwd \
        libvirt-daemon \
        libvirt-daemon-config-network \
        libvirt-daemon-driver-interface \
        libvirt-daemon-driver-network \
        libvirt-daemon-driver-nwfilter \
        libvirt-daemon-driver-qemu \
        libvirt-daemon-driver-secret \
        libvirt-daemon-driver-storage-core \
        libvirt-dbus \
        qemu-kvm \
        sysprof \
        neovim \
	ffmpeg-free \
	gnome-tweaks \
	gstreamer1-plugin-openh264 \
	krb5-workstation \
	simple-scan \
	virt-manager \        
    && \
    systemctl enable libvirtd.socket && \
    rm -rf /var/lib/unbound/root.key && \
    ostree container commit
