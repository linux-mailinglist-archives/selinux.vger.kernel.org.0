Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE2C95718B
	for <lists+selinux@lfdr.de>; Wed, 26 Jun 2019 21:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfFZTWy (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 26 Jun 2019 15:22:54 -0400
Received: from sonic311-30.consmr.mail.gq1.yahoo.com ([98.137.65.211]:45323
        "EHLO sonic311-30.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726422AbfFZTWx (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 26 Jun 2019 15:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1561576972; bh=UMwd/shl5v5cOOOLwKyMCoHQG3hrchGxV3ADS8IX31M=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=VBZA+UJQ5ZKa3+visxRUrnDRaRxhaVhhyw3BDWYJ8GqmXolk9GfitI+bZ3eHM7GsCWZrhXSKnE3V8kSA/uJnkXQy1GqYxE0FQkOE/6rWo9AHHqhzR8wzKVEsjZKKKrXdy+TZIVzOsTYqPPlEf8SBbrEM65YVch4om8ZQ/V9r7erPgLvf6bEiKPi2obtDaTjPRtW1wqoYz+BEWmQWscYLphCfAm6KWf3g67HmVYTOlnI6ymZGC4PIURlqX0e8DyKhSU/vLNSpVXJjP6mRre0wCluwJDfD2gBfSgeC589zKYmv2Rpfrsne7bkon/r1Pj/aCQk9qVZ2lz55a5y1+RLDCQ==
X-YMail-OSG: j5na8_MVM1lbq9P_Us4RWh5UDcFIIxfK_akev9rgFX3bslzcbJaxI2irh7HMccx
 TNd3XuZiyBZlc_NDaNj8r_5VCuH_V4Guiw715habVVeJRaGxFKHu8C_YxTI3Q7rawOQ3wHq3Xj_Y
 1QQ723r8TGv9bRQYcGRCveM9EyVdAYLneqT7qTk1jbnP_6mv5afQStoQTLZe.O0_yIixTYdCnqfE
 MqnHgA5xUdXDcu78jy12yLqq1FeY0hRIonQ1DexFcszAEvsAZ2G.lW4UxDChb3V23SOV8A3FeqsP
 15qWYzObCr29EDdkg3w5iqXReg9FoQoyaVGl_Ltw9PkpnWVl02SJYALJH4ECDh9ovAw8GpF925nW
 N5CDSTl_7XrMHpCUwKC9JWVxbcIohDadSJNraxC6CEPIOpI0Nvq2triSMYLnLBrWsvFiWbhI.M5H
 4pWtMMK2NfB6J8CGj6jXXK7.cUlm4fFutHjMYwRam.vgqzkwsbkWhz6KTYlWqcCOYAyrOmCqKxwD
 wUtlIvEo5I_wx03pcJom_GEvWSGwFaMp7_NoUbr4a.6wlb4TRWZxZdj7cLReFSr7MPcnZLYW1JFU
 MbKBIba.qA9.DJ.Uw6Ndbzk3w6fMjdgO7PlOqYf_KEyFRkR4_7hNdbFhUgfKk4Q8ShkPxnTpkP.p
 fMfjStifmtcHcRfo8J9DYFkB9YggFIdUuUs_fYQASYfAFtAWcDVJtCA4sWH1z8bdqI0XLnZzkt_Z
 dS9HhwgbT7XefQEEmMizLtfYpVpoRBEcqT8eC.C.kIcqVpXcW2_ZdB4CkG_7pQtgZz9Pmc8BM486
 pnphskJDnkvBwUS0CuUlDt51DenVYOCvqtkX3P1IB1at02XTjeFBoErdYHOJCF54n10n2H4ASilS
 La5KKn6r9vOSI62lIww_ZIDQ6RT7B3mCeyxt8VKeBzBCT06LhG5mWZSTG31i2zdGPwBb9lKHcDNJ
 D2eTYxRU49qYqevZrVVSI873eQvXtcmrhZXWbx_qhTYMHNPNDQRzRLA.E9HHqgENYb6TdqxCjyg5
 0OjkJrY6GXgPRLV_OVz373OcBXnZV7BxNNm5UeHkOd3tYdxHjXik27jbNZpuYICmQKXNnG6vvoNI
 hjY1LXPkWPJ1un1Pi33Ey14FXrO8NGfAn5QARPIJmOkaqAp44Wwq35ZuZiWs5JRxZbk3HW275PPu
 KR38Xj5It4Jvc4fc.to.T6kX6_k12UQnob6dNiGVyMtFzGvuAUv9wIIhAOyAwYuoUMMEvcb0dLnS
 LoZxq6rA4kABv8iUbw8UtJsrWjb_QCEDOcRzf0P_lPi8-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 Jun 2019 19:22:52 +0000
Received: from c-73-223-4-185.hsd1.ca.comcast.net (EHLO localhost.net) ([73.223.4.185])
          by smtp425.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID c714fa5cf5fc340fbb5c59821a30e7c3;
          Wed, 26 Jun 2019 19:22:50 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH v4 07/23] net: Prepare UDS for secuirty module stacking
Date:   Wed, 26 Jun 2019 12:22:18 -0700
Message-Id: <20190626192234.11725-8-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626192234.11725-1-casey@schaufler-ca.com>
References: <20190626192234.11725-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Change the data used in UDS SO_PEERSEC processing from a
secid to a more general struct lsmblob. Update the
security_socket_getpeersec_dgram() interface to use the
lsmblob. There is a small amount of scaffolding code
that will come out when the security_secid_to_secctx()
code is brought in line with the lsmblob.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h |  7 +++++--
 include/net/af_unix.h    |  2 +-
 include/net/scm.h        |  8 +++++---
 net/ipv4/ip_sockglue.c   |  8 +++++---
 net/unix/af_unix.c       |  6 +++---
 security/security.c      | 18 +++++++++++++++---
 6 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 313e45a3cac3..dcf20da87d1b 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1280,7 +1280,8 @@ int security_socket_shutdown(struct socket *sock, int how);
 int security_sock_rcv_skb(struct sock *sk, struct sk_buff *skb);
 int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
 				      int __user *optlen, unsigned len);
