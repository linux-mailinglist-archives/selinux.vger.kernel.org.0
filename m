Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB08F38D9C
	for <lists+selinux@lfdr.de>; Fri,  7 Jun 2019 16:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbfFGOqS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+selinux@lfdr.de>); Fri, 7 Jun 2019 10:46:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43670 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728198AbfFGOqS (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 7 Jun 2019 10:46:18 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id F3C4630C0DD7;
        Fri,  7 Jun 2019 14:46:12 +0000 (UTC)
Received: from workstation (unknown [10.43.12.182])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 523517FEA2;
        Fri,  7 Jun 2019 14:46:11 +0000 (UTC)
References: <alpine.LFD.2.21.1905242306150.9521@34-41-5D-CA-59-C7> <pjd5zphv6ei.fsf@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.2
From:   Petr Lautrbach <plautrba@redhat.com>
To:     Jokke =?utf-8?B?SMOkbcOkbMOkaW5lbg==?= 
        <jokke.hamalainen@kolttonen.fi>
Cc:     selinux@vger.kernel.org
Subject: Re: [PATCH] trivial: remove unneeded int
In-reply-to: <pjd5zphv6ei.fsf@redhat.com>
Date:   Fri, 07 Jun 2019 16:46:09 +0200
Message-ID: <pjd4l51v4ge.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Fri, 07 Jun 2019 14:46:18 +0000 (UTC)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


Petr Lautrbach <plautrba@redhat.com> writes:

> Jokke Hämäläinen <jokke.hamalainen@kolttonen.fi> writes:
>
>> diff --git a/libsepol/src/context.c b/libsepol/src/context.c
>> index a88937fc..e81b28c6 100644
>> --- a/libsepol/src/context.c
>> +++ b/libsepol/src/context.c
>> @@ -38,7 +38,6 @@ int context_is_valid(const policydb_t * p, const context_struct_t * c)
>>  	role_datum_t *role;
>>  	user_datum_t *usrdatum;
>>  	ebitmap_t types, roles;
>> -	int ret = 1;
>>  
>>  	ebitmap_init(&types);
>>  	ebitmap_init(&roles);
>> @@ -75,7 +74,7 @@ int context_is_valid(const policydb_t * p, const context_struct_t * c)
>>  	if (!mls_context_isvalid(p, c))
>>  		return 0;
>>  
>> -	return ret;
>> +	return 1;
>>  }
>>  
>>  /*
>
> ack
>
> Would you please add Signed-off line (git commit -s ...) to the description, see
> `git log` and https://developercertificate.org/
>
> Also, if the patch applies only to one subdirectory it's a common practice
> to use prefix in the subject of the patch, e.g.:
>
> libsepol: trivial: remove unneeded int
>

The same comment applies also to your other unmerged patches

* trivial: remove unneeded int
* remove redundant if
* More accurate error messages
* trivial fix incorrect indentation
* trivial typo fix

travis CI seems to be happy with all of them
https://travis-ci.org/bachradsusi/SELinuxProject-selinux/builds/542793341 
