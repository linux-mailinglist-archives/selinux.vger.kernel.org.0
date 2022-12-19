Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F08D65114B
	for <lists+selinux@lfdr.de>; Mon, 19 Dec 2022 18:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbiLSRie (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 19 Dec 2022 12:38:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbiLSRid (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 19 Dec 2022 12:38:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51EA3DFC3
        for <selinux@vger.kernel.org>; Mon, 19 Dec 2022 09:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671471468;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Syjbob90eiNkz0Yg4P+B2NSN2XBsn+rBiv57VLcyy2E=;
        b=GXuolCNLL+nzefOqUesDwIP1Am2AcgAVndNOS2fje6VNgHuWyqODNWKQfp2TVwHKi1DbgE
        TMo/MwGenAlIebeFc4MM1CX5KD5kWLQTbhYBCKWUmINxeSrkj/FLTu8iDSaiLSYVkyVQMh
        KInSTowfiGyR4oikIVF0tQXjyMrrwP0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-0RuYmFcrO2qsY_UYOjddiw-1; Mon, 19 Dec 2022 12:34:04 -0500
X-MC-Unique: 0RuYmFcrO2qsY_UYOjddiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92DD91C0A580;
        Mon, 19 Dec 2022 17:34:04 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.39.193.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 87CB12166B26;
        Mon, 19 Dec 2022 17:34:03 +0000 (UTC)
From:   Paolo Abeni <pabeni@redhat.com>
To:     linux-security-module@vger.kernel.org
Cc:     Paul Moore <paul@paul-moore.com>, selinux@vger.kernel.org,
        mptcp@lists.linux.dev
Subject: [PATCH v2 1/2] security, lsm: Introduce security_mptcp_add_subflow()
Date:   Mon, 19 Dec 2022 18:33:48 +0100
Message-Id: <a902fa8f38238fca00094e067cbd147c472d108c.1671469167.git.pabeni@redhat.com>
In-Reply-To: <cover.1671469167.git.pabeni@redhat.com>
References: <cover.1671469167.git.pabeni@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

MPTCP can create subflows in kernel context, and later indirectly
expose them to user-space, via the owning mptcp socket.

As discussed in the reported link, the above causes unexpected failures
for server, MPTCP-enabled applications.

Let's introduce a new LSM hook to allow the security module to relabel
the subflow according to the owing process.

Note that the new hook requires both the mptcp socket and the new
subflow. This could allow future extensions, e.g. explicitly validating
the mptcp <-> subflow linkage.

Link: https://lore.kernel.org/mptcp/CAHC9VhTNh-YwiyTds=P1e3rixEDqbRTFj22bpya=+qJqfcaMfg@mail.gmail.com/
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
v1 -> v2:
 - fix build issue with !CONFIG_SECURITY_NETWORK
---
 include/linux/lsm_hook_defs.h | 1 +
 include/linux/lsm_hooks.h     | 9 +++++++++
 include/linux/security.h      | 6 ++++++
 net/mptcp/subflow.c           | 6 ++++++
 security/security.c           | 5 +++++
 5 files changed, 27 insertions(+)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index ed6cb2ac55fa..860e11e3a26b 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -343,6 +343,7 @@ LSM_HOOK(void, LSM_RET_VOID, sctp_sk_clone, struct sctp_association *asoc,
 	 struct sock *sk, struct sock *newsk)
 LSM_HOOK(int, 0, sctp_assoc_established, struct sctp_association *asoc,
 	 struct sk_buff *skb)
+LSM_HOOK(int, 0, mptcp_add_subflow, struct sock *sk, struct sock *ssk)
 #endif /* CONFIG_SECURITY_NETWORK */
 
 #ifdef CONFIG_SECURITY_INFINIBAND
diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 0a5ba81f7367..84c9c4d4341e 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -1096,6 +1096,15 @@
  *	@skb pointer to skbuff of association packet.
  *	Return 0 if permission is granted.
  *
+ * Security hooks for MPTCP
+ *
+ * @mptcp_add_subflow
+ * 	Update the labeling for the given MPTCP subflow, to match to
+ * 	owning MPTCP socket.
+ * 	@sk: the owning MPTCP socket
+ * 	@ssk: the new subflow
+ * 	Return 0 if successful, otherwise < 0 error code.
+ *
  * Security hooks for Infiniband
  *
  * @ib_pkey_access:
diff --git a/include/linux/security.h b/include/linux/security.h
index 5b67f208f7de..82d50b2ba683 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1479,6 +1479,7 @@ void security_sctp_sk_clone(struct sctp_association *asoc, struct sock *sk,
 			    struct sock *newsk);
 int security_sctp_assoc_established(struct sctp_association *asoc,
 				    struct sk_buff *skb);
+int security_mptcp_add_subflow(struct sock *sk, struct sock *ssk);
 
 #else	/* CONFIG_SECURITY_NETWORK */
 static inline int security_unix_stream_connect(struct sock *sock,
@@ -1706,6 +1707,11 @@ static inline int security_sctp_assoc_established(struct sctp_association *asoc,
 {
 	return 0;
 }
+
+static inline int security_mptcp_add_subflow(struct sock *sk, struct sock *ssk)
+{
+	return 0;
+}
 #endif	/* CONFIG_SECURITY_NETWORK */
 
 #ifdef CONFIG_SECURITY_INFINIBAND
diff --git a/net/mptcp/subflow.c b/net/mptcp/subflow.c
index bd387d4b5a38..43b90784d914 100644
--- a/net/mptcp/subflow.c
+++ b/net/mptcp/subflow.c
@@ -1680,6 +1680,10 @@ int mptcp_subflow_create_socket(struct sock *sk, struct socket **new_sock)
 
 	lock_sock(sf->sk);
 
+	err = security_mptcp_add_subflow(sk, sf->sk);
+	if (err)
+		goto release_ssk;
+
 	/* the newly created socket has to be in the same cgroup as its parent */
 	mptcp_attach_cgroup(sk, sf->sk);
 
@@ -1692,6 +1696,8 @@ int mptcp_subflow_create_socket(struct sock *sk, struct socket **new_sock)
 	get_net_track(net, &sf->sk->ns_tracker, GFP_KERNEL);
 	sock_inuse_add(net, 1);
 	err = tcp_set_ulp(sf->sk, "mptcp");
+
+release_ssk:
 	release_sock(sf->sk);
 
 	if (err) {
diff --git a/security/security.c b/security/security.c
index d1571900a8c7..3491a4fc2b1f 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2493,6 +2493,11 @@ int security_sctp_assoc_established(struct sctp_association *asoc,
 }
 EXPORT_SYMBOL(security_sctp_assoc_established);
 
+int security_mptcp_add_subflow(struct sock *sk, struct sock *ssk)
+{
+	return call_int_hook(mptcp_add_subflow, 0, sk, ssk);
+}
+
 #endif	/* CONFIG_SECURITY_NETWORK */
 
 #ifdef CONFIG_SECURITY_INFINIBAND
-- 
2.38.1

