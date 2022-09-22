Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA3D5E6A63
	for <lists+selinux@lfdr.de>; Thu, 22 Sep 2022 20:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbiIVSHE (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 22 Sep 2022 14:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232326AbiIVSG5 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 22 Sep 2022 14:06:57 -0400
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DFB19107587
        for <selinux@vger.kernel.org>; Thu, 22 Sep 2022 11:06:54 -0700 (PDT)
Received: from [192.168.1.10] (pool-173-66-202-112.washdc.fios.verizon.net [173.66.202.112])
        by linux.microsoft.com (Postfix) with ESMTPSA id 7431720B929C;
        Thu, 22 Sep 2022 11:06:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7431720B929C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1663870014;
        bh=qcRZDFscWb65YP5WWNL9mFy3cCBl0b5VQnWSO5vX3SI=;
        h=Date:Subject:From:To:References:In-Reply-To:From;
        b=RJXKbelsfFKGb3evvg58Z3nFQTEhjZnE42UdEkkT7rdNuMu3I8N6V5/mc3JWNq8+J
         bGGAhrBO6qHq69uOIloro5y6m+v763lFCt1pkxNTCWqbGRQZjzTbAQf0lxocWhrwuo
         3XUNZ+0lHH3QTo4taBi+wwehjvs6pFszCPP7EyNw=
Message-ID: <1486279f-a1e9-0f03-203c-4a1ee52264d5@linux.microsoft.com>
Date:   Thu, 22 Sep 2022 14:06:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] libsemanage: Allow user to set SYSCONFDIR
Content-Language: en-US
From:   Daniel Burgener <dburgener@linux.microsoft.com>
To:     Matt Sheets <masheets@linux.microsoft.com>, selinux@vger.kernel.org
References: <20220922180255.2923-1-masheets@linux.microsoft.com>
 <c614d089-31e2-573a-17d0-91eca5e9b218@linux.microsoft.com>
In-Reply-To: <c614d089-31e2-573a-17d0-91eca5e9b218@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-21.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 9/22/2022 2:04 PM, Daniel Burgener wrote:
> On 9/22/2022 2:02 PM, Matt Sheets wrote:
>> This change will allow a user to set the location of their
>> sysconfdir, defaulted to /etc, if they are installing into
>> nonstandard locations.
>>
>> Signed-off-by: Matt Sheets <masheets@linux.microsoft.com>
>> ---
>>   libsemanage/src/Makefile | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/libsemanage/src/Makefile b/libsemanage/src/Makefile
>> index 71c2a1d2..01df0181 100644
>> --- a/libsemanage/src/Makefile
>> +++ b/libsemanage/src/Makefile
>> @@ -11,6 +11,7 @@ PKG_CONFIG ?= pkg-config
>>   PREFIX ?= /usr
>>   LIBDIR ?= $(PREFIX)/lib
>>   INCLUDEDIR ?= $(PREFIX)/include
>> +SYSCONFDIR ?= /etc
>>   PYINC ?= $(shell $(PKG_CONFIG) --cflags $(PYPREFIX))
>>   PYLIBS ?= $(shell $(PKG_CONFIG) --libs $(PYPREFIX))
>>   PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig 
>> import *; print(get_python_lib(plat_specific=1, prefix='$(PREFIX)'))")
>> @@ -19,7 +20,7 @@ RUBYINC ?= $(shell $(RUBY) -e 'puts "-I" + 
>> RbConfig::CONFIG["rubyarchhdrdir"] +
>>   RUBYLIBS ?= $(shell $(RUBY) -e 'puts "-L" + 
>> RbConfig::CONFIG["libdir"] + " -L" + RbConfig::CONFIG["archlibdir"] + 
>> " " + RbConfig::CONFIG["LIBRUBYARG_SHARED"]')
>>   RUBYINSTALL ?= $(shell $(RUBY) -e 'puts 
>> RbConfig::CONFIG["vendorarchdir"]')
>> -DEFAULT_SEMANAGE_CONF_LOCATION=/etc/selinux/semanage.conf
>> +DEFAULT_SEMANAGE_CONF_LOCATION=$(SYSCONFDIR)/selinux/semanage.conf
>>   ifeq ($(DEBUG),1)
>>       export CFLAGS ?= -g3 -O0 -gdwarf-2 -fno-strict-aliasing -Wall 
>> -Wshadow -Werror
> 
> That looks good thanks.  Sorry, one last request.  This is a generic 
> yocto issue, right?  Are you able to provide publicly visible links to 
> the upstream yocto project in the git commit message to justify why 
> using a nonstandard /etc is a normal/reasonable thing to do?

Oops, I'd been discussing this with Matt, and didn't realize this one 
hit the public list :)  Just trying to improve the rationale/justification.

Regarding the actual change:

Reviewed-by: Daniel Burgener <dburgener@linux.microsoft.com>
