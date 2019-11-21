Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5E04104A62
	for <lists+selinux@lfdr.de>; Thu, 21 Nov 2019 06:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbfKUFuk (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 21 Nov 2019 00:50:40 -0500
Received: from namei.org ([65.99.196.166]:41508 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbfKUFuk (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 21 Nov 2019 00:50:40 -0500
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id xAL5oPFd005470;
        Thu, 21 Nov 2019 05:50:25 GMT
Date:   Thu, 21 Nov 2019 16:50:25 +1100 (AEDT)
From:   James Morris <jmorris@namei.org>
To:     Casey Schaufler <casey@schaufler-ca.com>
cc:     casey.schaufler@intel.com, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: Re: [PATCH v11 17/25] LSM: Use lsmcontext in
 security_inode_getsecctx
In-Reply-To: <20191113175721.2317-18-casey@schaufler-ca.com>
Message-ID: <alpine.LRH.2.21.1911211648200.3625@namei.org>
References: <20191113175721.2317-1-casey@schaufler-ca.com> <20191113175721.2317-18-casey@schaufler-ca.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, 13 Nov 2019, Casey Schaufler wrote:

> Change the security_inode_getsecctx() interface to fill
> a lsmcontext structure instead of data and length pointers.
> This provides the information about which LSM created the
> context so that security_release_secctx() can use the
> correct hook.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  fs/nfsd/nfs4xdr.c        | 23 +++++++++--------------
>  include/linux/security.h |  5 +++--
>  security/security.c      | 13 +++++++++++--
>  3 files changed, 23 insertions(+), 18 deletions(-)

Please ensure all relevant maintainers are cc'd:

$ scripts/get_maintainer.pl fs/nfsd/nfs4xdr.c


-- 
James Morris
<jmorris@namei.org>

