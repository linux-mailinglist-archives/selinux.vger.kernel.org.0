Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655DD3053F1
	for <lists+selinux@lfdr.de>; Wed, 27 Jan 2021 08:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S317825AbhA0Aww (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 26 Jan 2021 19:52:52 -0500
Received: from sonic314-26.consmr.mail.ne1.yahoo.com ([66.163.189.152]:40900
        "EHLO sonic314-26.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389112AbhAZRX6 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 26 Jan 2021 12:23:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1611681791; bh=ZItg9IsQJim7qfrOGmXEOkr0cLD0iJrDsTY7RROCfVU=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=Gg8BCMOlzLUev3dV57U3r4E+EsRr0soXUgXe+ExTdDFqWk4tC+TXA80rH57RzHhCX3bFnP+Illa4dgszqg+o6beXFgo+Nmu6bzaowSKCSfMAY6Avc6/rb12r3wRM5IAqtNd2FgLXqv8T05A1DZaxc7XsoXoIA7dtrT0R3+71ehWUNHJ5e2bfTLT1Upa6dVUnyk7CZ4WJOqeY/btRbwx1Ctcgso6Lykty0Hx6yp1htRs7jYfNsufKQ2/WHFxLvCbisiKi3/oAFxFAxgS5uepFqLmqxqg2xtb4v9WeF7VQB3eTh67h8hjcbqUXEsb3M9gsiTeAMz2uF2WGML8BKJcupw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1611681791; bh=AMgiyXZks7GFjeuftMnUTEeD4VvTPKbFsDPTyoXTBvf=; h=From:To:Subject:Date:From:Subject:Reply-To; b=a94IkhkG0eL06sNCPYd45WS+UhHNewk7HSTpaRWFWHG8iJvcQhBwbzEsTGb/7ufSaMt0F3LEqIZwVVab5xsR/r05mEyfU+sFGOIq8yH1ccRpCZab5TJtDFX9MHVgFX2IinbM+H+MM/1nxQ+rxvdhoyN87Kqv7wERXXIDQWyJ84uydAl8eItwshSKi/3qKbdY0+DaxylopW9Rp0QThjTw2vGBDxmze6IuUvQkiwxUBsB6U8+0OWhjfqjLj+NJE59crc/pcQ8t6u0SYMtxXg2BE5PRi3mnsLSi2NwFAWf++ZWdyc5bT/4WLNaCwz+P4418WDgrO2BTzs4zZpIlMrnG4Q==
X-YMail-OSG: bSpWxjAVM1mJyPAVk61e3aznmWAx1V0DaPVAqbk6mGl_vb4QdM_YVaiwjxJHBjk
 OoIWleJXtt_.W439TJ17j52_u8upAR0f5czma6z5Pxy_dkoyb3xiqSFZu_m4M81tQQsc.ngP7wSd
 Qk7.Of3MC4.1w4eaexj1wxePLMLTt7FoLS8yKmb9YJc2dnFCHbRh.CB0yuUxKK38YK8xHlgCxKcX
 QZOn9FaEOf0.5IZxN7aicTkCJGv.hl29MZ_GxL8epakHNNJ4.rCx5geNXACF.ghUkmJ1KnDnUGC9
 duujBsSN7ThgTb8Nt9Eyo3.wzcLoMmz3xzf6Rq8EAT_OuCopDOA9LD47U6aNJgWimADocrsrGTd0
 tbfSSWdStbwTz_qYeWKqkD9YuoK7RwugByIe3l65qpJ_RE14oka7_0eqAFJGLyGr82L26UtRnZ0n
 NepmQzQcIKfY26t10k11PC.rq5hGNFNicmJ4mQLuP5JqqSU.pubB.1N7BR4OnaYnmr..pspGgYZ8
 boCbJ2mW4Xerw_3TWrKLQ2y7sen1OHy3Sr9xpDIxKsVORa0GDaLU6AtKwu.2JLjSzd1KBp8tHEDt
 8oTzmL1vvo7jLO0HnwME.2ZxGug6KnNTXzcoQ1uj7FMsaFKLE2_.ZWZ2xrMRAN0cgJkqdwQndvU2
 azdUAQo0VIgRoBW355coSkXyUlsFibxrgqa4966NgWTwgDZ_CvZSYX7r4PuQAdAQInxafLl7LDUA
 G9bLeYct2aAF0hr8OvcxVQag4GQgd1SG1rEZ0gOuAtxZn58ZTF3.IOviFi8eoRCHUOXWc1nxS8Kb
 Fk4zKd09wFYgvwT3z4Z.Cy8oAudSPKyH5hlf2gWYs4GywCg.zWF4AzfLhf16TemLjZVjjkiwjIQ5
 Xazd2LM_9UQ0tzKL9zjqGIP.X7YNM8_kYZHn4gJ8wDUGCLMsl.RWeOzj9kKwMk7HOkQvdjlypQff
 .URnEXg8K5PYmSnQgOt66NonL7JYfyad7B.VDTOtx7phm8fQ.V0YnGdNulEP52Mp3rhmiOpdn4FG
 z.x_G_HK7HtpXkS6fwDRAlr65LjkYom2ppV7oHdWJWYymeKdhZeolyECBCbq7PvyylJtPhvZo0O3
 G9mMmtVEPtqwAVo0Rt2bEbNcqUTe9BfcKBZUJYipqquuuDgvvTnW52So5WGrxU4oZa2jbq5nhCzX
 z1Tzq8arKLtjCNrxgATygJJWhAs6JyZOyVpmjp0jUAyTsbZ3YFQ3RYT2hvs4YLfSGRHqtAjYQqem
 oH7xKyXn7tCpYf.KtKQMRiA7j.aaT9HdR7VeGDnmIR5KhvgBZ1BLnEd6ZSMiWqFG5j9rIVni_ZNA
 ylDOgTSG_rBpE2MSleKdGND_gt42WYkqpWBVakxATBze2hvIEG_.P.UnSBeJampursfAdd8W0ous
 d_aB1agN42OULmbj2WYbrNfqbVku3XOob6FZju5c3_pHm6cQdgJUg1.JAvlbq3LStjxNGziDwkG6
 R_9.7iFvS1gjUOx4zDu6xR4ZSD.qdI7bIUyHvLiAvKLhVmljFjUkpZ2Anis9u6X0PkAY_nFJl9Qa
 gHiyusaCVyorY2x9mHugxdbudNhTrFQYu8XyukHwLswX6joqdh5mBr5bboULzps3x90kLqBH5Nio
 otIqgX5Pp1OBPGb9.RhTNHDfF9KelbLP6_WcvdODW5oTqyOHrAzYtysRkW4ElGFRucX_zNhO87Rt
 9YOxZT1PPRCXSjguB3BuyMpEfdgSxqT8ffSneJFT3qicq6tcyu7xUu3mqHwTz7rG4e0cZOat4rGA
 4LJMzt6t5XLdDCbdNLN86eB3YS17knx8E2_o20Zi7REdLew.WMGRV.gqaOwsxHU6ksselOGM.INv
 _QtazcxgIfPr3cd4VmcWvKku6N2IN2YgYvtOMp.ULVG_TX9ujOu_m8SvlJnl1pHq9O.dq0CFDlIf
 pk7EjaaBzBTFKHNvnkER39gq25K7go9H1sV19dpCPr2IHSXftyWW8Y1OCZRD38d1193ZnQLujud2
 wkQMJeveyz_75HjfK4kAw13.Ug6ZHxtjqYf8.zWD6wnIWyTt3wSUviPRhDQ6w1gZSNPUligXr8FJ
 zy2R4hsLQ1MQIzXAxUl.D5SLTQewo2KYoEyQTKsqJH_MiUswfdBg8sBQGHYIcMq3_xx7lS0kl4jo
 hrJ7puwjvzz1hKNs38F6OwL5iCvPR7xpN6i8c326IWF7F.3HlKLkgPZR80gtPDSLdL74WXGb9bo4
 fWJVXbU7jXNCzwaYzgparEGi6WefHS6Z7qzQ2LO8azlQTpf5HHMi5n2eZxlVI_QZXcsDSt16zerY
 fPzZWOdfZ5M2LSIPw.3Rs6zoebHmJiwzQ6KeHp.JZkdlGhC2xtn0AIAxnouKmDyE.1Qal9CeCZ4z
 xpbTG4iQIbLJ7_3G6e7wMbLEg.0Dg4pie6LzDby3JDmeLuCAauWQKUfcupQ7nQDxxRghCkqIKxrh
 Fr0KP2AT6.IeEb49XEHoCkCb3hgDlppaQHGtfsnwltLc3Gwk4UQ69X1Kp4XCnAIx_3azcmqWXiB9
 0wIoTZtlbOhsycWsPNw9FIuKy0gjciGjGmuTcJrBugkgPLwmr3LIGHkBq1Qn4FtHAFzz73nBYH0U
 AhsTyd7VoeIt8hup6vEWB1broSdeen.OPEAbA1xPFE5wh2uzTIHrj2DIZyZq4d99MZgiw8THVKMh
 ZWgAtcg4ckBrv5nGMt3Dls_EMpiMaTvB10kUBtoEoUZzdg85MRiCVomxJG2NHKZtu30unOeHIrlr
 .1GEPbuACUof1ABuC6cv.CMR8cCjAn0JRYCqvr9xzEIY183idOLZJuoXlj.Wonn83D3H3LkdOAWN
 o71jc4OJkhHcNb0egU_VV6Nu9b5ubAj5EdJjwyrw51Yf2UKjnfdheTyVpTpn8P68ncVhf9TeEsO.
 jrRWidPb25ub_b.KbAVD0iDfvxE3ZbjOzwoAnc1KjT.K2.kpe.8dRhnV043KcirjUCHGyQbxEFrj
 Xja32pBANLGKdYx2kH9y25s2bZYnayGvi5y89A6g02C2eH.3.1OkDWfhL2C3AkATZZc6NY7.eXHL
 fZuRn.FItsB8K15cduAfsxu8QiA--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Tue, 26 Jan 2021 17:23:11 +0000
Received: by smtp413.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID 692fcfe33c3dae11a46729f413ef237f;
          Tue, 26 Jan 2021 17:09:15 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, linux-audit@redhat.com,
        keescook@chromium.org, john.johansen@canonical.com,
        penguin-kernel@i-love.sakura.ne.jp, paul@paul-moore.com,
        sds@tycho.nsa.gov, linux-kernel@vger.kernel.org
Subject: [PATCH v24 25/25] AppArmor: Remove the exclusive flag
Date:   Tue, 26 Jan 2021 08:41:08 -0800
Message-Id: <20210126164108.1958-26-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210126164108.1958-1-casey@schaufler-ca.com>
References: <20210126164108.1958-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

With the inclusion of the interface LSM process attribute
mechanism AppArmor no longer needs to be treated as an
"exclusive" security module. Remove the flag that indicates
it is exclusive. Remove the stub getpeersec_dgram AppArmor
hook as it has no effect in the single LSM case and
interferes in the multiple LSM case.

Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Acked-by: John Johansen <john.johansen@canonical.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 security/apparmor/lsm.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 4af0518b55d6..e3c682011d63 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1129,22 +1129,6 @@ static int apparmor_socket_getpeersec_stream(struct socket *sock,
 	return error;
 }
 
-/**
- * apparmor_socket_getpeersec_dgram - get security label of packet
- * @sock: the peer socket
- * @skb: packet data
- * @secid: pointer to where to put the secid of the packet
- *
- * Sets the netlabel socket state on sk from parent
- */
-static int apparmor_socket_getpeersec_dgram(struct socket *sock,
-					    struct sk_buff *skb, u32 *secid)
-
-{
-	/* TODO: requires secid support */
-	return -ENOPROTOOPT;
-}
-
 /**
  * apparmor_sock_graft - Initialize newly created socket
  * @sk: child sock
@@ -1248,8 +1232,6 @@ static struct security_hook_list apparmor_hooks[] __lsm_ro_after_init = {
 #endif
 	LSM_HOOK_INIT(socket_getpeersec_stream,
 		      apparmor_socket_getpeersec_stream),
-	LSM_HOOK_INIT(socket_getpeersec_dgram,
-		      apparmor_socket_getpeersec_dgram),
 	LSM_HOOK_INIT(sock_graft, apparmor_sock_graft),
 #ifdef CONFIG_NETWORK_SECMARK
 	LSM_HOOK_INIT(inet_conn_request, apparmor_inet_conn_request),
@@ -1918,7 +1900,7 @@ static int __init apparmor_init(void)
 
 DEFINE_LSM(apparmor) = {
 	.name = "apparmor",
-	.flags = LSM_FLAG_LEGACY_MAJOR | LSM_FLAG_EXCLUSIVE,
+	.flags = LSM_FLAG_LEGACY_MAJOR,
 	.enabled = &apparmor_enabled,
 	.blobs = &apparmor_blob_sizes,
 	.init = apparmor_init,
-- 
2.25.4

