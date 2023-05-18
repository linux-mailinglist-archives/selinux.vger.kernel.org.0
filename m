Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BED2A708672
	for <lists+selinux@lfdr.de>; Thu, 18 May 2023 19:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjERRMK (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 18 May 2023 13:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjERRMH (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 18 May 2023 13:12:07 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11829DD
        for <selinux@vger.kernel.org>; Thu, 18 May 2023 10:12:02 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-75adfa6b89dso11475985a.1
        for <selinux@vger.kernel.org>; Thu, 18 May 2023 10:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1684429921; x=1687021921;
        h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=olD+gE+mgZt6/Cg2KGM3I4rg8G/qOPDHs2YPzv8SWno=;
        b=bw5f1scFmtx9OktnCe5729lM6mfbBbDqHKMaB+FHGovEXJLSDMaVdfXoVMkZ76XN63
         iic9MFYUE4PlY8RiRGwyky6GV3N/VT6RgR5Z9GQDDWNiILHpY3SQbJlI6nkyvBtrnGWQ
         gwv23mRme0QnqURmpaKip/2yfeGHsgaS+MZ8vrTZgKwuUMCpCbVwCQMiYj+xhegZOFpP
         AGvSHY2cNpnp4r2Ol0rnUHHJwAM6tlgUb5/uS/bSZHuxf9UQ7zq6GtNza9hdUqVSxn9Z
         p0pTrwi16zUWrKxbdwcoCWveccIY6z4IBgpZvoRkqujYBz2bplLNWOz+Hmn/ipZJYPMt
         rSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684429921; x=1687021921;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=olD+gE+mgZt6/Cg2KGM3I4rg8G/qOPDHs2YPzv8SWno=;
        b=E5qX2Cpm7JZCN4WYqKyZ+k2/h9edCt5Uj7pJwelBy/FR192/m/5UtCbNUFuE4VIh0C
         pmoV9fk5OyRpIUHjqEFUGzCqP/ZOGNvgmDQ2kBiGlR86nUkhVpywlGye1EXWi1Vyij6q
         vhMdL9v8dL8St0CDmtUYbRe3mkGiuhKAgQfbHAgG5oeoSESbJn0UHCFaeYYgFmDPF5yv
         gkgryc3zLp1YgmLV399KR3y837Jww7m6C6QNZgVztR67SvdExw0+aznDxCoCF4CH5iB9
         yzSj2+ueNHxbqdugQCxlnvAhfqIiur5hB37wyHjka31E+jhh3Gi8u8Rb7YCCR+1W3nos
         SVZw==
X-Gm-Message-State: AC+VfDyii41Ri+5WvQW/KNItuzGnKI7aN2Aopci9NTBa2utyVwBhYglG
        JX6o2ThDv+2FSiw8Qww2JAnF
X-Google-Smtp-Source: ACHHUZ6m6nXzUBCTkLUA3rR1Ht4Usn6aYzKi8I24FU1/iPJ/HaS8ziflm7rffk9N9mdcHOVR4o04gA==
X-Received: by 2002:a05:6214:d05:b0:5ef:60a8:e795 with SMTP id 5-20020a0562140d0500b005ef60a8e795mr484353qvh.4.1684429921116;
        Thu, 18 May 2023 10:12:01 -0700 (PDT)
Received: from localhost (pool-108-26-161-203.bstnma.fios.verizon.net. [108.26.161.203])
        by smtp.gmail.com with ESMTPSA id dp8-20020a05621409c800b0062119a7a7a3sm672909qvb.4.2023.05.18.10.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 10:12:00 -0700 (PDT)
Date:   Thu, 18 May 2023 13:12:00 -0400
Message-ID: <1947d38c30b18829a5c122025c52847e.paul@paul-moore.com>
From:   Paul Moore <paul@paul-moore.com>
To:     Matthieu Baerts <matthieu.baerts@tessares.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>
Cc:     Paolo Abeni <pabeni@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Ondrej Mosnacek <omosnace@redhat.com>, mptcp@lists.linux.dev,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        Matthieu Baerts <matthieu.baerts@tessares.net>
Subject: Re: [PATCH v2 2/2] selinux: Implement mptcp_add_subflow hook
References: <20230419-upstream-lsm-next-20230419-mptcp-sublows-user-ctx-v2-2-e7a3c8c15676@tessares.net>
In-Reply-To: <20230419-upstream-lsm-next-20230419-mptcp-sublows-user-ctx-v2-2-e7a3c8c15676@tessares.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Apr 20, 2023 Matthieu Baerts <matthieu.baerts@tessares.net> wrote:
> 
> Newly added subflows should inherit the LSM label from the associated
> MPTCP socket regardless of the current context.
> 
> This patch implements the above copying sid and class from the MPTCP
> socket context, deleting the existing subflow label, if any, and then
> re-creating the correct one.
> 
> The new helper reuses the selinux_netlbl_sk_security_free() function,
> and the latter can end-up being called multiple times with the same
> argument; we additionally need to make it idempotent.
> 
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> Acked-by: Matthieu Baerts <matthieu.baerts@tessares.net>
> Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
> ---
> v2:
>  - Address Paul's comments:
>    - use "MPTCP socket" instead of "msk" in the commit message
>    - "updated" context instead of "current" one in the comment
> ---
>  security/selinux/hooks.c    | 16 ++++++++++++++++
>  security/selinux/netlabel.c |  8 ++++++--
>  2 files changed, 22 insertions(+), 2 deletions(-)

Also merged into selinux/next, thanks again.

--
paul-moore.com
