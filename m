Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D12053660C
	for <lists+selinux@lfdr.de>; Wed,  5 Jun 2019 22:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfFEUyJ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 5 Jun 2019 16:54:09 -0400
Received: from namei.org ([65.99.196.166]:37090 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbfFEUyJ (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 5 Jun 2019 16:54:09 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id x55KroJ4021347;
        Wed, 5 Jun 2019 20:53:50 GMT
Date:   Thu, 6 Jun 2019 06:53:50 +1000 (AEST)
From:   James Morris <jmorris@namei.org>
To:     John Johansen <john.johansen@canonical.com>
cc:     Stephen Smalley <sds@tycho.nsa.gov>,
        Casey Schaufler <casey@schaufler-ca.com>,
        casey.schaufler@intel.com, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org, keescook@chromium.org,
        penguin-kernel@i-love.sakura.ne.jp, paul@paul-moore.com
Subject: Re: [PATCH 00/58] LSM: Module stacking for AppArmor
In-Reply-To: <d86c6f89-39c5-bcf6-6491-96963d1113d3@canonical.com>
Message-ID: <alpine.LRH.2.21.1906060653060.20895@namei.org>
References: <20190602165101.25079-1-casey@schaufler-ca.com> <f71388e9-a4c5-8935-137b-8eb50be7f833@tycho.nsa.gov> <42fcfaf2-43a9-642e-2e19-282087c3cdb2@canonical.com> <alpine.LRH.2.21.1906051305370.17052@namei.org>
 <d86c6f89-39c5-bcf6-6491-96963d1113d3@canonical.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, 4 Jun 2019, John Johansen wrote:

> Yes, on Ubuntu & suse you can lauch lxd system containers with the
> container having a system policy bounding the container, and the container
> having its own apparmor policy namespace. So it loads and has its own
> policy that is enforced.
> 
> This allows for us to run older versions of ubuntu (say 16.04) on an
> 18.04 host, and have the 16.04 policy behave just as if it was the host.

How well does the LSM stacking scale to 100s or more containers?

> This approach won't be an option for the 19.10 release and we will be
> needing the full patchset. I should be able to provide some benchmark
> and testing data soon.

Great.

-- 
James Morris <jmorris@namei.org>

