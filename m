Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D15EF571A9
	for <lists+selinux@lfdr.de>; Wed, 26 Jun 2019 21:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbfFZTXZ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 26 Jun 2019 15:23:25 -0400
Received: from sonic316-12.consmr.mail.gq1.yahoo.com ([98.137.69.36]:36588
        "EHLO sonic316-12.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726586AbfFZTXY (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 26 Jun 2019 15:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1561577001; bh=sH5xJHZsa7g2m1YwxtZVGhabaVvM+22DGB/wZEvo8VE=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=QgJA+vSlTo6bQYSMQ5mAFYrAGDN8WbZIJTt2i4PnogSHWczALUJMv8KJBLASidXeP2w2IfK+cRSNjB7C0CXBR5nBFvxDDuxLNic1P4Pgv3cIdseUZr65uOW5JNXBfH4MqvR23BITLLzQyFpcZ5RCs6wkWL6ZgJ46cflobbL1kedSVnY5a6EYP0ZQx0VWtUazy6wkR/2E7Z5OMulECK9Jt67TLGcV0R85Uxy+QbTSV6zFQNUMHZ7s6AFWn6l98C9x4SDrdkA1d87e/1UIJhPEkKSzQWmNMgVzjs5o5WlDemVttzzTjnpkaltMVOhe++Qv+u0lnGC8Tk6hRDF2rX77IA==
X-YMail-OSG: 64DR6fwVM1n4i3.RhKA75l2T.j7NbCCFbLP3ztGv7Ow7PFcL7lO1exWDfP2ol6_
 qqoL9my2RLb5Kxabh53Krfa3V9uLnMlmAjszXWQ16N7kB90IOJJYvwVARFMp8lfePwln3a28YeNf
 kWe5jx4ENT08XQFZHipyLimKkgTZsW7HCC25MAWk.U1ilJYOY_lXRtYBiyLwPg_70a5oYOufitUe
 Al.Msi1m._wUjQHrLEUZUIk_Fbwjom2JmziXLittfNl.l8znG5yX1mgjcpEcZFOCNnixdNgZhouG
 qJxU9nNa8Cg3ziBJu_2ziZFNXEDHWk0NJu94NMwMUxFRHyVCIHUB.x9dP3IgjJlk22K_xL9BYeqs
 NHY76knw9uuPUKKYWQIT6tm1anexKRMkrNHhfPQBV53NVs8uTz710QFzPqka6UmEADeO2mCVMCgu
 1OILoORGfelPYnd6g80WDCw_oxCShFPgsY.1wQ0pLZXk69H5TBA3t.Unlj_Yf3hjlIjkG7KpiGbt
 TpV69GMC0.d_iC4JgMrwPmWHcvdFuvURB3YOA2kzDI43BngsxfWp9dRdnxw2mQ.AVBIXfPJQNWa_
 K9BEYLagUELB3.sjA6UDlTGbQ_httxytewxsuBUX_pSyYx4bGZ7siqYnLyqFwQM1JAIXP4udCRCh
 t7HNOWL10Kcxx29qDpjL1.5S2lFRtjK7VxY5qvq2QDJbt0QXq1T9hc9kvzW49corG_E4g.gWbb3T
 irL.kavNQy4f1fKrU7gHumUUG0CRp7vig2DOEeQycOq4HyjDkoFPLztfvhdN8Xtt2zpxmK9Wp85_
 2B38JYLhs6p3Um9MeZMd59qf6emIhEs.Zc2fqg9Bw_uwMHtBZ3ffvuJmPNQ.y9HWl34WZRIoJSzW
 yiRf2hHXQe6yMyb5jmCc9f6EMB5nOqJqUZhcKy3ZPTcIW9pEgDZzDR9im7_hY1iPwG9YDipyL76p
 0Xy7fFtU401Mi_mOGktBLFjCweQES_dBtilmLLGb9Jtq1Tl1JCqOnY.tPDjilB1V93.oPk04_Crv
 Opp48pZLMkCD_nimsWAj0UcyRbGgRvs7abm7GeZNpqqAtUuRSiqzJkCdLX0POQIqcf3hd1J64pSB
 npzT2AVAKlPCF4.ROWzgR.fjz7d9mG0MrSpmPqaCFLsEGlXo6qNaTRf0UtZNLTwj6Co2awuZOqFQ
 07DoxT81ow5E8n4P5iU_dL6RS_UmYnVhS7rIUlZJvuyQzwr1USPWrx6Uoopu.AatvfLlO8iaOHU3
 DW77n6R4HkwA7tHiOcBfwi4jJe2r4sXrp.WfKHAw58HJNCAEZiOgA
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 Jun 2019 19:23:21 +0000
Received: from c-73-223-4-185.hsd1.ca.comcast.net (EHLO localhost.net) ([73.223.4.185])
          by smtp413.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 7fc532bf6bcf33ac8b649a0abf15fbe8;
          Wed, 26 Jun 2019 19:23:20 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH v4 22/23] NET: Store LSM netlabel data in a lsmblob