-int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid);
+int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
+				     struct lsmblob *blob);
 int security_sk_alloc(struct sock *sk, int family, gfp_t priority);
 void security_sk_free(struct sock *sk);
 void security_sk_clone(const struct sock *sk, struct sock *newsk);
@@ -1418,7 +1419,9 @@ static inline int security_socket_getpeersec_stream(struct socket *sock, char __
 	return -ENOPROTOOPT;
 }
 
-static inline int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid)
+static inline int security_socket_getpeersec_dgram(struct socket *sock,
+						   struct sk_buff *skb,
+						   struct lsmblob *blob)
 {
 	return -ENOPROTOOPT;
 }
diff --git a/include/net/af_unix.h b/include/net/af_unix.h
index 3426d6dacc45..933492c08b8c 100644
--- a/include/net/af_unix.h
+++ b/include/net/af_unix.h
@@ -36,7 +36,7 @@ struct unix_skb_parms {
 	kgid_t			gid;
 	struct scm_fp_list	*fp;		/* Passed files		*/
 #ifdef CONFIG_SECURITY_NETWORK
-	u32			secid;		/* Security ID		*/
+	struct lsmblob		lsmblob;	/* Security LSM data	*/
 #endif
 	u32			consumed;
 } __randomize_layout;
diff --git a/include/net/scm.h b/include/net/scm.h
index 1ce365f4c256..e2e71c4bf9d0 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -33,7 +33,7 @@ struct scm_cookie {
 	struct scm_fp_list	*fp;		/* Passed files		*/
 	struct scm_creds	creds;		/* Skb credentials	*/
 #ifdef CONFIG_SECURITY_NETWORK
-	u32			secid;		/* Passed security ID 	*/
+	struct lsmblob		lsmblob;	/* Passed LSM data	*/
 #endif
 };
 
