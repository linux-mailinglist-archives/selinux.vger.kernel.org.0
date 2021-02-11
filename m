Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB643191D7
	for <lists+selinux@lfdr.de>; Thu, 11 Feb 2021 19:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbhBKSGj (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 11 Feb 2021 13:06:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27552 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231779AbhBKSEg (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 11 Feb 2021 13:04:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613066588;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=j1ILfo/o+FmFL239i12Ix9qTcCXGpkuHeX4RIPzEE+0=;
        b=gVYXt2GN05kkxYBESm5xfysY+zKzei8vdBu7Yb7FczRIhISXqibdNnLRkI1qzntIybLuOD
        VAKhRTJlwdfX3ctP0ZTpoO8sPIaMohvIoDxvv56Mlw9+WYvKl58vbn7HeF+tNO30T0fxJy
        9tBX5u5T29uoM0PQ1ascMhnPhdEJkWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-TqfEWiCuM6KAi1gE3D3kyQ-1; Thu, 11 Feb 2021 13:03:06 -0500
X-MC-Unique: TqfEWiCuM6KAi1gE3D3kyQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12B9F183CD04;
        Thu, 11 Feb 2021 18:03:05 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-229.rdu2.redhat.com [10.10.115.229])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7ECFD5C1BD;
        Thu, 11 Feb 2021 18:03:04 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
        id 01A53220BCF; Thu, 11 Feb 2021 13:03:03 -0500 (EST)
Date:   Thu, 11 Feb 2021 13:03:03 -0500
From:   Vivek Goyal <vgoyal@redhat.com>
To:     selinux@vger.kernel.org, linux-unionfs@vger.kernel.org
Cc:     Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Daniel J Walsh <dwalsh@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Giuseppe Scrivano <gscrivan@redhat.com>
Subject: [PATCH][v2] selinux: Allow context mounts for unpriviliged overlayfs
Message-ID: <20210211180303.GE5014@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Now overlayfs allow unpriviliged mounts. That is root inside a non-init
user namespace can mount overlayfs. This is being added in 5.11 kernel.

Giuseppe tried to mount overlayfs with option "context" and it failed
with error -EACCESS.

$ su test
$ unshare -rm
$ mkdir -p lower upper work merged
$ mount -t overlay -o lowerdir=lower,workdir=work,upperdir=upper,userxattr,context='system_u:object_r:container_file_t:s0' none merged

This fails with -EACCESS. It works if option "-o context" is not specified.

Little debugging showed that selinux_set_mnt_opts() returns -EACCESS.

So this patch adds "overlay" to the list, where it is fine to specific
context from non init_user_ns.

v2: Fixed commit message to reflect that unpriveleged overlayfs mount is
    being added in 5.11 and not in 5.10 kernel.

Reported-by: Giuseppe Scrivano <gscrivan@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 security/selinux/hooks.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: redhat-linux/security/selinux/hooks.c
===================================================================
--- redhat-linux.orig/security/selinux/hooks.c	2021-02-09 10:56:12.954988476 -0500
+++ redhat-linux/security/selinux/hooks.c	2021-02-09 14:36:33.136205330 -0500
@@ -733,7 +733,8 @@ static int selinux_set_mnt_opts(struct s
 	if (sb->s_user_ns != &init_user_ns &&
 	    strcmp(sb->s_type->name, "tmpfs") &&
 	    strcmp(sb->s_type->name, "ramfs") &&
-	    strcmp(sb->s_type->name, "devpts")) {
+	    strcmp(sb->s_type->name, "devpts") &&
+	    strcmp(sb->s_type->name, "overlay")) {
 		if (context_sid || fscontext_sid || rootcontext_sid ||
 		    defcontext_sid) {
 			rc = -EACCES;

