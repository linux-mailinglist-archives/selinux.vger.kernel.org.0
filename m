Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A51807E4F5E
	for <lists+selinux@lfdr.de>; Wed,  8 Nov 2023 04:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234529AbjKHDOh (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 7 Nov 2023 22:14:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjKHDOg (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 7 Nov 2023 22:14:36 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A9D19A
        for <selinux@vger.kernel.org>; Tue,  7 Nov 2023 19:14:34 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d84c24a810dso6619208276.2
        for <selinux@vger.kernel.org>; Tue, 07 Nov 2023 19:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1699413274; x=1700018074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5vx1SuH10I5MRrYLP20KitGIgEW4Afe0xq877n9y14=;
        b=CjlSIiQQuOE3VfMJb6D4Vo36nueAem9Rbb01GWWcXrlRqwHLcWpjjXuMeIbOWPRyhG
         H2/yuzBQxt6xla58bQUxpW9dJiUUuQH1uZh2jB/Nw9DwilvMqzko5Pbln09PRGVUcHzJ
         cC1I/zqOwxC+W4DCYVT+w9iGSXbRbzmVMHKFEm0TDZURchgkWVE7KuJPSR5eIOoDNxe2
         DRzYmfmlG7zup3vE+oQk/4h096IC5Cqox/VAgKgQwp9lpMLAFrN3IPphaVDMW+1AZY5p
         PpHtdmgJhyGihHUA8LYlHK8duyBPk4GEwKzA875M6hxBEKhqdSkv+qLwNJ8vQJP3R4dq
         d/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699413274; x=1700018074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5vx1SuH10I5MRrYLP20KitGIgEW4Afe0xq877n9y14=;
        b=ELUiQ5tavuv/w4UCeQ8ZCgfqXqoEUgqnrxhc2IXhXOkQlJxr/QjYWjxj1FT3bU9glm
         DFK2pjTbJ1xL8MSkHMtQ06k/+63zR5KmNYUwWsrhhdwRCCrrDY8vIIbX0wUsWm/4NZ7R
         fSO6imxbyQ5IJv9KBrAzH6Fn4+9jXg4VMuriOK21LPTasAjP2M9MV9UtcOs4mjyziiQw
         xgN2d7Syw3vI/+fRfZ7j0PIor2T/zA7k/uddGo4kUOoMgKmz7wijUtRFXljg1/MM2M24
         8HNRZd0AHl5FVa4D0nCaUnivaP4Y3NlJ/xh6R15MrxG1ZBvo+/kA78hiSlTXCuRJ+W8X
         6hzA==
X-Gm-Message-State: AOJu0Yz8aKFoL1riSgmV2FWnnedLp37kNT5FP51XMhrRxwHfl7k9MPAO
        ArG6f7EsAVy8XhnfodYHk+bqBYgBd97YUQdUcbrT
X-Google-Smtp-Source: AGHT+IHRgz90UgPoCYkWlS/aMw9sFfxqMSEFQczpq2CHZMN0KkBg+tCoSKeeUm0SHGN1yPZnqOEZ5u4F1SzXp1qhhSI=
X-Received: by 2002:a25:c00f:0:b0:da0:400e:750c with SMTP id
 c15-20020a25c00f000000b00da0400e750cmr643211ybf.27.1699413274027; Tue, 07 Nov
 2023 19:14:34 -0800 (PST)
MIME-Version: 1.0
References: <20231107134012.682009-1-roberto.sassu@huaweicloud.com> <563820b8fd57deb99e6247b6cdb416c4c3af3091.camel@huaweicloud.com>
In-Reply-To: <563820b8fd57deb99e6247b6cdb416c4c3af3091.camel@huaweicloud.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 7 Nov 2023 22:14:23 -0500
Message-ID: <CAHC9VhQ8otggx3uvwsdK=d6CJ167DHRuqPqihibJ37uCQ=_HbA@mail.gmail.com>
Subject: Re: [PATCH v5 00/23] security: Move IMA and EVM to the LSM infrastructure
To:     Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc:     viro@zeniv.linux.org.uk, brauner@kernel.org,
        chuck.lever@oracle.com, jlayton@kernel.org, neilb@suse.de,
        kolga@netapp.com, Dai.Ngo@oracle.com, tom@talpey.com,
        jmorris@namei.org, serge@hallyn.com, zohar@linux.ibm.com,
        dmitry.kasatkin@gmail.com, dhowells@redhat.com, jarkko@kernel.org,
        stephen.smalley.work@gmail.com, eparis@parisplace.org,
        casey@schaufler-ca.com, mic@digikod.net,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-nfs@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        selinux@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Nov 7, 2023 at 9:06=E2=80=AFAM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
> Hi everyone
>
> I kindly ask your support to add the missing reviewed-by/acked-by. I
> summarize what is missing below:
>
> - @Mimi: patches 1, 2, 4, 5, 6, 19, 21, 22, 23 (IMA/EVM-specific
>          patches)
> - @Al/@Christian: patches 10-17 (VFS-specific patches)
> - @Paul: patches 10-23 (VFS-specific patches/new LSM hooks/new LSMs)

This patchset is next in my review queue :)

> - @David Howells/@Jarkko: patch 18 (new LSM hook in the key subsystem)
> - @Chuck Lever: patch 12 (new LSM hook in nfsd/vfs.c)
>
> Paul, as I mentioned I currently based the patch set on lsm/dev-
> staging, which include the following dependencies:
>
> 8f79e425c140 lsm: don't yet account for IMA in LSM_CONFIG_COUNT calculati=
on
> 3c91a124f23d lsm: drop LSM_ID_IMA
>
> I know you wanted to wait until at least rc1 to make lsm/dev. I will
> help for rebasing my patch set, if needed.

No, it should be fine for right now.  Thanks for your patience and
help with all of this.

--=20
paul-moore.com