@@ -46,7 +46,7 @@ struct scm_fp_list *scm_fp_dup(struct scm_fp_list *fpl);
 #ifdef CONFIG_SECURITY_NETWORK
 static __inline__ void unix_get_peersec_dgram(struct socket *sock, struct scm_cookie *scm)
 {
-	security_socket_getpeersec_dgram(sock, NULL, &scm->secid);
+	security_socket_getpeersec_dgram(sock, NULL, &scm->lsmblob);
 }
 #else
 static __inline__ void unix_get_peersec_dgram(struct socket *sock, struct scm_cookie *scm)
@@ -97,7 +97,9 @@ static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct sc
 	int err;
 
 	if (test_bit(SOCK_PASSSEC, &sock->flags)) {
-		err = security_secid_to_secctx(scm->secid, &secdata, &seclen);
+		/* Scaffolding - it has to be element 0 for now */
+		err = security_secid_to_secctx(scm->lsmblob.secid[0],
+					       &secdata, &seclen);
 
 		if (!err) {
 			put_cmsg(msg, SOL_SOCKET, SCM_SECURITY, seclen, secdata);
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 82f341e84fae..2a5c868ce135 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -130,15 +130,17 @@ static void ip_cmsg_recv_checksum(struct msghdr *msg, struct sk_buff *skb,
 
 static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
 {
+	struct lsmblob lb;
 	char *secdata;
-	u32 seclen, secid;
+	u32 seclen;
 	int err;
 
-	err = security_socket_getpeersec_dgram(NULL, skb, &secid);
+	err = security_socket_getpeersec_dgram(NULL, skb, &lb);
 	if (err)
 		return;
 
-	err = security_secid_to_secctx(secid, &secdata, &seclen);
+	/* Scaffolding - it has to be element 0 */
+	err = security_secid_to_secctx(lb.secid[0], &secdata, &seclen);
 	if (err)
 		return;
 
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index ddb838a1b74c..c50a004a1389 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -143,17 +143,17 @@ static struct hlist_head *unix_sockets_unbound(void *addr)
 #ifdef CONFIG_SECURITY_NETWORK
 static void unix_get_secdata(struct scm_cookie *scm, struct sk_buff *skb)
 {
-	UNIXCB(skb).secid = scm->secid;
+	UNIXCB(skb).lsmblob = scm->lsmblob;
 }
 
 static inline void unix_set_secdata(struct scm_cookie *scm, struct sk_buff *skb)
 {
-	scm->secid = UNIXCB(skb).secid;
+	scm->lsmblob = UNIXCB(skb).lsmblob;
 }
 
 static inline bool unix_secdata_eq(struct scm_cookie *scm, struct sk_buff *skb)
 {
-	return (scm->secid == UNIXCB(skb).secid);
+	return lsmblob_equal(&scm->lsmblob, &(UNIXCB(skb).lsmblob));
 }
 #else
 static inline void unix_get_secdata(struct scm_cookie *scm, struct sk_buff *skb)
diff --git a/security/security.c b/security/security.c
index f9c8e1926a0b..4e1eb2a54064 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2120,10 +2120,22 @@ int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
 				optval, optlen, len);
 }
 
-int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid)
+int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
+				     struct lsmblob *blob)
 {
-	return call_int_hook(socket_getpeersec_dgram, -ENOPROTOOPT, sock,
-			     skb, secid);
+	struct security_hook_list *hp;
+	int rc = -ENOPROTOOPT;
+
+	hlist_for_each_entry(hp, &security_hook_heads.socket_getpeersec_dgram,
+			     list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		rc = hp->hook.socket_getpeersec_dgram(sock, skb,
+						&blob->secid[hp->lsmid->slot]);
+		if (rc != 0)
+			break;
+	}
+	return rc;
 }
 EXPORT_SYMBOL(security_socket_getpeersec_dgram);
 
-- 
2.20.1

