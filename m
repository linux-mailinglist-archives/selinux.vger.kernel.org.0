Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B633C2A7FDE
	for <lists+selinux@lfdr.de>; Thu,  5 Nov 2020 14:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729990AbgKENqA (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 5 Nov 2020 08:46:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgKENp7 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 5 Nov 2020 08:45:59 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ACE7C0613CF
        for <selinux@vger.kernel.org>; Thu,  5 Nov 2020 05:45:58 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id 63so667951qva.7
        for <selinux@vger.kernel.org>; Thu, 05 Nov 2020 05:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=iih6Xzl/X6kvs8OkM9I45dCIe3TDx1BRADKGaOwJiaU=;
        b=PUrUQIqNCDA0OyFeJVe9YgliKQp7x0EjnNNjrVgsc8YF5x4gvBl+pn8/ersNK/sPrL
         g81M38HWYSCQmFH3oLNZP1D3PYlJPTV+C9DL45IEry02xcT+JsRsoYSsnrAL/zzCkO2C
         XFTfem1by3nINOj82o5lUKWO68echhNU2RqVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iih6Xzl/X6kvs8OkM9I45dCIe3TDx1BRADKGaOwJiaU=;
        b=NzrxRaR42zYbt/jdG1BZB84MmK+ibF90nbX02uRtN/mkOki9RJqNPxfmdb8If3kO6r
         zURYCQXWNCDH4Lhud+PydNAiLpE4XAIyia9noXrzJkBV4uec/6zGdmYqcj2foc0ARhJq
         2FWjM03iwsrgDwmJTqeh5WaJ7wiPBX959vu0k1LlAOXOvjUGiYMnHUdYy5grw0WRzuNs
         LK6oU5FI4ZFg63va4C1y5Mlwfn1f6lnmt85ebj/mqsKyOSCOh5+y3P31v3C5IE2nh43v
         aiYMf4kAFghXmHCN69E/WhaWoUBWLGEk+qp0R4xYapVqqf5u5WVCzPFi96NwSVBHuxxi
         n8fA==
X-Gm-Message-State: AOAM531ggbiaKlzxyFEbUZJ6B351dqluCIgSIH0XlICDDZXMhbnYofsS
        DDaLctjeGJ6xfupRIekyBAFFSKufkGW7hQ==
X-Google-Smtp-Source: ABdhPJyeB2vZYD0DQcGeBKT9w39N1SEmS1tyH/WJS7pXUHgjx0TbnXS4oXrUL75fgqsa5XWZzMjsdA==
X-Received: by 2002:a0c:fac6:: with SMTP id p6mr2059610qvo.5.1604583956733;
        Thu, 05 Nov 2020 05:45:56 -0800 (PST)
Received: from fedora.pebenito.net (pool-96-234-173-17.bltmmd.fios.verizon.net. [96.234.173.17])
        by smtp.gmail.com with ESMTPSA id b14sm985124qkn.123.2020.11.05.05.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 05:45:56 -0800 (PST)
Subject: Re: homedir file context definitions
To:     Vit Mojzis <vmojzis@redhat.com>, selinux@vger.kernel.org
References: <495ea932-98d8-d413-6be3-36b0d5c1e17d@redhat.com>
From:   Chris PeBenito <pebenito@ieee.org>
Message-ID: <199f2a20-b078-c5ca-5767-eaf5164ce0ab@ieee.org>
Date:   Thu, 5 Nov 2020 08:45:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <495ea932-98d8-d413-6be3-36b0d5c1e17d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 11/2/20 3:45 PM, Vit Mojzis wrote:
> Hello everyone,
> when investigating a bug report [1], I found that homedir context definitions 
> (specified in .fc file) are changed based on the corresponding user (selinux 
> user, role and mls level from the context definition are replaced - [2]).
> While replacing the selinux user and role makes sense, I'm wondering if the mls 
> level from each homedir context definition should instead be compared to 
> corresponding user's mls range (and either kept or replaced to ensure given user 
> has access to it).
> 
> I have no problem with writing the patch, but I could use help understanding 
> what the correct behaviour should be (and why).
> 
> Any pointers would be apprecited.

I think the behavior should be that it replaces the level with the default level 
of the user (from the user policy statement) and that possibly should be 
overridden by the bottom level of whatever range is specified for that login 
user (from the seusers file).


-- 
Chris PeBenito
