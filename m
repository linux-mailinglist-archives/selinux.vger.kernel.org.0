Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11EE917C00F
	for <lists+selinux@lfdr.de>; Fri,  6 Mar 2020 15:17:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgCFOQ7 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 6 Mar 2020 09:16:59 -0500
Received: from linux.microsoft.com ([13.77.154.182]:39880 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgCFOQ7 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 6 Mar 2020 09:16:59 -0500
Received: from localhost.localdomain (c-73-172-233-15.hsd1.md.comcast.net [73.172.233.15])
        by linux.microsoft.com (Postfix) with ESMTPSA id 78D4320B9C02;
        Fri,  6 Mar 2020 06:16:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 78D4320B9C02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1583504218;
        bh=O17MwEf+mQU6/rIwNZhvatTwfhEfvcJ1KuBToU/ykiU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dHMKgSszSCmIQHpvhtJyfy3KuKe4pp96WXsO3CCWDmX9DWdPBQtkFwiMlQ90XVg4q
         5ixuEkaOf1jmBN+5Iq7+7LMngfOGBVpNt8c2hNjerzVOhNjZ+TGbFBRbfF9gUyddhA
         lfm1nQxmNLWXOKPNs8jBwuHNAuY0sSwBW+whKBPY=
Subject: Re: [PATCH] checkpolicy: Add --werror flag to checkmodule and
 checkpolicy to treat warnings as errors.
To:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        James Carter <jwcart2@gmail.com>,
        Joshua Brindle <joshua.brindle@crunchydata.com>,
        pebenito@ieee.org
Cc:     SElinux list <selinux@vger.kernel.org>
References: <20200305184034.165554-1-dburgener@linux.microsoft.com>
 <CAEjxPJ5OZpvvrWq9h1xYudLwZFgHj6nyr-uPnFqxoGEv91fk2A@mail.gmail.com>
From:   Daniel Burgener <dburgener@linux.microsoft.com>
Message-ID: <f7d669b6-25bc-699c-5bc7-f7dbc12b3a24@linux.microsoft.com>
Date:   Fri, 6 Mar 2020 09:16:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAEjxPJ5OZpvvrWq9h1xYudLwZFgHj6nyr-uPnFqxoGEv91fk2A@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 3/6/20 8:57 AM, Stephen Smalley wrote:
> On Thu, Mar 5, 2020 at 1:40 PM Daniel Burgener 
> <dburgener@linux.microsoft.com> wrote:
>> When the lexer encounters an unexpected character in a policy source 
>> file, it prints a warning, discards the character and moves on. In 
>> some build environments, these characters could be a symptom of an 
>> earlier problem, such as unintended results of expansion of 
>> preprocessor macros, and the ability to have the compiler halt on 
>> such issues would be helpful for diagnosis. Signed-off-by: Daniel 
>> Burgener <Daniel.Burgener@microsoft.com> 
> I'm trying to remember why this particular case (unmatched character 
> in the lexer) isn't already a fatal error. If there isn't a real 
> reason for it, we could alternatively just switch it to use yyerror() 
> in that case. Otherwise, your description suggests that you only want 
> to make that particular case a fatal error; are you sure you want to 
> treat all warnings as fatal errors?

That's a bug in the description rather than the code.  That particular 
case is what caused me to want this option, but my intent was to add an 
ability to treat all warnings as errors.  I can resubmit with a better 
message if you'd like.

I'm not sure why the behavior is that that particular case is a 
warning.  Git blame shows it as going back to the import from svn, so 
it's been that way for a while.  I'd think that --werror would be 
helpful either way.  If no one has a reason for this particular case to 
be a warning rather than an error, I can submit a patch for that change 
as well.

-Daniel

