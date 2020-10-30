Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75CDD2A0932
	for <lists+selinux@lfdr.de>; Fri, 30 Oct 2020 16:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgJ3PHM (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 30 Oct 2020 11:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbgJ3PHM (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 30 Oct 2020 11:07:12 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A73C0613D6
        for <selinux@vger.kernel.org>; Fri, 30 Oct 2020 08:07:12 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id k125so1517797vka.11
        for <selinux@vger.kernel.org>; Fri, 30 Oct 2020 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qezUIHlvY9fFOmo2+xA2K+Ux6IJAtG5C7ju4HZIADck=;
        b=FDk8YZ+1U0Xp/Ygw40EpV0XeoQqT33eCNWvzOPeOzuhtVGoPz8+inv5IWSqFU5QEQb
         fbZH8kjd/7GZgBHweJS80LprkSJvRuThB5A2PYwcRJ19ifGSQ+mXOsFOxCp0TrHprMN8
         Ow0nVKYl2sgjqAIi19jAw5kAX//XFX1+xWk6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qezUIHlvY9fFOmo2+xA2K+Ux6IJAtG5C7ju4HZIADck=;
        b=mrrBWzTHe5f9pVPmN/pVUfFhytMUV8GDOBevrqk/y2BzvfP0SFghCxDEqwhKKMvgd+
         WqBuJx4GIS2ci/Zod3mmpQSddZKZGD3JMXLh4p6YuCLUAtzTNAGPznKrbQDDWTgumIbV
         ON34ZDF/yhcqKdZiuJ9hTr/rqiAwq5G3fcilzmRJka0I23PTtL4dJxgOAWI1v/LerbNB
         FpUTB6tc6gAjt5lpMnbqfwKS3gFzd3UwnA3VI8S+bb2+XW25SSh9/4UFUv17W4/CU2n8
         Gkk6jWTfzBlnm95PBU5uxSkKmLe50oPf/0LM4SzszpnMWCpt7t9KmX+Or3RrA954H5Vn
         DhlA==
X-Gm-Message-State: AOAM533uuL7eesJClOEtD5bPLJysFLFmj6GxXtY243pxjrAp7lPR/q2M
        6Ti4fIuT09n+W4D+O8J8oeIY8hkLUK6dNf5QhTQtCQ==
X-Google-Smtp-Source: ABdhPJw6zBNZsPXoxIh2VrRKYWDLkA+cMVV5G3SLLuH30LfxgNrHG7rsMDRqvHz08mcMwgVJkAuegVhMmIf8qGqUmJE=
X-Received: by 2002:ac5:c80e:: with SMTP id y14mr7299032vkl.3.1604070430985;
 Fri, 30 Oct 2020 08:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201021151903.652827-1-salyzyn@android.com> <20201021151903.652827-3-salyzyn@android.com>
In-Reply-To: <20201021151903.652827-3-salyzyn@android.com>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Fri, 30 Oct 2020 16:07:00 +0100
Message-ID: <CAJfpegtMoD85j5namV592sJD23QeUMD=+tq4SvFDqjVxsAszYQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 2/4] overlayfs: handle XATTR_NOSECURITY flag
 for get xattr method
To:     Mark Salyzyn <salyzyn@android.com>
Cc:     linux-kernel@vger.kernel.org,
        kernel-team <kernel-team@android.com>,
        linux-fsdevel@vger.kernel.org,
        overlayfs <linux-unionfs@vger.kernel.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        LSM <linux-security-module@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Vivek Goyal <vgoyal@redhat.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Amir Goldstein <amir73il@gmail.com>, linux-doc@vger.kernel.org,
        SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Oct 21, 2020 at 5:19 PM Mark Salyzyn <salyzyn@android.com> wrote:
>
> Because of the overlayfs getxattr recursion, the incoming inode fails
> to update the selinux sid resulting in avc denials being reported
> against a target context of u:object_r:unlabeled:s0.
>
> Solution is to respond to the XATTR_NOSECURITY flag in get xattr
> method that calls the __vfs_getxattr handler instead so that the
> context can be read in, rather than being denied with an -EACCES
> when vfs_getxattr handler is called.
>
> For the use case where access is to be blocked by the security layer.
>
> The path then would be security(dentry) ->
> __vfs_getxattr({dentry...XATTR_NOSECURITY}) ->
> handler->get({dentry...XATTR_NOSECURITY}) ->
> __vfs_getxattr({realdentry...XATTR_NOSECURITY}) ->
> lower_handler->get({realdentry...XATTR_NOSECURITY}) which
> would report back through the chain data and success as expected,
> the logging security layer at the top would have the data to
> determine the access permissions and report back to the logs and
> the caller that the target context was blocked.
>
> For selinux this would solve the cosmetic issue of the selinux log
> and allow audit2allow to correctly report the rule needed to address
> the access problem.
>
> Check impure, opaque, origin & meta xattr with no sepolicy audit
> (using __vfs_getxattr) since these operations are internal to
> overlayfs operations and do not disclose any data.  This became
> an issue for credential override off since sys_admin would have
> been required by the caller; whereas would have been inherently
> present for the creator since it performed the mount.
>
> This is a change in operations since we do not check in the new
> ovl_do_getxattr function if the credential override is off or not.
> Reasoning is that the sepolicy check is unnecessary overhead,
> especially since the check can be expensive.
>
> Because for override credentials off, this affects _everyone_ that
> underneath performs private xattr calls without the appropriate
> sepolicy permissions and sys_admin capability.  Providing blanket
> support for sys_admin would be bad for all possible callers.
>
> For the override credentials on, this will affect only the mounter,
> should it lack sepolicy permissions. Not considered a security
> problem since mounting by definition has sys_admin capabilities,
> but sepolicy contexts would still need to be crafted.

This would be a problem when unprivileged mounting of overlay is
introduced.  I'd really like to avoid weakening the current security
model.

The big API churn in the 1/4 patch also seems excessive considering
that this seems to be mostly a cosmetic issue for android.  Am I
missing something?

Thanks,
Miklos
