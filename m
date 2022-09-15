Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3C315B9D0D
	for <lists+selinux@lfdr.de>; Thu, 15 Sep 2022 16:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiIOO1V (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 15 Sep 2022 10:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiIOO1U (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 15 Sep 2022 10:27:20 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360E8EAE
        for <selinux@vger.kernel.org>; Thu, 15 Sep 2022 07:27:19 -0700 (PDT)
Received: from fsav118.sakura.ne.jp (fsav118.sakura.ne.jp [27.133.134.245])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 28FERHHq044314;
        Thu, 15 Sep 2022 23:27:17 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav118.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp);
 Thu, 15 Sep 2022 23:27:17 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 28FERHfd044311
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 15 Sep 2022 23:27:17 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <c2a3279d-451d-23df-0911-e545d21492e6@I-love.SAKURA.ne.jp>
Date:   Thu, 15 Sep 2022 23:27:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: LSM stacking in next for 6.1?
Content-Language: en-US
To:     Casey Schaufler <casey@schaufler-ca.com>,
        Paul Moore <paul@paul-moore.com>
Cc:     John Johansen <john.johansen@canonical.com>,
        LSM List <linux-security-module@vger.kernel.org>,
        James Morris <jmorris@namei.org>, linux-audit@redhat.com,
        Mimi Zohar <zohar@linux.ibm.com>, keescook@chromium.org,
        SElinux list <selinux@vger.kernel.org>
References: <791e13b5-bebd-12fc-53de-e9a86df23836.ref@schaufler-ca.com>
 <269014c6-5ce6-3322-5208-004cb1b40792@canonical.com>
 <CAHC9VhRrOgDMO9fo632tSL7vCMAy1_x3smaAok-nWdMAUFB8xQ@mail.gmail.com>
 <1958a0d3-c4fb-0661-b516-93f8955cdb95@schaufler-ca.com>
 <CAHC9VhQPvcunvBDvSnrUChwmGLen0Rcy8KEk_uOjNF1kr4_m9w@mail.gmail.com>
 <6552af17-e511-a7d8-f462-cafcf41a33bb@schaufler-ca.com>
 <CAHC9VhQMeyxQJSAUuigu=CCr44WtpJg=LEh1xng_bPfCCjqq6Q@mail.gmail.com>
 <5ef4a1ae-e92c-ca77-7089-2efe1d4c4e6d@schaufler-ca.com>
 <CAHC9VhQRpeOMkeEfy=VRPnpuYMUDYgLp56OjQZPYwoXmfHYREQ@mail.gmail.com>
 <c679cea7-bb90-7a62-2e17-888826857d55@schaufler-ca.com>
 <e9ce6253-c8a3-19c3-1b71-f3a2e04539bc@I-love.SAKURA.ne.jp>
 <cc14bbde-529e-376c-7d27-8512ec677db3@schaufler-ca.com>
 <ff43e254-0f41-3f4f-f04d-63b76bed2ccf@I-love.SAKURA.ne.jp>
 <1a9f9182-9188-2f64-4a17-ead2fed70348@schaufler-ca.com>
 <2225aec6-f0f3-d38e-ee3c-6139a7c25a37@I-love.SAKURA.ne.jp>
 <7f9ffd77-a329-ab13-857b-f8e34b2bfc77@schaufler-ca.com>
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <7f9ffd77-a329-ab13-857b-f8e34b2bfc77@schaufler-ca.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 2022/09/15 0:50, Casey Schaufler wrote:
> On 9/14/2022 6:57 AM, Tetsuo Handa wrote:
>> Please distinguish the difference between "enable" and "support" at
>> https://bugzilla.redhat.com/show_bug.cgi?id=542986#c7 . (By the way,
>> I hate the word "support", for nobody can share agreed definition.)
>>
>> "enable" is something like "available", "allow to exist".
>>
>> "support" is something like "guaranteed", "provide efforts for fixing bugs".
>>
>> However, in the Red Hat's world, "enable" == "support". The kernel config options
>> enabled by Red Hat is supported by Red Hat, and the kernel config options Red Hat
>> cannot support cannot be enabled by Red Hat.
> 
> The "enable" == "support" model in consistent with the expectations of
> paying customers. 

Regarding CONFIG_MODULES=y,
"Vendor-A enables module-A" == "Vendor-A provides support for module-A" and
"Vendor-B enables module-B" == "Vendor-B provides support for module-B".

Regarding CONFIG_SECURITY=y (namely in the RH world),
"Distributor-A enables LSM-A" == "Distributor-A provides support for LSM-A".
However, "Distributor-A does not enable LSM-B" == "Some vendor is impossible to
provide support for LSM-B".

"Distributor-A does not enable module-B" == "Distributor-A is not responsible for
providing support for module-B" and "Vendor-B enables LSM-B" == "Vendor-B provides
support for LSM-B" are what I expect.

Current LSM interface does not allow LSM-B to exist in Distributor-A's systems.
The "enable" == "support" model should be allowed for LSM interface as well.
What a strange asymmetry rule!



>> On the contrary, in the vanilla kernel's world, the in-tree version of TOMOYO
>> cannot be built as a loadable module LSM. And it is impossible to built TOMOYO
>> as a loadable module LSM (so that TOMOYO can be used without the "support" by
>> Red Hat). As a result, users cannot try LSMs (either in-tree or out-of-tree)
>> other than SELinux.
> 
> That is correct. Redhat has chosen to support only SELinux. If you want
> TOMOYO to be enabled in a distribution you need to sell the value to a
> distributor (really, really hard) Or (not recommended) become one yourself.

What I'm asking is "allow non-SELinux to exist in RH systems".
I'm not asking RH to "provide efforts for fixing non-SELinux".
Being able to build in-tree version of TOMOYO via "make M=security/tomoyo"
releases RH from the "enable" == "support" spell.