Date:   Wed, 26 Jun 2019 12:22:33 -0700
Message-Id: <20190626192234.11725-23-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626192234.11725-1-casey@schaufler-ca.com>
References: <20190626192234.11725-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Netlabel uses LSM interfaces requiring an lsmblob and
the internal storage is used to pass information between
these interfaces, so change the internal data from a secid
to a lsmblob. Update the netlabel interfaces and their
callers to accomodate the change. This requires that the
modules using netlabel use the lsm_id.slot to access the
correct secid when using netlabel.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/net/netlabel.h              |  8 ++--
 net/ipv4/cipso_ipv4.c               |  6 ++-
 net/netlabel/netlabel_kapi.c        |  6 +--
 net/netlabel/netlabel_unlabeled.c   | 57 +++++++++++------------------
 net/netlabel/netlabel_unlabeled.h   |  2 +-
 security/selinux/hooks.c            |  2 +-
 security/selinux/include/security.h |  1 +
 security/selinux/netlabel.c         |  2 +-
 security/selinux/ss/services.c      |  4 +-
 security/smack/smack.h              |  1 +
 security/smack/smack_lsm.c          |  5 ++-
 security/smack/smackfs.c            | 10 +++--
 12 files changed, 50 insertions(+), 54 deletions(-)

diff --git a/include/net/netlabel.h b/include/net/netlabel.h
index 72d6435fc16c..6c550455e69f 100644
--- a/include/net/netlabel.h
+++ b/include/net/netlabel.h
@@ -180,7 +180,7 @@ struct netlbl_lsm_catmap {
  * @attr.mls: MLS sensitivity label
  * @attr.mls.cat: MLS category bitmap
  * @attr.mls.lvl: MLS sensitivity level
- * @attr.secid: LSM specific secid token
+ * @attr.lsmblob: LSM specific data
  *
  * Description:
  * This structure is used to pass security attributes between NetLabel and the
@@ -215,7 +215,7 @@ struct netlbl_lsm_secattr {
 			struct netlbl_lsm_catmap *cat;
 			u32 lvl;
 		} mls;
-		u32 secid;
+		struct lsmblob lsmblob;
 	} attr;
 };
 
