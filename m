Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66B282530DF
	for <lists+selinux@lfdr.de>; Wed, 26 Aug 2020 16:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgHZOG3 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 26 Aug 2020 10:06:29 -0400
Received: from linux.microsoft.com ([13.77.154.182]:46594 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbgHZOG3 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 26 Aug 2020 10:06:29 -0400
Received: from chpebeni.northamerica.corp.microsoft.com (pool-108-15-23-247.bltmmd.fios.verizon.net [108.15.23.247])
        by linux.microsoft.com (Postfix) with ESMTPSA id 849D920B4908
        for <selinux@vger.kernel.org>; Wed, 26 Aug 2020 07:06:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 849D920B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1598450788;
        bh=RZC5tKFGJ+JJLRF5u1x2oap2mVph+EM0WrQPRdwMwgY=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=pW7TGgQweurmYeTsF8vrUF8SvT5aqn+8UIJOZFgefNbqQ050U0/rxO3kW1d7vvkHW
         cq/ddYcxA8682boouNdb8RDviPDGdwLlIL38JCnP7y4MabT16aAALwuEWKeyabE6CW
         7as9kw0h8hUDj+fg1vqur7NIrX9VpG4zy9Y9Bx7I=
Subject: Re: Userspace AVC auditing on policy load
From:   Chris PeBenito <chpebeni@linux.microsoft.com>
To:     selinux@vger.kernel.org
References: <cb7451da-24d3-4a0c-e4f8-205e6539ed54@linux.microsoft.com>
Message-ID: <e4cdec2a-8c01-fbe4-cba3-3468b4ebea2e@linux.microsoft.com>
Date:   Wed, 26 Aug 2020 10:06:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <cb7451da-24d3-4a0c-e4f8-205e6539ed54@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 8/26/20 9:25 AM, Chris PeBenito wrote:
> I was looking into this dbus-broker audit message, which has the wrong audit type:
> 
> audit[422]: USER_AVC pid=422 uid=999 auid=4294967295 ses=4294967295 
> subj=system_u:system_r:system_dbusd_t msg='avc:  received policyload notice 
> (seqno=2)
> 
> This is due to dbus-broker setting their avc log callback to send USER_AVC audit 
> messages for everything that comes to the libselinux log callback. I think the 
> right thing to do there is to change it to emit USER_SELINUX_ERR audit messages 
> if the log message is SELINUX_ERROR, otherwise log the message using their 
> regular method (stderr I think).
> 
> But the question became, why is the userspace AVC not simply emitting its own 
> USER_MAC_POLICY_LOAD audit message instead of sending a message to the log 
> callback?

Ok, I missed that there is a SELINUX_AVC log type and that's how the userspace 
denial messages are sent out. How about adding SELINUX_POLICYLOAD and 
SELINUX_ENFORCE log types so that callers can emit appropriate audit messages?

-- 
Chris PeBenito
