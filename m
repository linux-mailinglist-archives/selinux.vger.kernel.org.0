Return-Path: <selinux+bounces-3890-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CDFAD407A
	for <lists+selinux@lfdr.de>; Tue, 10 Jun 2025 19:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 905D23A5EE8
	for <lists+selinux@lfdr.de>; Tue, 10 Jun 2025 17:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BF5248F44;
	Tue, 10 Jun 2025 17:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDqPJUR1"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572F6248880;
	Tue, 10 Jun 2025 17:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576197; cv=none; b=fEL9I3W67pye26apQx8yYRwKZaN/+z1p7ZQucIhmGX29nK81rgcFl2we6RGmO/9szRNKAjKAkWKTOeqeodJE/QH2tnjP0JKeBhzHwA0LIGTrdCkp7HhkDyy0kGiUmACOwdGTsfoQsxhd8ljfGNedaLYxkk4vx6HiQJyCB5ZRbQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576197; c=relaxed/simple;
	bh=/KgZ1EGgODjNUyvkggk2lqwkbe6ebA2nUqdDZRYqPqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0fHGSziq7MMsJ0rKQ4yfHgx0JUc2WSNVjKxR+SbGhXB53YQL/9i0NyTzjVzJeiHOHtKGRa4Itgvyh8m8DowoE6ySG/fG13KmZyv342tWBdCoBDhI8MsaJh5Ql+mriy/865VkBxofIh2uIvA+tjTNybvel7iV9S5dWhNRdAIv8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDqPJUR1; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fb28d4ab79so11424076d6.0;
        Tue, 10 Jun 2025 10:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749576194; x=1750180994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3D/7tdRBCBhx4iOag+EI9Xg2d/VS/yPCChyzETtmSc4=;
        b=BDqPJUR15ZHLwc4kdlgjnLI17TaRDBj3dkTjhaAQIdNUHWHZivoVt2LI1cMZvGP2Bx
         2NT0YmcXAfO2Jf07a3zdH/QRhhtHkR4ZabUXKKwK4CwdDjZZeH8dqcVVOn5q6K6r0U0P
         nCyFdOfVt7ww3eKGd52KbJ79aqldaD75I2BHAoyx5N042m82KNIojHMsLk+HfxiB0UVO
         XAobSTrgWbO2sfwa+I8uTDhog7aCrmbgatoOk3GWu1s5f28u0FlUFKjTHLGLPvCG916O
         zT2T+eA0ntQu5j8pmmJYODurrVbg9GhOET1IkcTuE3GMSAFxCwIpoVuO+6FBWWxDI6RN
         KraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749576194; x=1750180994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3D/7tdRBCBhx4iOag+EI9Xg2d/VS/yPCChyzETtmSc4=;
        b=rirbqagu/kX9zwSI0XkH4fgI7YiKejQzuL2lexWx+Uc4ZdaFVXQ4easSpBxpT3f0MF
         mOZuj/RfHxh7SeP+cYhzEflshwAWOPF1HibCRmdxLAYF2y+2VeO/2C2ZlrLsRJnpoEzd
         vXtlj1x42jjaZ8aoVYPd3iOi2+IjsSriWjX28d455VRa92AZCxlDM4GhX6oB3qInvMWk
         YCAGMuDufFThKLYD3/qHP2JO3SH+cszbA0R6/eu/oDsDaI6BWwU+BTRj/ro/dS0frJJs
         eDgM7Cy8CZqQ2xQir4DO9yBma8KvM+0RlwL1FMWVbxSGUJIqyf37pREw9APqmGkz7wGw
         FszQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTEAqL40BQGMSXR+fZQeUi3QeMckIpNVxU7wpAo+cI/uxCVUZggKyBF+4U8BY0YRrpD8WYX98=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3I9EkV9NPlW8wgRVhrHNkSp0noN+Kk5cdE+vARS2dZj0ShJAT
	Kf/vz4wPuFoQ4+PujQidabEnPL9EnXRyA93vaczck/jA3pRCExrJRAWysTXVww==
X-Gm-Gg: ASbGnctNUIDSWi6mTlYv6mqhPxv28bvB/677Y8Iq+f5N3Kzw+IWohRvPwbaEdBy8ld5
	+E/lU9SZv1siTMbrI11hLhgSbW1kh8ncC2aSg99OI4joNWiZecNOOYMmKJ8RpeKJf7KW+bxSJcb
	yiojDpeAAhjF5ZR0zSHMSN1mGQXZncGxznmkhwDV2vv8tBGowKWYlSovV15iXDqlQ3X8Bu6g7Pn
	1I6InenL5aZadTj1xaKOHqKV967yNx5rfp0uDHARHBG5wh211I4akV+HrexhsjLh6o+VAdQ/LOX
	w8eeqibDtnMe58jkYTeoaTL6d+LFKhVFfQutgVtEdvrbe5wQdRggC1Pz4JmK8P7QKagvyo9eMQ7
	p+n6SbVmE7OIU2iDpsoLSeCS//wVt8jD+9Ocgs96z1XsDqt1ENdSmgVI5xW5hZ2TlmA==
X-Google-Smtp-Source: AGHT+IGvL6VmMwaCEPi37vygFSdqSJs0ez6Qmi+c0TbVokYFtrBbTCqz1Dd2qSN4y5oK2RZAjbUDtg==
X-Received: by 2002:a05:6214:d04:b0:6f5:38a2:52dd with SMTP id 6a1803df08f44-6fb2c376115mr4098776d6.31.1749576193578;
        Tue, 10 Jun 2025 10:23:13 -0700 (PDT)
