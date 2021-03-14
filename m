Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA75B343AE0
	for <lists+selinux@lfdr.de>; Mon, 22 Mar 2021 08:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbhCVHrV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+selinux@lfdr.de>); Mon, 22 Mar 2021 03:47:21 -0400
Received: from smtp.econet.co.zw ([77.246.51.158]:18616 "EHLO
        ironportDMZ.econet.co.zw" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229665AbhCVHqr (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 22 Mar 2021 03:46:47 -0400
IronPort-SDR: y6MQB067eAsMFHuSy+DfE1fWnpx8jQ2H9D1d2G+uAaxj/CmDeXd2ijNiOkNJ7HrIPFqxUwpMWX
 iDWmEfo6PwxJ7+z3HPBrWhWmIpLHul77g3JPxI1Cs7CqQnu39IVhhETxA9koZrhWcYv3fDR9Um
 NAzvURhzsLiZx+1z1oN6eMvbON56jLBY3ZTCPeqGGTWlOCAHg831YG7FQmTDdq96lqBJ0N4JYq
 BjMicjTLoxbds2T5LbM3tGMTKxuNCbyok3myWIxl8Lc5l+HyEvwkPY1wIt0aUcst7drlV5MuBp
 5X0=
X-IronPort-AV: E=Sophos;i="5.81,268,1610402400"; 
   d="scan'208";a="10526414"
X-IPAS-Result: =?us-ascii?q?A2D//wDeSVhg/65lqMADQRaBEAWBRjyBPoEIARwfgSJeg?=
 =?us-ascii?q?mY4gSKKPy2CCINyhwGBDpJYEwyBXAsBAQEBAQEBAQEJMQECBAEBgQgPgzMDA?=
 =?us-ascii?q?QFIDAEBAQEDAoEiFRFLBQEBAQMCAwEBAgEHAQEBAQUDAQGGGAwHMQJDAQx8A?=
 =?us-ascii?q?QECDUgBAQEcAQQBAQEBAQEBAQEBAwEBDAGDVwECEAQBAQMXEQIgARkTAggCA?=
 =?us-ascii?q?QMKAw4GDBIEFwEEEQkJCh0BDAgCAQICAQEkJoIWglUBMaxogTEaAhaBOoNag?=
 =?us-ascii?q?jYGglIJAYEGgg6EFD6CJoNsgTYGggsmgmKBJT6DeRIBEQIBX4JYEzyCEIFPD?=
 =?us-ascii?q?4EqIxsWKRNFKxVPEQkwAUIDhjyJbCUDLIsFgXucHAcDgwaIR5QKK4EOgjaKa?=
 =?us-ascii?q?oV0A4NkjDZChgesJShmhCeBbg18cIEFgVkKGBiBUBEZh2OHbAECjUMjLwJ3U?=
 =?us-ascii?q?wgSAQoBgkeJUAEBAQECAgECgUJdAQE?=
IronPort-PHdr: A9a23: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
IronPort-HdrOrdr: A9a23:t9YVLKMiPaLPm8BcTmGjsMiAIKoaSvp033AA0UdtRRtJNvGCn8
 e1k/gBkTPygjAdWHYv8OrwWpWoa3Xa6JJz/M0tLa6vNTOW21eAAYl+4eLZogHINDb58odmup
 tIV4hbJJnOAUNhjcD8iTPZL/8FzMOc+K6lwcfypk0dND1CUK1r4wdnBgvzKCQfL2MqObMDGI
 OY9o57oVObFUg/VcinGmIDG9HKutyjruOcXTc9GxUl5AOS5AnH1JfGFXGjr28jegIK5Y0H+W
 jB1zXj5qO5s+yqoyWss1P73tBzkNvlxsArPr3qtuElbhHtjgqPQagJYczlgBkF5Ni16FAwkM
 Tdyi1QWvhO1w==
Received: from unknown (HELO wvale-mb-svr-06.econetzw.local) ([192.168.101.174])
  by ironportLAN.econet.co.zw with ESMTP; 22 Mar 2021 09:45:50 +0200
Received: from wvale-mb-svr-06.econetzw.local ((192.168.101.174)) by
 wvale-mb-svr-06.econetzw.local ((192.168.101.174)) with ShadowRedundancy id
 15.0.1497.2; Mon, 22 Mar 2021 06:55:41 +0000
Received: from WVALE-MB-SVR-10.econetzw.local (192.168.101.149) by
 wvale-mb-svr-06.econetzw.local (192.168.101.174) with Microsoft SMTP Server
 (TLS) id 15.0.1473.3; Sat, 13 Mar 2021 22:14:49 +0200
Received: from User (165.231.148.189) by WVALE-CAS-SVR-9.econetzw.local
 (10.10.11.230) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Sat, 13 Mar 2021 22:17:43 +0200
Reply-To: <r19772744@daum.net>
From:   "Reem E. A" <chawora@econet.co.zw>
Subject: Re:
Date:   Sat, 13 Mar 2021 20:17:29 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="Windows-1251"
Content-Transfer-Encoding: 8BIT
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2600.0000
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
Message-ID: <8bdaf817a0ab4a3abb9be5a444042ff4@WVALE-CAS-SVR-9.econetzw.local>
To:     Undisclosed recipients:;
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hello,

My name is Ms. Reem Ebrahim Al-Hashimi, I am the "Minister of state
and Petroleum" also "Minister of State for International Cooperation"
in UAE. I write to you on behalf of my other "three (2) colleagues"
who has approved me to solicit for your "partnership in claiming of
{us$47=Million}" from a Financial Home on their behalf and
for our "Mutual Benefits".

The Fund {us$47=Million} is our share from the (over-invoiced) Oil/Gas
deal with Turkish Government within 2013/2014, however, we
don't want our government to know about the fund. If this proposal
interests you, let me know, by sending me an email and I will send to
you detailed information on how this business would be successfully
transacted. Be informed that nobody knows about the secret of this
fund except us, and we know how to carry out the entire transaction.
So I am compelled to ask, that you will stand on our behalf and
receive this fund into any account that is solely controlled by you.

We will compensate you with 15% of the total amount involved as
gratification for being our partner in this transaction. Reply to:
reem.alhashimi@yandex.com

Regards,
Ms. Reem.
This mail was sent through Econet Wireless, a Global telecoms leader.

DISCLAIMER

The information in this message is confidential and is legally privileged. It is intended solely for the addressee. Access to this message by anyone else is unauthorized. If received in error please accept our apologies and notify the sender immediately. You must also delete the original message from your machine. If you are not the intended recipient, any use, disclosure, copying, distribution or action taken in reliance of it, is prohibited and may be unlawful. The information, attachments, opinions or advice contained in this email are not the views or opinions of Econet Wireless, its subsidiaries or affiliates. Econet Wireless therefore accepts no liability for claims, losses, or damages arising from the inaccuracy, incorrectness, or lack of integrity of such information.
[https://mail.econet.co.zw/OWA/auth/current/themes/resources/Agile/AgileBanner.png]
WORK ISN'T A PLACE
IT'S WHAT WE DO
________________________________





[https://mail.econet.co.zw/OWA/auth/current/themes/resources/Agile/telephone.png]




[https://mail.econet.co.zw/OWA/auth/current/themes/resources/Agile/email.png]

<mailto:>


[https://mail.econet.co.zw/OWA/auth/current/themes/resources/Agile/location.png]




[https://mail.econet.co.zw/OWA/auth/current/themes/resources/Agile/website.png]

www.econet.co.zw<https://www.econet.co.zw>


[https://mail.econet.co.zw/OWA/auth/current/themes/resources/Agile/inspired.jpg]
