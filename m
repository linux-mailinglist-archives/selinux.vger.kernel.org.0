Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86089249CF0
	for <lists+selinux@lfdr.de>; Wed, 19 Aug 2020 13:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbgHSL6M convert rfc822-to-8bit (ORCPT
        <rfc822;lists+selinux@lfdr.de>); Wed, 19 Aug 2020 07:58:12 -0400
Received: from seldsegrel01.sonyericsson.com ([37.139.156.29]:14798 "EHLO
        SELDSEGREL01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728412AbgHSL6I (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 19 Aug 2020 07:58:08 -0400
Subject: Re: [RFC PATCH] selinux: Use call_rcu for policydb and booleans
To:     Ondrej Mosnacek <omosnace@redhat.com>
CC:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        Paul Moore <paul@paul-moore.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        SElinux list <selinux@vger.kernel.org>
References: <20200818221718.35655-1-stephen.smalley.work@gmail.com>
 <e9c1967d-170f-86f0-2762-7ca36ea08e40@sony.com>
 <CAFqZXNsJKDfGy0VAXX6fyKuM5R6ivrfuYmmdQBHySHOFrYT1TA@mail.gmail.com>
From:   peter enderborg <peter.enderborg@sony.com>
Message-ID: <d8e3bdf6-50c7-790c-2f5f-bd5fa2df17a4@sony.com>
Date:   Wed, 19 Aug 2020 13:58:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFqZXNsJKDfGy0VAXX6fyKuM5R6ivrfuYmmdQBHySHOFrYT1TA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Content-Language: en-GB
X-SEG-SpamProfiler-Analysis: v=2.3 cv=frmim2wf c=1 sm=1 tr=0 a=kIrCkORFHx6JeP9rmF/Kww==:117 a=IkcTkHD0fZMA:10 a=y4yBn9ojGxQA:10 a=z6gsHLkEAAAA:8 a=RpNjiQI2AAAA:8 a=y0mw-eA47q-AeNbktZ8A:9 a=jpIH26JlB8aEU1M81S3jpgcb7nU=:19 a=cAYrxkuy4RCg-7Wa:21 a=go_VrI7WQPKdFuxe:21 a=QEXdDO2ut3YA:10 a=d-OLMTCWyvARjPbQ-enb:22
X-SEG-SpamProfiler-Score: 0
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 8/19/20 10:54 AM, Ondrej Mosnacek wrote:
> On Wed, Aug 19, 2020 at 10:32 AM peter enderborg
> <peter.enderborg@sony.com> wrote:
>> From 8184ea3648b18718fdb460a30dfc7f848b7bc6a2 Mon Sep 17 00:00:00 2001
>> From: Peter Enderborg <peter.enderborg@sony.com>
>> Date: Wed, 19 Aug 2020 10:20:28 +0200
>> Subject: [RFC PATCH] selinux: Use call_rcu for policydb and booleans
>>
>> This patch adds call_rcu that moves sycronize out
>> out call path. In the callback we can no call
>> cond_resched so they have to be remvoed.
> Did you notice Stephen's comment about vfree() in the v1 patch [1]?
> That probably also needs addressing, and after that you'll likely end
> up with something very similar to the v1 patch anyway.
>
> [1] https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_selinux_20200818194311.30018-2D1-2Dstephen.smalley.work-40gmail.com_&d=DwIBaQ&c=fP4tf--1dS0biCFlB0saz0I0kjO5v7-GLPtvShAo4cc&r=oO5HuGEGxznA2F3djiiYxmxxWQonw0h6Sks-BEoB4ys&m=3n3GB_y_9DEclfBuCK3Cw5Qzkdet94qyGeoAhAr_EOE&s=CiXlpSOQIfnydwIcZDscD2fyYtDOdRquHhTWR1vWZRk&e= 
>
>> Signed-off-by: Peter Enderborg <peter.enderborg@sony.com>
>> ---
>>  security/selinux/ss/policydb.c |  6 -----
>>  security/selinux/ss/services.c | 43 ++++++++++++++++++++++++++++++----
>>  2 files changed, 39 insertions(+), 10 deletions(-)
>>
> [...]
>> diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
>> index ba9347517e5b..11eff3a98ef8 100644
>> --- a/security/selinux/ss/services.c
>> +++ b/security/selinux/ss/services.c
>> @@ -2184,11 +2184,29 @@ static void selinux_notify_policy_change(struct selinux_state *state,
>>         selinux_xfrm_notify_policyload();
>>  }
>>
>> +struct deprecated_policy {
>> +       struct selinux_policy *policy;
>> +       int partial;
>> +       struct rcu_head rcu;
> Why not just add these fields to struct selinux_policy directly? Then
> you can avoid the speculative allocation of struct deprecated_policy.
How then should they be synced?  Self rcu:ed?
>
>> +};
>> +
>> +void policy_reclaim(struct rcu_head *rp)
>> +{
>> +       struct deprecated_policy *dep = container_of(rp, struct dep_policy, rcu);
>> +
>> +       if (dep->partial)
>> +               selinux_policy_cond_free(dep->policy);
>> +       else
>> +               selinux_policy_free(dep->policy);
>> +       kfree(dep);
>> +}
>> +
>>  void selinux_policy_commit(struct selinux_state *state,
>>                         struct selinux_policy *newpolicy)
>>  {
>>         struct selinux_policy *oldpolicy;
>>         u32 seqno;
>> +       struct deprecated_policy *dep;
>>
>>         /*
>>          * NOTE: We do not need to take the rcu read lock
>> @@ -2231,8 +2249,16 @@ void selinux_policy_commit(struct selinux_state *state,
>>         }
>>
>>         /* Free the old policy */
>> -       synchronize_rcu();
>> -       selinux_policy_free(oldpolicy);
>> +       /* if cant alloc we need to it the slow way */
>> +       dep  = kzalloc(sizeof(struct deprecated_policy), GFP_KERNEL);
>> +       if (dep) {
>> +               dep->policy = oldpolicy;
>> +               dep->partial = 0;
>> +               call_rcu(&dep->rcu, policy_reclaim);
>> +       } else {
>> +               synchronize_rcu();
>> +               selinux_policy_free(oldpolicy);
>> +       }
>>
>>         /* Notify others of the policy change */
>>         selinux_notify_policy_change(state, seqno);
> [...]
>
>
> --
> Ondrej Mosnacek
> Software Engineer, Platform Security - SELinux kernel
> Red Hat, Inc.
>

