Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2E54CC3B2
	for <lists+selinux@lfdr.de>; Thu,  3 Mar 2022 18:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235309AbiCCR2O (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 3 Mar 2022 12:28:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235335AbiCCR2O (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 3 Mar 2022 12:28:14 -0500
X-Greylist: delayed 384 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 03 Mar 2022 09:27:26 PST
Received: from sandeen.net (sandeen.net [63.231.237.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BA39C28F;
        Thu,  3 Mar 2022 09:27:26 -0800 (PST)
Received: from [10.0.0.147] (liberator.sandeen.net [10.0.0.147])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by sandeen.net (Postfix) with ESMTPSA id 8E1E7323C1F;
        Thu,  3 Mar 2022 11:19:58 -0600 (CST)
Message-ID: <e97b6ef6-dc48-c49b-a98e-6d404dc79a59@sandeen.net>
Date:   Thu, 3 Mar 2022 11:21:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Content-Language: en-US
To:     "Darrick J. Wong" <djwong@kernel.org>,
        xfs <linux-xfs@vger.kernel.org>
Cc:     Ondrej Mosnacek <omosnace@redhat.com>,
        Dave Chinner <david@fromorbit.com>,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        john.haxby@oracle.com
References: <20220301025052.GF117732@magnolia>
From:   Eric Sandeen <sandeen@sandeen.net>
Subject: Re: [PATCH RESEND] xfs: don't generate selinux audit messages for
 capability testing
In-Reply-To: <20220301025052.GF117732@magnolia>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 2/28/22 8:50 PM, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> There are a few places where we test the current process' capability set
> to decide if we're going to be more or less generous with resource
> acquisition for a system call.  If the process doesn't have the
> capability, we can continue the call, albeit in a degraded mode.
> 
> These are /not/ the actual security decisions, so it's not proper to use
> capable(), which (in certain selinux setups) causes audit messages to
> get logged.  Switch them to has_capability_noaudit.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> Cc: Ondrej Mosnacek <omosnace@redhat.com>
> Cc: Dave Chinner <david@fromorbit.com>

Thanks Darrick. This looks technically correct to me as well.

You might want to add a:

Fixes: 7317a03df703f ("xfs: refactor inode ownership change transaction/inode/quota allocation idiom")

because I /think/ that's the commit that moved the capable() checks out
from under quota tests, and made the problem more visible.

And maybe:

Fixes: ea9a46e1c4925 ("xfs: only return detailed fsmap info if the caller has CAP_SYS_ADMIN")

as well?

It's not strictly fixing the former; AFAICT the problem existed when quota was
enabled already, so I'll leave all that to your discretion.

Reviewed-by: Eric Sandeen <sandeen@redhat.com>

Thanks,
-Eric
