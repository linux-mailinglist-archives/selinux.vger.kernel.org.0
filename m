Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21C04104A54
	for <lists+selinux@lfdr.de>; Thu, 21 Nov 2019 06:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfKUFi7 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 21 Nov 2019 00:38:59 -0500
Received: from namei.org ([65.99.196.166]:41488 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725842AbfKUFi7 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 21 Nov 2019 00:38:59 -0500
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id xAL5cgMg004627;
        Thu, 21 Nov 2019 05:38:42 GMT
Date:   Thu, 21 Nov 2019 16:38:42 +1100 (AEDT)
From:   James Morris <jmorris@namei.org>
To:     Casey Schaufler <casey@schaufler-ca.com>
cc:     casey.schaufler@intel.com, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: [PATCH v11 03/25] LSM: Use lsmblob in
 security_audit_rule_match
In-Reply-To: <20191113175721.2317-4-casey@schaufler-ca.com>
Message-ID: <alpine.LRH.2.21.1911211636380.3625@namei.org>
References: <20191113175721.2317-1-casey@schaufler-ca.com> <20191113175721.2317-4-casey@schaufler-ca.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, 13 Nov 2019, Casey Schaufler wrote:

> Change the secid parameter of security_audit_rule_match
> to a lsmblob structure pointer. Pass the entry from the
> lsmblob structure for the approprite slot to the LSM hook.
> 
> Change the users of security_audit_rule_match to use the
> lsmblob instead of a u32. In some cases this requires a
> temporary conversion using lsmblob_init() that will go
> away when other interfaces get converted.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  include/linux/security.h            |  7 ++++---
>  kernel/auditfilter.c                |  7 +++++--
>  kernel/auditsc.c                    | 14 ++++++++++----
>  security/integrity/ima/ima.h        |  4 ++--
>  security/integrity/ima/ima_policy.c |  7 +++++--
>  security/security.c                 | 18 +++++++++++++++---
>  6 files changed, 41 insertions(+), 16 deletions(-)

IMA changes will also need review from Mimi.


-- 
James Morris
<jmorris@namei.org>

