Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42484770465
	for <lists+selinux@lfdr.de>; Fri,  4 Aug 2023 17:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbjHDPXl (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 4 Aug 2023 11:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbjHDPXV (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 4 Aug 2023 11:23:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B06B9
        for <selinux@vger.kernel.org>; Fri,  4 Aug 2023 08:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691162553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cRTKIps5e2RvIdzVyJjgI0cG9YCwq1ahnGCNR3vJoyY=;
        b=MfqajW72T1OY8XZxe4GZxbRz70fNFvWIdGSOyxZ5ErI98ZIcFLw2I5uXg2S9jzwW4G3Mmw
        JH/pmFbAtlladuE9fex0334DlP1leecoViT8a9Z3T3Yg1yh5gvzh84jtEyAmm3tMnRC5Vs
        TnaL2WUefURoKHu8J8oFrCgcBxiAvg8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-KRoTGT2sO_Ka4gD5uqoLZg-1; Fri, 04 Aug 2023 11:22:31 -0400
X-MC-Unique: KRoTGT2sO_Ka4gD5uqoLZg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DDB483FC20;
        Fri,  4 Aug 2023 15:22:30 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.131])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 701101121325;
        Fri,  4 Aug 2023 15:22:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <2678222.1691162178@warthog.procyon.org.uk>
References: <2678222.1691162178@warthog.procyon.org.uk> <bac543537058619345b363bbfc745927.paul@paul-moore.com> <20230802-master-v6-1-45d48299168b@kernel.org>
To:     Paul Moore <paul@paul-moore.com>
Cc:     dhowells@redhat.com, Jeff Layton <jlayton@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna@kernel.org>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Scott Mayhew <smayhew@redhat.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-nfs@vger.kernel.org, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org
Subject: Re: [PATCH v6] vfs, security: Fix automount superblock LSM init problem, preventing NFS sb sharing
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2680107.1691162547.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Fri, 04 Aug 2023 16:22:27 +0100
Message-ID: <2680108.1691162547@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

David Howells <dhowells@redhat.com> wrote:

> IIRC, the issue is when you make a mount with an explicit context=3D set=
ting and
> make another mount from some way down the export tree that doesn't have =
an
> explicit setting, e.g.:
> =

> 	mount carina:/ /mnt -o context=3Dsystem_u:object_r:root_t:s0
> 	mount carina:/nfs/scratch /mnt2
> =

> and then cause an automount to walk from one to the other:
> =

> 	stat /mnt/nfs/scratch/foo

Actually, the order there isn't quite right.  The problem is with this ord=
er:

	# mount carina:/ /mnt -o context=3Dsystem_u:object_r:root_t:s0
	# stat /mnt/nfs/scratch/bus
	  File: /mnt/nfs/scratch/bus
	  Size: 124160          Blocks: 248        IO Block: 1048576 regular file
	Device: 0,55    Inode: 131         Links: 1
	...
	# mount carina:/nfs/scratch /mnt2
	mount.nfs: /mnt2 is busy or already mounted or sharecache fail

with the error:

	SELinux: mount invalid.  Same superblock, different security settings for=
 (dev 0:52, type nfs4)

David

