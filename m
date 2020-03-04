Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94AA0178B62
	for <lists+selinux@lfdr.de>; Wed,  4 Mar 2020 08:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbgCDH3o (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 4 Mar 2020 02:29:44 -0500
Received: from agnus.defensec.nl ([80.100.19.56]:46600 "EHLO agnus.defensec.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbgCDH3o (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 4 Mar 2020 02:29:44 -0500
Received: from brutus.lan (brutus.lan [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id 4B67D132006F
        for <selinux@vger.kernel.org>; Wed,  4 Mar 2020 08:29:42 +0100 (CET)
Date:   Wed, 4 Mar 2020 08:29:40 +0100
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     selinux@vger.kernel.org
Subject: strange pam selinux issue
Message-ID: <20200304072940.GA1026144@brutus.lan>
Mail-Followup-To: selinux@vger.kernel.org
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
User-Agent: Every email client sucks, this one just sucks less.
X-PGP-Key: https://sks-keyservers.net/pks/lookup?op=get&search=0xDA7E521F10F64098
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The easiest way to explain this is as follows.

Consider this scenario:

# seinfo -xuwheel.id

Users: 1
   user wheel.id roles wheel.role level s0 range s0;

# selinuxconlist wheel.id sys.id:sys.role:sys.isid:s0
wheel.id:wheel.role:user.systemd.subj:s0

Now consider this scenario:

# echo '(userrole wheel.id sys.role)' > hack.cil && semodule -i hack.cil

# seinfo -xuwheel.id

Users: 1
   user wheel.id roles { wheel.role sys.role } level s0 range s0;

Here is the issue:

# selinuxconlist wheel.id sys.id:sys.role:sys.isid:s0
wheel.id:sys.role:sys.isid:s0


Some semi irrelevant background:

I am designing an improved "targeted" policy. Common targeted policies
are inefficient because they have several "unconfined" domains.
Unconfined domains are expensive because they have a lot of rules associate=
d with them.
They're essentially all the same. Just duplicates.

I decided to have just one unconfined domain: "the system", and everything =
that is not targeted ends up in the system domain.
So now I want to have a confined login shell with role access to the system=
 a'la: staff_u:staff_r:staff_t -> staff_u:unconfined_r:unconfined_t
pam_selinux seemingly cannot deal with this scenario as shown above. pam_se=
linux has many other issues. One of them is its concept of
"default_type". There is no such thing as a "default_type" and implying tha=
t there is a "default_type" causes issues.

There are other issues related to this as well: the env_params option depen=
ds on the "context contains" access vector being present.
It will not work even if you have handle_unknown=3Dallow set.

--=20
gpg --locate-keys dominick.grift@defensec.nl
Key fingerprint =3D FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
Dominick Grift

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEe2FOk94VrgBPlhBrAlFoDzf+eRMFAl5fWN4ACgkQAlFoDzf+
eRP5dQ/7BGi3Q9TJfLASxbiyYJU9nyYyjrRxcsladMM+HOufhHjD26whIo7JM7zx
mvVcx82lFgi0lYm1QEBshux8QhqGVYgb3wMW/hS6ebbPcu+f39mQId6yEvy+ucXE
Fdir8SpY/RjNORWruzpdalxNb8cjMSc0JbOV/jFZOKZckG/ShBElfKQo19ZJA4ky
UfneVPceyOYKoHvOhSm9bk4eGYVq8fO+vobRmXwd7eGUJkbHbsX3zIg6WPdN7+3L
eaTin5EHrQp0qQMvH0bX8cRFa/QIaGfGeKn0gd3Eju6/8H26opiZ8LRCjBYWqsUf
SOQq77zNLcB89edQEMiCs+4r/4SJ26crCAmTLqNHuK/HE4c0c/KbizBf+r9W6YHN
NI7b9Tk4//u20Xih6OoS17bOrW7cDogEfnxg4RzG/adcpE4B+6M+PyS/HZG9QxgH
g/C4sxsSCFpvNCdP4RqIMFKaDjvol1rY5w/Id+UJKIYwHvt2K01K8Ng6cQOOW2cC
XRfgIvfw2MRphzGce2Y01pI0vZSYxpAu2l9g4Yg8ZrWUhqNnbZbkhUFVnCo4RcGV
5uDY2ZYe9K/w6NEX+D8hWxNGBAIVu9nowoX1bEPmv7p7oiKSe3i/Gumeajm2sFGV
my7B4q1eRQlHBt2N6Capc9C7Z191ElOYqCH5QSOMx+6B9F9et1Q=
=Zjec
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
