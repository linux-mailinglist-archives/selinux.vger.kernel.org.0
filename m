Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 389E61D18BE
	for <lists+selinux@lfdr.de>; Wed, 13 May 2020 17:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388493AbgEMPJW (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 13 May 2020 11:09:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57204 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727778AbgEMPJW (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 13 May 2020 11:09:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589382560;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7/9rXa+5vDJ6i5MfCPAM8D5Zx4bvE+fm6YYm9bpfuhQ=;
        b=gxvwdIX1CUfwweCnggcsKKbJ8Wzak4lkAWlQT8eYihryvlHuAQtClt/XYhd4K5xyZOsOrm
        dd2DHHz/x2SAvl4YpwQOMaKXyTdp+03e6j1n2nThjxlAFg2KrIbdZwWRxEaPLNVfJZWhFU
        XoVEcBctVh3vXh/jgMiCMcLitQtVFvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-UetfrELsP5uQ27XE4W-u2Q-1; Wed, 13 May 2020 11:09:15 -0400
X-MC-Unique: UetfrELsP5uQ27XE4W-u2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB44B474;
        Wed, 13 May 2020 15:09:14 +0000 (UTC)
Received: from workstation (unknown [10.40.192.247])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 1108D60CD3;
        Wed, 13 May 2020 15:09:13 +0000 (UTC)
Date:   Wed, 13 May 2020 17:09:11 +0200
From:   Petr Lautrbach <plautrba@redhat.com>
To:     selinux@vger.kernel.org
Cc:     Dominick Grift <dac.override@gmail.com>
Subject: Re: [PATCH v2] mcstrans: start early and stop late
Message-ID: <20200513150911.GA184004@workstation>
References: <20191211134423.2357254-1-dac.override@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191211134423.2357254-1-dac.override@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2019 at 02:44:23PM +0100, Dominick Grift wrote:
> It stopped too early, exposing a bug in sudo selinux_restore_tty():
>=20
> SELINUX_ERR op=3Dsetxattr invalid_context=3D"wheel.id:wheel.role:users.te=
rminals.pty.pty_file:SystemLow"
> avc:  denied  { mac_admin } for  pid=3D859 comm=3D"sudo" capability=3D33 =
scontext=3Dwheel.id:wheel.role:sudo.wheel.subj:s0 tcontext=3Dwheel.id:wheel=
.role:sudo.wheel.subj:s0 tclass=3Dcapability2 permissive=3D0
>=20
> If we want to be able to reference human readable contexts in SELinuxCont=
ext=3D and nspawn -Z and -L then we need mcstrans ASAP
>=20
> v2: stop late, but do stop
> Signed-off-by: Dominick Grift <dac.override@gmail.com>
> Acked-by: Petr Lautrbach <plautrba@redhat.com>

Applied, thanks!

> ---
>  mcstrans/src/mcstrans.service | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/mcstrans/src/mcstrans.service b/mcstrans/src/mcstrans.servic=
e
> index 09529432..c13cd09a 100644
> --- a/mcstrans/src/mcstrans.service
> +++ b/mcstrans/src/mcstrans.service
> @@ -2,6 +2,9 @@
>  Description=3DTranslates SELinux MCS/MLS labels to human readable form
>  Documentation=3Dman:mcstransd(8)
>  ConditionSecurity=3Dselinux
> +DefaultDependencies=3Dno
> +Before=3Dshutdown.target sysinit.target
> +Conflicts=3Dshutdown.target
> =20
>  [Service]
>  ExecStart=3D/sbin/mcstransd -f

--=20
()  ascii ribbon campaign - against html e-mail=20
/\  www.asciiribbon.org   - against proprietary attachments

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE1qW2HJpVNBaCkttnviIJHj72InUFAl68DZEACgkQviIJHj72
InWMiw//QrvGL6Ufj7IpcFPbBklOk2qELPOkLGyIYQZTn+CTQ5sMnOns0AQY8uG2
c7bV85pJoE2cPECNuuz/YgqXQJnpxVWrFIWRTbs85D2b0V1/cFcAYMXV83oUxeni
awKr+Ag6VTOuSfAECyV/awDAC+MdeFcZCIY5bCMOS7+xIuC2HnnrvdDWlLa6hZr2
dOvYCls6LqV/tcLlr7z5HSnsdz/CGf+vYG1XFSzLH1aLSPXco/EGk8AQNcgSQpWI
7RC9nls1aBImlDU4Pt0DOEid504SmikxwMgob3H8/FAL4RCzw4JMKIwsmtifacq9
Y1r8tgcGKroNiEuslKq49l5AiYRYJM0xmYhiSGJPLMhtMdVuANFioQFGNjFnlBq3
cmATEFl5TVzSYJCDIAy/zPNcCOfHdQJYoOgU4AeSnvt454yxwDvtkrNUppBjRhN9
lEGDx7AqVIKFvzn1psFAaCAhzDmlj8Fr1wpX576Qzm3iNUuu4B3xVo8ab9+5wMQW
VNixwH4RbMdt/eGqQCQjDpsKBFAptQYJBw8RBm0Hob0aPsijguDu3rJ7LCgYCnKG
pAIZufHhazsK6FPBt8r0Z8I1/6XZRynrML3BXLb60Q9GY6RmtQ7ATY/Mtm0iBj0Y
EkqA79D5Fsx8G/lTmAVEnKlY9IqtvVWZ79p3+eZhxxq+4LNpFM0=
=AVqZ
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--

