Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB6C319DC9
	for <lists+selinux@lfdr.de>; Fri, 12 Feb 2021 13:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbhBLMAW (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 12 Feb 2021 07:00:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42743 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230238AbhBLL7W (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 12 Feb 2021 06:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613131070;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SK/ZkHbGSpqOWi3HuJEGZuwe0sg0qFdB5Duu5ePuWio=;
        b=dMyIwmfy3G5eH4VNaW1/AlK1LbvHLfP1p56ti8uRRfMcqN4n/pR5+OOMr3kWovp/pS3evv
        bV0dd+vFwe675eHbsxO+8MHEJW6azg61ndqQOfxyjtWGymy1hVPvNzxRyDlZzFfq96oL66
        47cp5bmWHMZc0a/5LGsYXsuCBL3/RAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-nsBiufmaOy6umPGGTfvDVg-1; Fri, 12 Feb 2021 06:57:46 -0500
X-MC-Unique: nsBiufmaOy6umPGGTfvDVg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBF1D804036;
        Fri, 12 Feb 2021 11:57:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.10.110.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D76CC60657;
        Fri, 12 Feb 2021 11:57:41 +0000 (UTC)
Reply-To: dwalsh@redhat.com
Subject: Re: [PATCH][v2] selinux: Allow context mounts for unpriviliged
 overlayfs
To:     Paul Moore <paul@paul-moore.com>
Cc:     Vivek Goyal <vgoyal@redhat.com>, selinux@vger.kernel.org,
        linux-unionfs@vger.kernel.org,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Giuseppe Scrivano <gscrivan@redhat.com>
References: <20210211180303.GE5014@redhat.com>
 <CAHC9VhRM6MiF1m2aFpLJKb3CFWXcXEX_SY=EnkLaq7U_X2UTZw@mail.gmail.com>
 <bb7b8304-b0fe-f6a3-b1fa-c06193f9cc02@redhat.com>
 <CAHC9VhS_+VT5cSXg+msEajnMYNjegKfubLO0EggaSr2p+JfSuA@mail.gmail.com>
From:   Daniel Walsh <dwalsh@redhat.com>
Organization: Red Hat
Message-ID: <36bcaeb0-547b-c8aa-e552-cca05c4103b5@redhat.com>
Date:   Fri, 12 Feb 2021 06:57:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhS_+VT5cSXg+msEajnMYNjegKfubLO0EggaSr2p+JfSuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 2/11/21 18:28, Paul Moore wrote:
> On Thu, Feb 11, 2021 at 5:41 PM Daniel Walsh <dwalsh@redhat.com> wrote:
>> On 2/11/21 16:24, Paul Moore wrote:
>>> On Thu, Feb 11, 2021 at 1:03 PM Vivek Goyal <vgoyal@redhat.com> wrote:
>>>> Now overlayfs allow unpriviliged mounts. That is root inside a non-init
>>>> user namespace can mount overlayfs. This is being added in 5.11 kernel.
>>>>
>>>> Giuseppe tried to mount overlayfs with option "context" and it failed
>>>> with error -EACCESS.
>>>>
>>>> $ su test
>>>> $ unshare -rm
>>>> $ mkdir -p lower upper work merged
>>>> $ mount -t overlay -o lowerdir=lower,workdir=work,upperdir=upper,userxattr,context='system_u:object_r:container_file_t:s0' none merged
>>>>
>>>> This fails with -EACCESS. It works if option "-o context" is not specified.
>>>>
>>>> Little debugging showed that selinux_set_mnt_opts() returns -EACCESS.
>>>>
>>>> So this patch adds "overlay" to the list, where it is fine to specific
>>>> context from non init_user_ns.
>>>>
>>>> v2: Fixed commit message to reflect that unpriveleged overlayfs mount is
>>>>       being added in 5.11 and not in 5.10 kernel.
>>>>
>>>> Reported-by: Giuseppe Scrivano <gscrivan@redhat.com>
>>>> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
>>>> ---
>>>>    security/selinux/hooks.c |    3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>> Thanks Vivek, once the merge window closes I'll merge this into
>>> selinux/next and send a note to this thread.
>> In order for us to take advantage of rootless overlay we need this
>> feature ASAP.
> It will get merged into selinux/next *after* this upcoming merge
> window.  I'm sorry, but -rc7 is just too late for new functionality;
> kernel changes need to soak before hitting Linus' tree and with the
> merge window opening in about three days that simply isn't enough
> time.  Come on Dan, even you have to know that ...
>
Well if that is ASAP, then fine, next window. Sadly this delays us three 
months

from getting this feature out and tested, but we can live with this.  
Once it gets into

a Release candidate we can push people to Rawhide to begin testing it.

