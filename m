Return-Path: <selinux+bounces-1740-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF16959971
	for <lists+selinux@lfdr.de>; Wed, 21 Aug 2024 13:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC1F9B247CA
	for <lists+selinux@lfdr.de>; Wed, 21 Aug 2024 11:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6571C4EF6;
	Wed, 21 Aug 2024 09:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="Ox60FBZB"
X-Original-To: selinux@vger.kernel.org
Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch [45.157.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B952C1C4EE8
	for <selinux@vger.kernel.org>; Wed, 21 Aug 2024 09:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724234209; cv=none; b=NNzRGD+RHUZl1/AnDRFXj4IeiYwZwv3TBDcCcJiEh0bjkztx2hrSaE0aHqp+CsbSFj2L7YfUz3NmD3e8o8KAO3zAJst6MdKfQJhV/gNkTTkEWKxgiAWKLf1CPkCyl28eAAg+IW59i4ZeTqCycddy5nKsS++MrWyuepS0NuELg6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724234209; c=relaxed/simple;
	bh=QWrZEraJ1HdvGTLjL05egrMJ/0TxPWXDxYriLvhDu0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nO5NjpF4qDaso0aue5o0MCv2z37rapWyO7ipP5WwCd49Ta/WEgL3BTAXXdYoT060jLrRb/KnFAf9hlVw6nZILshASGTwFf9njRjozvpiR+/Aacn8RjQGyc19LJpBQH+ywWeGCKFeAZhE7DiZGUek+tj7JzeNYgeLBTGHaYLajF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=Ox60FBZB; arc=none smtp.client-ip=45.157.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WphYn0kLFzWr;
	Wed, 21 Aug 2024 11:56:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1724234188;
	bh=nSXgzhxaLWXtS2g1+LQLG+mkFQcvxD/SuRCRuRZ9I3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ox60FBZBAhLUmU0Qbe8PAyseSF2sVRUoG3ei5pRkq/l8y3kMj2h31WAJ6Lq79E/UR
	 VEpapKtSqCn8b4g2xBCTmnQ96qIipyR5rXApErtx0BCUoEWmZiYrKrPuIG3vM5KO1z
	 mjLnD3zJclWQb6ofxDhrPKpyrGKxV314B6+5mt88=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4WphYm1kMYzK84;
	Wed, 21 Aug 2024 11:56:28 +0200 (CEST)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: Christian Brauner <brauner@kernel.org>,
	Paul Moore <paul@paul-moore.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org,
	Jan Kara <jack@suse.cz>,
	Tahera Fahimi <fahimitahera@gmail.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Casey Schaufler <casey@schaufler-ca.com>,
	James Morris <jmorris@namei.org>,
	Jann Horn <jannh@google.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>
Subject: [PATCH v3 2/2] security: Update file_set_fowner documentation
Date: Wed, 21 Aug 2024 11:56:06 +0200
Message-ID: <20240821095609.365176-2-mic@digikod.net>
In-Reply-To: <20240821095609.365176-1-mic@digikod.net>
References: <20240821095609.365176-1-mic@digikod.net>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Highlight that the file_set_fowner hook is now called with a lock held.

Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Casey Schaufler <casey@schaufler-ca.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: James Morris <jmorris@namei.org>
Cc: Jann Horn <jannh@google.com>
Cc: Ondrej Mosnacek <omosnace@redhat.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Serge E. Hallyn <serge@hallyn.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---

Changes since v2:
- Split the doc update into a separate patch to ease backporting.
---
 security/security.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/security/security.c b/security/security.c
index 8cee5b6c6e6d..dc2cd7354015 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2931,6 +2931,8 @@ int security_file_fcntl(struct file *file, unsigned int cmd, unsigned long arg)
  * Save owner security information (typically from current->security) in
  * file->f_security for later use by the send_sigiotask hook.
  *
+ * This hook is called with file->f_owner.lock held.
+ *
  * Return: Returns 0 on success.
  */
 void security_file_set_fowner(struct file *file)
-- 
2.46.0


