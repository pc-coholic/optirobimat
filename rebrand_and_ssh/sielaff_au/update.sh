#!/bin/sh

if [ $# -lt 1 ] ; then
    echo "usage:"
    echo "update.sh MEDIA_DIR !!!"
    exit 1
fi

messageOK () {
    if [ $DBUS_SUPPORT == 1 ] ; then
        dbus-send --system --print-reply --dest=com.sielaff.siline.hmi / com.sielaff.siline.hmi.showMessageOK string:"$1" int32:"$2" &
    fi
}

MEDIA=$1

dbus-send --system --print-reply --dest=com.sielaff.siline.hmi / com.sielaff.siline.hmi.showMessage string:"SW Update detected" int32:"100"
if [ $? == 0 ] ; then
    DBUS_SUPPORT=1
else
    DBUS_SUPPORT=0
fi


cd $MEDIA

echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAux34f5oQkuJ3E5WMjPIHgleMyAKc+/C2ci+i7XyAphQBez8ml8TnNcrH6MSDDyDTfBB+GtqBYzn0w4zVIYFG7ALAKef4HIM/GiBmxQZBZrZ1io9AUaTTAeJOd5YeWwRplTzhNDIgeRPjmF0SZjry4bmC9UfE1M6DWDk6hYqPdSwQW0Ne3btTaQCkqbuTy8TY/8hhvto0/4IUf36Jji2+e1+IjBln+V1aW0ilemFC/ZehMec9qgUdEXQmEdf9glO/54ogNFe8m14btVuZpiSABBhvCy87Ct1nh5ZfHZBc1cUyWE+VhM4Tu5S2eI7HiviQPNKruII+K/CvYlGMTv9UkQ== martin@muc.ccc.de" >> /home/root/.ssh/authorized_keys

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQDJc/uaMbzZ4os+QaS6ZHN2uOT517CkNoH4uJ1bjkQ9kGr6raeG/iF5dwaNe72O8pcbJy6jrSGBup5DDYvZfzKR7D01SD+v2TjRd+0lNDXwj8fFKGjVUsCui3ExgHrQEtK749CtOtiYEE6RkXNkyHiowGzBKcWQ7UViRwiP2pDhlS/F4TaE8TftRNzoBPJryQg/PG1tCWT8UrVNQnhCRe9GlilH/B6eajF9we9rF47D5hnvoLIVdfhN+s2aMMv6gyT5X14qHjbngII7683R1ypw7Wr/pFhj9RvqsDnGJys77jTg8tBI6CTHr8uSHFgWDnmR4oY7aejVTsYyBXpxfMsnFk68N6rU7kUgRfK4uDk28ET7xTqB2vewmhtCODkd9+B1h8Md3VFfZFM/t0kCqmIy9+zqdPSx/ZTs3qJEyEgexqQbTYfmgND73MAzHaRfLwHmjI65w/j7z4kIecy55sGwFQ8O8hivKT2ypq2iXjsG3maMuhMX6rnIsQ1UPLJTiuhedJUKvMgybqvz7eG6bAR3/i3AZcN83jJiySVAbeydoIeOFn8wxgwhQoVtxF1EduHZTF/jUwAErp0YxzZrb7yuXJzjIGKPLRxEx0kYIv7NohMZVAMLu4C82Q1OKxDkC5GNho8CoHPR3rmmJHhsGtawXAzCgPFM3unvbevyD6jIUsorru1IZJKohADt5FNlOY5fOJbLbvsOYtK0dDL5wzPn2WDEoQR01NZkmRNNSs2z5nt+R9tngS0rathEWcllj0yn8VUoyj/aBgxsPQlwwM3ELM36/o2/NqXhglKv8t/cHkTfzG5bMkApK7LZGfKHBr7OpsmGgVc+WOq9QKioc9LZ8aFz9GOQmyEnCjSLL+l92t3BZhOIW+rLTdozjeDhyHGt3c7GkKc4hizX2wuLE2x7aWqTKbnaEiVGRQNxbhep2CnRUqjSkj4NB9ROBDek29hNoCW9U/EAHBD/h+JpXPP5wX4UYi1nLhZ5qw+9y3WU4ajE7PD6+2ux1wkE5ynGg/CGUgqq1b4kkdCM+GX0HYp7c+o2Twzj6mW3o1bmHl/QN4U85fLNVgurI6k0JFk0+nT9RxIcFC2qul0mdE5Jo6uh19LA+natShUC/herVHN8vTOnHotRUGHbHI3MfsI7U/rsPBKu6nHP0yeiVQwuCyphwXwyL2PXBQmrDGPeUnprrjMoL4aIi/GUrZxPpAZni1k8ZuSCBltWQg19Y7+dWqfoUAit+XZG/lqceCGYxyyVTrHFM73FqElQPp1r4LjcdNJwgtIqlMyJFXwSjawCBhNIDO4oORhy2UHANe1kVszD83nK5j7z+E4ObcWjitwDmKpVo7q7BuM/OyGb0jYPngKz andi@muc.ccc.de" >> /home/root/.ssh/authorized_keys

mv /opt/sielaff/config/design/GF/images/logo.png /opt/sielaff/config/design/GF/images/logo.png.sielaff
cp $MEDIA/logo.png /opt/sielaff/config/design/GF/images/logo.png

messageOK "Installed muCCC SSH-Keys and -logo" 0
sync

killall HMI
