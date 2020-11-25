Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FADF2C3ED8
	for <lists+selinux@lfdr.de>; Wed, 25 Nov 2020 12:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgKYLN2 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 25 Nov 2020 06:13:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgKYLN2 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 25 Nov 2020 06:13:28 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE7C4C0613D4
        for <selinux@vger.kernel.org>; Wed, 25 Nov 2020 03:13:27 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id k4so2149149edl.0
        for <selinux@vger.kernel.org>; Wed, 25 Nov 2020 03:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=baMXjzIHRUsb1hoHwaWZSHVlgCOipC8S15WdWhoDcGc=;
        b=t/wyHzrkKTeR/pz3H4awwAv0aHgefRqNvsnzO0W8aTi9SLtgI+wsDslNgVDHn2RkJP
         wLm1wgJpxJOxA0/5urY91wMHBQ2mjd3opjuzp3r0PnLOWikcRRgYdKIKZWjVU5LxZS3g
         jfcqjnH8WpWgXlgm/GOaUj9bCBa4sAx6D5xDyLSdxFCReiLw/s8Uk48OBu0sJqeVgckK
         9+JND+y/Dhn64ga1T7duVyTK84XfKMCGWgu/xIjHuWjB8nsRaY0b35dpwm/rtFsAnnNA
         9DG8uo4UDg4jZj3XBS3wtaKCGTw6/q2l7iiC8EjtH5xSbi/CFxO1THXSb40+k3H5fQ+s
         /v/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=baMXjzIHRUsb1hoHwaWZSHVlgCOipC8S15WdWhoDcGc=;
        b=K1rncrbGBW6taC4f5lswwjEbFXajaV3XCcwPlbFuCroNPl0pHBQuJWMRF1/AgITL5T
         Oymn7+Rq6VFqXvSzg2iOEIFvtmvkULhN9ahESKdKrHx3JeKxskwhpo3I1p8w74fSqEY+
         d1nAJ5jEXmQiS3hZFz48mGURvc4P4f/tkXEOwp+pfwKW7v/RWdJf/qkYSsAW7RuDrCUi
         xYsZejQFBEpWp5RMEF5HxK7hfcmrRKIZbXB9wrdaqM7nKDIJ9ywj9mr4BntGVKti1jHr
         /Z/EFVBdLpMw+UZXJba0f+/x61LDqgyhAM210Y3OC9h5dLWWBtRwSirbWazWEyvFwuX+
         nxRA==
X-Gm-Message-State: AOAM533ksw/AaoMWah+6xNw0RQayZ0eigahXKeKJmNQ5U1yOGSkzdNn5
        D6+Nxh8ScLg6+xfm5+UTlNJmcd4BDs0=
X-Google-Smtp-Source: ABdhPJwK1POkR4Yq8lBzk8VKcK7LMnFXGuxbcnGt7xEDRZ9WSbhSlu3wqgi5h7YhAblG+uNMfg/7Og==
X-Received: by 2002:a50:951e:: with SMTP id u30mr3081571eda.197.1606302806556;
        Wed, 25 Nov 2020 03:13:26 -0800 (PST)
Received: from ?IPv6:2001:a61:119f:c401:17f3:2c43:e4cf:5f4? ([2001:a61:119f:c401:17f3:2c43:e4cf:5f4])
        by smtp.gmail.com with ESMTPSA id q26sm1038571ejt.73.2020.11.25.03.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 03:13:25 -0800 (PST)
From:   bauen1 <j2468h@googlemail.com>
X-Google-Original-From: bauen1 <j2468h@gmail.com>
Subject: Re: Failed to start Udev Kernel device manager
To:     Ashish Mishra <ashishm@mvista.com>,
        SElinux list <selinux@vger.kernel.org>
References: <CAP2Ojcipm0dYWcDLX1gpnXpZpuKZv_uDqFHY6Vh5jfLstGepLw@mail.gmail.com>
Message-ID: <5f39b0ed-ffdf-68c5-6725-b4c8b5908d71@gmail.com>
Date:   Wed, 25 Nov 2020 12:13:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAP2Ojcipm0dYWcDLX1gpnXpZpuKZv_uDqFHY6Vh5jfLstGepLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi,

On 11/24/20 9:32 AM, Ashish Mishra wrote:
> I am trying to understand the selinux policy aspect by adding the
> reference policy
> https://github.com/SELinuxProject/selinux
> 
> I am trying to get the reference policy as part of proof of concept
> for another project.
> Hence I was using fedora as a base reference for our work .

You could try posting to selinux-refpolicy@vger.kernel.org , this mailing list is mostly for developing the kernel / userspace tools not a specific policy, I can also recommend the IRC channel #selinux on freenode for more interactive help.

-- 
bauen1
https://dn42.bauen1.xyz/
