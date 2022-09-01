Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3D15A95E7
	for <lists+selinux@lfdr.de>; Thu,  1 Sep 2022 13:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbiIALrX (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 1 Sep 2022 07:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232693AbiIALrW (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 1 Sep 2022 07:47:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED9C13970F
        for <selinux@vger.kernel.org>; Thu,  1 Sep 2022 04:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662032840;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eutPO3cXGn6cebFrweOoNTYwOeys4YtCyuzzfOBQHgQ=;
        b=fpTzh60Q357q6dzBvdCPFftHm6lbGZNK3BbUu5M+grcdEg2qQeOS74rI1Y9FNIE6nSdJmq
        c2oNT69pM0QIUtaL8jq3pWKvUErNgz6h0R17zA1K0HFh8khnpoQ7DkMnLYhMR7hhjboG/8
        DpZAFuJCIeZmM/COXXG2I4zU5TyKXQ0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-XXFXnOFrM327aHJD1G-cWg-1; Thu, 01 Sep 2022 07:47:16 -0400
X-MC-Unique: XXFXnOFrM327aHJD1G-cWg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 986B22932489;
        Thu,  1 Sep 2022 11:47:15 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 06ED9403162;
        Thu,  1 Sep 2022 11:47:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <YxA9VJuQpQSgGnhB@ZenIV>
References: <YxA9VJuQpQSgGnhB@ZenIV> <166133579016.3678898.6283195019480567275.stgit@warthog.procyon.org.uk>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     dhowells@redhat.com, Jeff Layton <jlayton@kernel.org>,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna@kernel.org>,
        Scott Mayhew <smayhew@redhat.com>,
        Paul Moore <paul@paul-moore.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        linux-nfs@vger.kernel.org, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, dwysocha@redhat.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] vfs, security: Fix automount superblock LSM init problem, preventing NFS sb sharing
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <152051.1662032833.1@warthog.procyon.org.uk>
Date:   Thu, 01 Sep 2022 12:47:13 +0100
Message-ID: <152052.1662032833@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Al Viro <viro@zeniv.linux.org.uk> wrote:

> What's the reason for difference between selinux and smack instances of
> context_init?  The former allocates only on submount, the latter -
> unconditionally...

I changed selinux to be conditional, but forgot to do the same to smack.  I'll
fix that.

David