@@ -429,7 +429,7 @@ int netlbl_cfg_unlbl_static_add(struct net *net,
 				const void *addr,
 				const void *mask,
 				u16 family,
-				u32 secid,
+				struct lsmblob *lsmblob,
 				struct netlbl_audit *audit_info);
 int netlbl_cfg_unlbl_static_del(struct net *net,
 				const char *dev_name,
@@ -537,7 +537,7 @@ static inline int netlbl_cfg_unlbl_static_add(struct net *net,
 					      const void *addr,
 					      const void *mask,
 					      u16 family,
-					      u32 secid,
+					      struct lsmblob *lsmblob,
 					      struct netlbl_audit *audit_info)
 {
 	return -ENOSYS;
diff --git a/net/ipv4/cipso_ipv4.c b/net/ipv4/cipso_ipv4.c
index f0165c5f376b..eb4939f38a14 100644
--- a/net/ipv4/cipso_ipv4.c
+++ b/net/ipv4/cipso_ipv4.c
@@ -1481,7 +1481,8 @@ static int cipso_v4_gentag_loc(const struct cipso_v4_doi *doi_def,
 
 	buffer[0] = CIPSO_V4_TAG_LOCAL;
 	buffer[1] = CIPSO_V4_TAG_LOC_BLEN;
-	*(u32 *)&buffer[2] = secattr->attr.secid;
+	/* only one netlabel user - the first */
+	*(u32 *)&buffer[2] = secattr->attr.lsmblob.secid[0];
 
 	return CIPSO_V4_TAG_LOC_BLEN;
 }
@@ -1501,7 +1502,8 @@ static int cipso_v4_parsetag_loc(const struct cipso_v4_doi *doi_def,
 				 const unsigned char *tag,
 				 struct netlbl_lsm_secattr *secattr)
 {
-	secattr->attr.secid = *(u32 *)&tag[2];
+	/* only one netlabel user - the first */
+	secattr->attr.lsmblob.secid[0] = *(u32 *)&tag[2];
 	secattr->flags |= NETLBL_SECATTR_SECID;
 
 	return 0;
diff --git a/net/netlabel/netlabel_kapi.c b/net/netlabel/netlabel_kapi.c
index ee3e5b6471a6..724d44943543 100644
--- a/net/netlabel/netlabel_kapi.c
+++ b/net/netlabel/netlabel_kapi.c
@@ -210,7 +210,7 @@ int netlbl_cfg_unlbl_map_add(const char *domain,
  * @addr: IP address in network byte order (struct in[6]_addr)
  * @mask: address mask in network byte order (struct in[6]_addr)
  * @family: address family
- * @secid: LSM secid value for the entry
+ * @lsmblob: LSM data value for the entry
  * @audit_info: NetLabel audit information
  *
  * Description:
@@ -224,7 +224,7 @@ int netlbl_cfg_unlbl_static_add(struct net *net,
 				const void *addr,
 				const void *mask,
 				u16 family,
-				u32 secid,
+				struct lsmblob *lsmblob,
 				struct netlbl_audit *audit_info)
 {
 	u32 addr_len;
@@ -244,7 +244,7 @@ int netlbl_cfg_unlbl_static_add(struct net *net,
 
 	return netlbl_unlhsh_add(net,
 				 dev_name, addr, mask, addr_len,
-				 secid, audit_info);
+				 lsmblob, audit_info);
 }
 
 /**
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
index 4716e0011ba5..57ede7781c8f 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -80,7 +80,7 @@ struct netlbl_unlhsh_tbl {
 #define netlbl_unlhsh_addr4_entry(iter) \
 	container_of(iter, struct netlbl_unlhsh_addr4, list)
 struct netlbl_unlhsh_addr4 {
-	u32 secid;
+	struct lsmblob lsmblob;
 
 	struct netlbl_af4list list;
 	struct rcu_head rcu;
@@ -88,7 +88,7 @@ struct netlbl_unlhsh_addr4 {
 #define netlbl_unlhsh_addr6_entry(iter) \
 	container_of(iter, struct netlbl_unlhsh_addr6, list)
 struct netlbl_unlhsh_addr6 {
-	u32 secid;
+	struct lsmblob lsmblob;
 
 	struct netlbl_af6list list;
 	struct rcu_head rcu;
@@ -233,7 +233,7 @@ static struct netlbl_unlhsh_iface *netlbl_unlhsh_search_iface(int ifindex)
  * @iface: the associated interface entry
  * @addr: IPv4 address in network byte order
  * @mask: IPv4 address mask in network byte order
- * @secid: LSM secid value for entry
+ * @lsmblob: LSM data value for entry
  *
  * Description:
  * Add a new address entry into the unlabeled connection hash table using the
@@ -244,7 +244,7 @@ static struct netlbl_unlhsh_iface *netlbl_unlhsh_search_iface(int ifindex)
 static int netlbl_unlhsh_add_addr4(struct netlbl_unlhsh_iface *iface,
 				   const struct in_addr *addr,
 				   const struct in_addr *mask,
-				   u32 secid)
+				   struct lsmblob *lsmblob)
 {
 	int ret_val;
 	struct netlbl_unlhsh_addr4 *entry;
@@ -256,7 +256,7 @@ static int netlbl_unlhsh_add_addr4(struct netlbl_unlhsh_iface *iface,
 	entry->list.addr = addr->s_addr & mask->s_addr;
 	entry->list.mask = mask->s_addr;
 	entry->list.valid = 1;
-	entry->secid = secid;
+	entry->lsmblob = *lsmblob;
 
 	spin_lock(&netlbl_unlhsh_lock);
 	ret_val = netlbl_af4list_add(&entry->list, &iface->addr4_list);
@@ -273,7 +273,7 @@ static int netlbl_unlhsh_add_addr4(struct netlbl_unlhsh_iface *iface,
  * @iface: the associated interface entry
  * @addr: IPv6 address in network byte order
  * @mask: IPv6 address mask in network byte order
- * @secid: LSM secid value for entry
+ * @lsmblob: LSM data value for entry
  *
  * Description:
  * Add a new address entry into the unlabeled connection hash table using the
@@ -284,7 +284,7 @@ static int netlbl_unlhsh_add_addr4(struct netlbl_unlhsh_iface *iface,
 static int netlbl_unlhsh_add_addr6(struct netlbl_unlhsh_iface *iface,
 				   const struct in6_addr *addr,
 				   const struct in6_addr *mask,
-				   u32 secid)
+				   struct lsmblob *lsmblob)
 {
 	int ret_val;
 	struct netlbl_unlhsh_addr6 *entry;
@@ -300,7 +300,7 @@ static int netlbl_unlhsh_add_addr6(struct netlbl_unlhsh_iface *iface,
 	entry->list.addr.s6_addr32[3] &= mask->s6_addr32[3];
 	entry->list.mask = *mask;
 	entry->list.valid = 1;
-	entry->secid = secid;
+	entry->lsmblob = *lsmblob;
 
 	spin_lock(&netlbl_unlhsh_lock);
 	ret_val = netlbl_af6list_add(&entry->list, &iface->addr6_list);
@@ -379,7 +379,7 @@ int netlbl_unlhsh_add(struct net *net,
 		      const void *addr,
 		      const void *mask,
 		      u32 addr_len,
-		      u32 secid,
+		      struct lsmblob *lsmblob,
 		      struct netlbl_audit *audit_info)
 {
 	int ret_val;
@@ -388,7 +388,6 @@ int netlbl_unlhsh_add(struct net *net,
 	struct netlbl_unlhsh_iface *iface;
 	struct audit_buffer *audit_buf = NULL;
 	struct lsmcontext context;
-	struct lsmblob blob;
 
 	if (addr_len != sizeof(struct in_addr) &&
 	    addr_len != sizeof(struct in6_addr))
@@ -421,7 +420,7 @@ int netlbl_unlhsh_add(struct net *net,
 		const struct in_addr *addr4 = addr;
 		const struct in_addr *mask4 = mask;
 
-		ret_val = netlbl_unlhsh_add_addr4(iface, addr4, mask4, secid);
+		ret_val = netlbl_unlhsh_add_addr4(iface, addr4, mask4, lsmblob);
 		if (audit_buf != NULL)
 			netlbl_af4list_audit_addr(audit_buf, 1,
 						  dev_name,
@@ -434,7 +433,7 @@ int netlbl_unlhsh_add(struct net *net,
 		const struct in6_addr *addr6 = addr;
 		const struct in6_addr *mask6 = mask;
 
-		ret_val = netlbl_unlhsh_add_addr6(iface, addr6, mask6, secid);
+		ret_val = netlbl_unlhsh_add_addr6(iface, addr6, mask6, lsmblob);
 		if (audit_buf != NULL)
 			netlbl_af6list_audit_addr(audit_buf, 1,
 						  dev_name,
@@ -451,8 +450,7 @@ int netlbl_unlhsh_add(struct net *net,
 unlhsh_add_return:
 	rcu_read_unlock();
 	if (audit_buf != NULL) {
-		lsmblob_init(&blob, secid);
-		if (security_secid_to_secctx(&blob, &context) == 0) {
+		if (security_secid_to_secctx(lsmblob, &context) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s",
 					 context.context);
 			security_release_secctx(&context);
@@ -487,7 +485,6 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 	struct audit_buffer *audit_buf;
 	struct net_device *dev;
 	struct lsmcontext context;
-	struct lsmblob blob;
 
 	spin_lock(&netlbl_unlhsh_lock);
 	list_entry = netlbl_af4list_remove(addr->s_addr, mask->s_addr,
@@ -507,10 +504,8 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 					  addr->s_addr, mask->s_addr);
 		if (dev != NULL)
 			dev_put(dev);
-		if (entry != NULL)
-			lsmblob_init(&blob, entry->secid);
 		if (entry != NULL &&
-		    security_secid_to_secctx(&blob, &context) == 0) {
+		    security_secid_to_secctx(&entry->lsmblob, &context) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s",
 					 context.context);
 			security_release_secctx(&context);
@@ -551,7 +546,6 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 	struct audit_buffer *audit_buf;
 	struct net_device *dev;
 	struct lsmcontext context;
-	struct lsmblob blob;
 
 	spin_lock(&netlbl_unlhsh_lock);
 	list_entry = netlbl_af6list_remove(addr, mask, &iface->addr6_list);
@@ -570,10 +564,8 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 					  addr, mask);
 		if (dev != NULL)
 			dev_put(dev);
-		if (entry != NULL)
-			lsmblob_init(&blob, entry->secid);
 		if (entry != NULL &&
-		    security_secid_to_secctx(&blob, &context) == 0) {
+		    security_secid_to_secctx(&entry->lsmblob, &context) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s",
 					 context.context);
 			security_release_secctx(&context);
@@ -927,9 +919,8 @@ static int netlbl_unlabel_staticadd(struct sk_buff *skb,
 	if (ret_val != 0)
 		return ret_val;
 
-	/* scaffolding with the [0] */
 	return netlbl_unlhsh_add(&init_net,
-				 dev_name, addr, mask, addr_len, blob.secid[0],
+				 dev_name, addr, mask, addr_len, &blob,
 				 &audit_info);
 }
 
@@ -977,10 +968,8 @@ static int netlbl_unlabel_staticadddef(struct sk_buff *skb,
 	if (ret_val != 0)
 		return ret_val;
 
-	/* scaffolding with the [0] */
 	return netlbl_unlhsh_add(&init_net,
-				 NULL, addr, mask, addr_len, blob.secid[0],
-				 &audit_info);
+				 NULL, addr, mask, addr_len, &blob, &audit_info);
 }
 
 /**
@@ -1092,8 +1081,7 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 	struct net_device *dev;
 	struct lsmcontext context;
 	void *data;
-	u32 secid;
-	struct lsmblob blob;
+	struct lsmblob *lsmb;
 
 	data = genlmsg_put(cb_arg->skb, NETLINK_CB(cb_arg->nl_cb->skb).portid,
 			   cb_arg->seq, &netlbl_unlabel_gnl_family,
@@ -1131,7 +1119,7 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 		if (ret_val != 0)
 			goto list_cb_failure;
 
-		secid = addr4->secid;
+		lsmb = (struct lsmblob *)&addr4->lsmblob;
 	} else {
 		ret_val = nla_put_in6_addr(cb_arg->skb,
 					   NLBL_UNLABEL_A_IPV6ADDR,
@@ -1145,11 +1133,10 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 		if (ret_val != 0)
 			goto list_cb_failure;
 
-		secid = addr6->secid;
+		lsmb = (struct lsmblob *)&addr6->lsmblob;
 	}
 
-	lsmblob_init(&blob, secid);
-	ret_val = security_secid_to_secctx(&blob, &context);
+	ret_val = security_secid_to_secctx(lsmb, &context);
 	if (ret_val != 0)
 		goto list_cb_failure;
 	ret_val = nla_put(cb_arg->skb,
@@ -1500,7 +1487,7 @@ int netlbl_unlabel_getattr(const struct sk_buff *skb,
 					      &iface->addr4_list);
 		if (addr4 == NULL)
 			goto unlabel_getattr_nolabel;
-		secattr->attr.secid = netlbl_unlhsh_addr4_entry(addr4)->secid;
+		secattr->attr.lsmblob = netlbl_unlhsh_addr4_entry(addr4)->lsmblob;
 		break;
 	}
 #if IS_ENABLED(CONFIG_IPV6)
@@ -1513,7 +1500,7 @@ int netlbl_unlabel_getattr(const struct sk_buff *skb,
 					      &iface->addr6_list);
 		if (addr6 == NULL)
 			goto unlabel_getattr_nolabel;
-		secattr->attr.secid = netlbl_unlhsh_addr6_entry(addr6)->secid;
+		secattr->attr.lsmblob = netlbl_unlhsh_addr6_entry(addr6)->lsmblob;
 		break;
 	}
 #endif /* IPv6 */
diff --git a/net/netlabel/netlabel_unlabeled.h b/net/netlabel/netlabel_unlabeled.h
index 3a9e5dc9511b..dcff99695c97 100644
--- a/net/netlabel/netlabel_unlabeled.h
+++ b/net/netlabel/netlabel_unlabeled.h
@@ -225,7 +225,7 @@ int netlbl_unlhsh_add(struct net *net,
 		      const void *addr,
 		      const void *mask,
 		      u32 addr_len,
-		      u32 secid,
+		      struct lsmblob *lsmblob,
 		      struct netlbl_audit *audit_info);
 int netlbl_unlhsh_remove(struct net *net,
 			 const char *dev_name,
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 8c93b07bb353..d90dfce15d44 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6622,7 +6622,7 @@ struct lsm_blob_sizes selinux_blob_sizes __lsm_ro_after_init = {
 	.lbs_superblock = sizeof(struct superblock_security_struct),
 };
 
-static struct lsm_id selinux_lsmid = { .lsm="selinux", .slot=LSMBLOB_NEEDED };
+struct lsm_id selinux_lsmid = { .lsm="selinux", .slot=LSMBLOB_NEEDED };
 
 static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(binder_set_context_mgr, selinux_binder_set_context_mgr),
diff --git a/security/selinux/include/security.h b/security/selinux/include/security.h
index b5b7c5aade8c..f0ca3879ba48 100644
--- a/security/selinux/include/security.h
+++ b/security/selinux/include/security.h
@@ -68,6 +68,7 @@
 struct netlbl_lsm_secattr;
 
 extern int selinux_enabled;
+extern struct lsm_id selinux_lsmid;
 
 /* Policy capabilities */
 enum {
diff --git a/security/selinux/netlabel.c b/security/selinux/netlabel.c
index c40914a157b7..120d50c1bcac 100644
--- a/security/selinux/netlabel.c
+++ b/security/selinux/netlabel.c
@@ -122,7 +122,7 @@ static struct netlbl_lsm_secattr *selinux_netlbl_sock_getattr(
 		return NULL;
 
 	if ((secattr->flags & NETLBL_SECATTR_SECID) &&
-	    (secattr->attr.secid == sid))
+	    (secattr->attr.lsmblob.secid[selinux_lsmid.slot] == sid))
 		return secattr;
 
 	return NULL;
diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index e3f5d6aece66..4ca0e006c3cc 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -3593,7 +3593,7 @@ int security_netlbl_secattr_to_sid(struct selinux_state *state,
 	if (secattr->flags & NETLBL_SECATTR_CACHE)
 		*sid = *(u32 *)secattr->cache->data;
 	else if (secattr->flags & NETLBL_SECATTR_SECID)
-		*sid = secattr->attr.secid;
+		*sid = secattr->attr.lsmblob.secid[selinux_lsmid.slot];
 	else if (secattr->flags & NETLBL_SECATTR_MLS_LVL) {
 		rc = -EIDRM;
 		ctx = sidtab_search(sidtab, SECINITSID_NETMSG);
@@ -3666,7 +3666,7 @@ int security_netlbl_sid_to_secattr(struct selinux_state *state,
 	if (secattr->domain == NULL)
 		goto out;
 
-	secattr->attr.secid = sid;
+	secattr->attr.lsmblob.secid[selinux_lsmid.slot] = sid;
 	secattr->flags |= NETLBL_SECATTR_DOMAIN_CPY | NETLBL_SECATTR_SECID;
 	mls_export_netlbl_lvl(policydb, ctx, secattr);
 	rc = mls_export_netlbl_cat(policydb, ctx, secattr);
diff --git a/security/smack/smack.h b/security/smack/smack.h
index 7cc3a3382fee..039bf5de56b4 100644
--- a/security/smack/smack.h
+++ b/security/smack/smack.h
@@ -320,6 +320,7 @@ void smk_destroy_label_list(struct list_head *list);
  * Shared data.
  */
 extern int smack_enabled;
+extern struct lsm_id smack_lsmid;
 extern int smack_cipso_direct;
 extern int smack_cipso_mapped;
 extern struct smack_known *smack_net_ambient;
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 3d571c438dfa..a8d56ce00918 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -3741,7 +3741,8 @@ static struct smack_known *smack_from_secattr(struct netlbl_lsm_secattr *sap,
 		/*
 		 * Looks like a fallback, which gives us a secid.
 		 */
-		return smack_from_secid(sap->attr.secid);
+		return smack_from_secid(
+				sap->attr.lsmblob.secid[smack_lsmid.slot]);
 	/*
 	 * Without guidance regarding the smack value
 	 * for the packet fall back on the network
@@ -4558,7 +4559,7 @@ struct lsm_blob_sizes smack_blob_sizes __lsm_ro_after_init = {
 	.lbs_superblock = sizeof(struct superblock_smack),
 };
 
-static struct lsm_id smack_lsmid = { .lsm="smack", .slot=LSMBLOB_NEEDED };
+struct lsm_id smack_lsmid = { .lsm="smack", .slot=LSMBLOB_NEEDED };
 
 static struct security_hook_list smack_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(ptrace_access_check, smack_ptrace_access_check),
diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
index faf2ea3968b3..6a4c468c200c 100644
--- a/security/smack/smackfs.c
+++ b/security/smack/smackfs.c
@@ -1150,6 +1150,7 @@ static void smk_net4addr_insert(struct smk_net4addr *new)
 static ssize_t smk_write_net4addr(struct file *file, const char __user *buf,
 				size_t count, loff_t *ppos)
 {
+	struct lsmblob lsmblob;
 	struct smk_net4addr *snp;
 	struct sockaddr_in newname;
 	char *smack;
@@ -1281,10 +1282,13 @@ static ssize_t smk_write_net4addr(struct file *file, const char __user *buf,
 	 * this host so that incoming packets get labeled.
 	 * but only if we didn't get the special CIPSO option
 	 */
-	if (rc == 0 && skp != NULL)
+	if (rc == 0 && skp != NULL) {
+		lsmblob_init(&lsmblob, 0);
+		lsmblob.secid[smack_lsmid.slot] = snp->smk_label->smk_secid;
 		rc = netlbl_cfg_unlbl_static_add(&init_net, NULL,
-			&snp->smk_host, &snp->smk_mask, PF_INET,
-			snp->smk_label->smk_secid, &audit_info);
+			&snp->smk_host, &snp->smk_mask, PF_INET, &lsmblob,
+			&audit_info);
+	}
 
 	if (rc == 0)
 		rc = count;
-- 
2.20.1

