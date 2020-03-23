Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 655BF18F55D
	for <lists+selinux@lfdr.de>; Mon, 23 Mar 2020 14:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgCWNKk (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 23 Mar 2020 09:10:40 -0400
Received: from sonic317-32.consmr.mail.ne1.yahoo.com ([66.163.184.43]:35819
        "EHLO sonic317-32.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728275AbgCWNKk (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 23 Mar 2020 09:10:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1584969029; bh=/GcFFbn2btZiSKYiGCo/BleXlnSRHZPoMjv/YxR5ftE=; h=Date:From:Reply-To:Subject:References:From:Subject; b=SuGLfpppmWaG3Ez2ng1u4SH6WggbUnb4p59uWqqssRrRSVE14UGDWVo+125eFyzBFDLJCpgFbbp0X4PP8oKG9ql4SDVGrjq7YJhW0tm78Gj1eF+q9KecN4mOZY0HoFjtdVAzQHV1MSrygSPRKZ+954G/YlrY3oMuvKiWjMD25e/P1Njuj6cpo3GYJe+rYpHKwk3jbHHndy8FoHR1JLbVXu47G+KcOZQrnb/+fA0o+Dj7wEdsOT0/6zle0vbk1c9wzYW3WCQ9EZS67h08ni5tbw9+iry9xZ+NitLQ+P5iFcNE37+DW+qQhx/ZHHxlEjzCXAauTT4HOHPU4tpt8PeL3w==
X-YMail-OSG: GC87qOwVM1mCInqscR9ZtTIs4DpA.glJE22cS6B2HGJNSvFAppdpwVFFIUQJc7T
 XSj3vx4si15W9440IjD6MZG6wLKd.UqPqe6IW0PGJgfGDfVPzK8tmFPcMGnNNonnpXUNBP0_q1.m
 OcECD7aRJzKGgK6sxbE1LvAWgnNNSRz.kcMoTbAgrXqE3kaTV9K886rC8B2Pc4C1.v.vusxEK.zp
 Avcnmvk06oqGAUQIPhh7ICXc6K04FjU6avZ83RPUDXDDwhi0jL4PZTUMv8NjvZIDfwcoHf1k74ck
 ygyeWPN7szdKbP.fIW4S2uTRsZ6YrRJELdN7c6NQIgUTbbuncfssvCGWVvET0U6uDe_rAmm3raqG
 f6O_oBDCYgNRlX3YeY4Oh1FIiM9a66XfhemdHTasGnuJpqSwDqT2vYN8a03ELyCPW9Ls6TQ_vlxD
 kHWbhES6Jw0lsoMMtCtrwquv8CjT.A_TuWLKzrDVg2VjJTD.XeUlLM4xRSr717gnAlh0Iiu9DCuz
 gS_.ixBoV3TiGCKiCftTpky6Ol1vxRRZebYfyfxqmyrMwswZRErNkpm_1QqRIlO7ddTk0u4TqVOH
 ETmLFc5jSD0_uCzzVYQ5GncKRu37DnsKV8.oPsCZ9Qv_6O.4f7LtmJmAEceleEaA8RbL_lXK2coe
 o9g5vkKRGa3XejEdcRjXUK6ofBValp3Y8rzr7og_cXEDs5RKlxUjvzoUvF5FQDLt.TDBEDWJFv4.
 Zg6qJ7RBK9Ep2VUUNHrQSt0s5GG.m2MFwHAU.6EWZo2oSpa7NeqF1asjyFmh1jzT7apTIdzmMmLD
 7PZGKRxnGknnxpD5v5Pww5u1HRSVwDC1uxi2bOy6P7RPLiLcr3O.nKOvyO7NwfdvTuW3lZ4L7uo5
 b00_8pwPjFOEEAHD3pHqimSBBqn9hGjV5Mm56nSIkR3.ysGJLI7cksN1zyPe8v97PrOTCnlCuVyg
 N5bu79yB7zOjRcMgC4Cb64V5z4S9gEn5zoVQow50ZmOSeJMItdolBQan3fB.6G5hXsstvLOp0QB_
 aLFgtOAVlueJnWTKiaQZXs0clEZ8kbM01MYPs6syO_RbQVto4ouMGML8sV5ytVVPW4KkIsREUMjb
 iwNYL9x8iKO3EN8TjVIhmmelcMPygo3rS0xyoABSTZATOjJMGVP0v4.j0NO1mjzOe.K4GD6Ny_gv
 _wUXxuHf8tGkdr7qcaUt6h0E7KiyndUukt7FF9LmW4V4MNVReEgo4DZ1YZJo_tIucTDtUbX7zDtm
 GVvq6vortbBobhcy7wMFBSpvdcyByL5RmKp8U684LIDQmCo6aYIITNnFr5E53
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Mon, 23 Mar 2020 13:10:29 +0000
Date:   Mon, 23 Mar 2020 13:10:26 +0000 (UTC)
From:   Jak Abdullah mishail <mjakabdullah@gmail.com>
Reply-To: mishailjakabdullah@gmail.com
Message-ID: <97172868.535398.1584969026128@mail.yahoo.com>
Subject: GREETING,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <97172868.535398.1584969026128.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15518 YMailNodin Mozilla/5.0 (Windows NT 6.3; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0
To:     unlisted-recipients:; (no To-header on input)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Greeting,

My Name is Mr.Jak Abdullah mishail from Damascus Syria, and I am now resign=
ed from the government. I am a member of an opposition party goverment in S=
yria and a business man also,

I need a foreign partner to enable me transport my investment capital and t=
hen Relocate with my family, honestly I wish I will discuss more and get al=
ong I need a partner because my investment capital is in my international a=
ccount. Am interested in buying Properties, houses, building real estates a=
nd some tourist places, my capital for investment is ($16.5 million USD) Me=
anwhile if there is any profitable investment that you have so much experie=
nce on it then we can join together as partners since I=E2=80=99m a foreign=
er.

I came across your e-mail contact through private search while in need of y=
our assistance and I decided to contact you directly to ask you if you know=
 any Lucrative Business Investment in your Country I can invest my Money si=
nce my Country Syria Security and Economic Independent has lost to the Grea=
test Lower level, and our Culture has lost forever including our happiness =
has been taken away from us. Our Country has been on fire for many years no=
w.

If you are capable of handling this business Contact me for more details i =
will appreciate it if you can contact me immediately.
You may as well tell me little more about yourself. Contact me urgently to =
enable us proceed with the business.

I will be waiting for your respond.

Sincerely Yours,

Jak Abdullah mishail
