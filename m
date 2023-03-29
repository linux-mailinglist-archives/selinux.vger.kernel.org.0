Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 548FA6CF648
	for <lists+selinux@lfdr.de>; Thu, 30 Mar 2023 00:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjC2WUX (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 29 Mar 2023 18:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjC2WUW (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 29 Mar 2023 18:20:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31354EF1;
        Wed, 29 Mar 2023 15:20:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8980E61E76;
        Wed, 29 Mar 2023 22:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4FFCC433EF;
        Wed, 29 Mar 2023 22:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680128421;
        bh=JyQG/UdGv/JO7v6NbzC+gckJ9gXWZR/gb3N62fHlN3w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hrKTp5MmB2mbTquGX/5ZpPhP5pw3Ydn+mJ+lAzR5/LkrmuEhBNHyMieC/CzmCYnb2
         4mKlcisWNLujAHOKjWPMyf4YsCThFUCy7rA4hkPW/euLcOafyRVpRsTKZhi48tLZxE
         N11skSTpESB7D+SAXePpYJFJuopvybWrNPLfkwuI62JvmYzouSseD6j1zuOxolczzN
         W5SG7ARZ9e+XR+0JY67TpZJHU4dQQGtKJ7aSb5eCvGINmAQT/j+BuXjEZ4AInUEl1J
         nO+QLdCkEPtTnWrQP8UE5SORMlhuTSh0Es3/JbXfFOVqn8oFmJqn11iwcjnXrK03Bl
         QBoo0QSVLbmpA==
Date:   Wed, 29 Mar 2023 15:20:19 -0700
From:   Saeed Mahameed <saeed@kernel.org>
To:     Paul Moore <paul@paul-moore.com>
Cc:     Shay Drory <shayd@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
        netdev@vger.kernel.org, regressions@lists.linux.dev,
        selinux@vger.kernel.org
Subject: Re: Potential regression/bug in net/mlx5 driver
Message-ID: <ZCS5oxM/m9LuidL/@x130>
References: <CAHC9VhQ7A4+msL38WpbOMYjAqLp0EtOjeLh4Dc6SQtD6OUvCQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHC9VhQ7A4+msL38WpbOMYjAqLp0EtOjeLh4Dc6SQtD6OUvCQg@mail.gmail.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 28 Mar 19:08, Paul Moore wrote:
>Hello all,
>
>Starting with the v6.3-rcX kernel releases I noticed that my
>InfiniBand devices were no longer present under /sys/class/infiniband,
>causing some of my automated testing to fail.  It took me a while to
>find the time to bisect the issue, but I eventually identified the
>problematic commit:
>
>  commit fe998a3c77b9f989a30a2a01fb00d3729a6d53a4
>  Author: Shay Drory <shayd@nvidia.com>
>  Date:   Wed Jun 29 11:38:21 2022 +0300
>
>   net/mlx5: Enable management PF initialization
>
>   Enable initialization of DPU Management PF, which is a new loopback PF
>   designed for communication with BMC.
>   For now Management PF doesn't support nor require most upper layer
>   protocols so avoid them.
>
>   Signed-off-by: Shay Drory <shayd@nvidia.com>
>   Reviewed-by: Eran Ben Elisha <eranbe@nvidia.com>
>   Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
>   Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>
>
>I'm not a mlx5 driver expert so I can't really offer much in the way
>of a fix, but as a quick test I did remove the
>'mlx5_core_is_management_pf(...)' calls in mlx5/core/dev.c and
>everything seemed to work okay on my test system (or rather the tests
>ran without problem).
>
>If you need any additional information, or would like me to test a
>patch, please let me know.
>

Hi Paul, 

Our team is looking into this, the current theory is that you have an old
FW that doesn't have the correct capabilities set.

Can you please provide the FW version and the ConnectX device you are
testing ? 

$ devlink dev info
$ lspci -s <pci_dev> -vv
since boot:
$ dmesg 

>-- 
>paul-moore.com