Received: from fedora.. (ec2-52-70-167-183.compute-1.amazonaws.com. [52.70.167.183])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25a608d19sm716491185a.63.2025.06.10.10.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:23:13 -0700 (PDT)
From: Stephen Smalley <stephen.smalley.work@gmail.com>
To: selinux@vger.kernel.org
Cc: paul@paul-moore.com,
	omosnace@redhat.com,
	netdev@vger.kernel.org,
	Stephen Smalley <stephen.smalley.work@gmail.com>
Subject: [PATCH v4 15/42] selinuxfs: restrict write operations to the same selinux namespace
Date: Tue, 10 Jun 2025 13:21:46 -0400
Message-ID: <20250610172226.1470741-16-stephen.smalley.work@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610172226.1470741-1-stephen.smalley.work@gmail.com>
References: <20250610172226.1470741-1-stephen.smalley.work@gmail.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures that once a process unshares its selinux namespace,
it can no longer act on the parent namespace's selinuxfs instance,
irrespective of policy.  This is a safety measure so that even if
an otherwise unconfined process unshares its selinux namespace, it
won't be able to subsequently affect the enforcing mode or policy of the
parent.  This also helps avoid common mistakes like failing to create
a mount namespace and mount a new selinuxfs instance in order to act
on one's own selinux namespace after unsharing.

Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
---
 security/selinux/selinuxfs.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 39a60d221143..09d22af6e3ea 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -150,6 +150,9 @@ static ssize_t sel_write_enforce(struct file *file, const char __user *buf,
 	int scan_value;
 	bool old_value, new_value;
 
+	if (state != current_selinux_state)
+		return -EPERM;
+
 	if (count >= PAGE_SIZE)
 		return -ENOMEM;
 
@@ -338,11 +341,16 @@ static ssize_t sel_write_unshare(struct file *file, const char __user *buf,
 				 size_t count, loff_t *ppos)
 
 {
+	struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
+	struct selinux_state *state = fsi->state;
 	char *page;
 	ssize_t length;
 	bool set;
 	int rc;
 
+	if (state != current_selinux_state)
+		return -EPERM;
+
 	if (count >= PAGE_SIZE)
 		return -ENOMEM;
 
@@ -795,6 +803,9 @@ static ssize_t sel_write_load(struct file *file, const char __user *buf,
 	if (!count)
 		return -EINVAL;
 
+	if (fsi->state != current_selinux_state)
+		return -EPERM;
+
 	mutex_lock(&fsi->state->policy_mutex);
 	length = avc_has_perm(current_selinux_state,
 			      current_sid(), SECINITSID_SECURITY,
@@ -899,6 +910,9 @@ static ssize_t sel_write_checkreqprot(struct file *file, const char __user *buf,
 	ssize_t length;
 	unsigned int new_value;
 
+	if (fsi->state != current_selinux_state)
+		return -EPERM;
+
 	length = avc_has_perm(current_selinux_state,
 			      current_sid(), SECINITSID_SECURITY,
 			      SECCLASS_SECURITY, SECURITY__SETCHECKREQPROT,
@@ -955,6 +969,9 @@ static ssize_t sel_write_validatetrans(struct file *file,
 	u16 tclass;
 	int rc;
 
+	if (state != current_selinux_state)
+		return -EPERM;
+
 	rc = avc_has_perm(current_selinux_state,
 			  current_sid(), SECINITSID_SECURITY,
 			  SECCLASS_SECURITY, SECURITY__VALIDATE_TRANS, NULL);
@@ -1042,10 +1059,14 @@ static ssize_t (*const write_op[])(struct file *, char *, size_t) = {
 
 static ssize_t selinux_transaction_write(struct file *file, const char __user *buf, size_t size, loff_t *pos)
 {
+	struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
 	ino_t ino = file_inode(file)->i_ino;
 	char *data;
 	ssize_t rv;
 
+	if (fsi->state != current_selinux_state)
+		return -EPERM;
+
 	if (ino >= ARRAY_SIZE(write_op) || !write_op[ino])
 		return -EINVAL;
 
@@ -1486,6 +1507,9 @@ static ssize_t sel_write_bool(struct file *filep, const char __user *buf,
 	unsigned index = file_inode(filep)->i_ino & SEL_INO_MASK;
 	const char *name = filep->f_path.dentry->d_name.name;
 
+	if (fsi->state != current_selinux_state)
+		return -EPERM;
+
 	if (count >= PAGE_SIZE)
 		return -ENOMEM;
 
@@ -1542,6 +1566,9 @@ static ssize_t sel_commit_bools_write(struct file *filep,
 	ssize_t length;
 	int new_value;
 
+	if (fsi->state != current_selinux_state)
+		return -EPERM;
+
 	if (count >= PAGE_SIZE)
 		return -ENOMEM;
 
@@ -1673,6 +1700,9 @@ static ssize_t sel_write_avc_cache_threshold(struct file *file,
 	ssize_t ret;
 	unsigned int new_value;
 
+	if (state != current_selinux_state)
+		return -EPERM;
+
 	ret = avc_has_perm(current_selinux_state,
 			   current_sid(), SECINITSID_SECURITY,
 			   SECCLASS_SECURITY, SECURITY__SETSECPARAM,
-- 
2.49.0


