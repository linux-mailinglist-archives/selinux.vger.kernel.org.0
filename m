Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49C3C64E61D
	for <lists+selinux@lfdr.de>; Fri, 16 Dec 2022 04:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiLPDEU (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 15 Dec 2022 22:04:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiLPDER (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 15 Dec 2022 22:04:17 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38C45FB84
        for <selinux@vger.kernel.org>; Thu, 15 Dec 2022 19:04:12 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id t17so1150388pjo.3
        for <selinux@vger.kernel.org>; Thu, 15 Dec 2022 19:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6YukLnZFg+vaTGD0U64q5+XJJoWojTCW5nM5RkXOVrU=;
        b=e7oOJe9EH9d1UjLc0sPZIkTj0NWAhvdP/Hyme8cw4otolHyq8cpxJ8DV8z7fZ4i1gF
         pZf1fe6J9xWdPClnICEBmmgINmyqevx/we7SYlo402Q9Mz27f6D0nkuC7OVf70JpJIum
         YFmWB96xxEIASAgsgvgex4qVdIRt25JpsZvhpE7RumbGtp3tksh/PKiDy5O0MhOFv+UN
         rY+hr9BfF+xOtmM7vBivttuOxxjeeigfh1sGfNwCHIfbVRqn9G/YZFrvBu8gNc92MAyS
         nwgkz9tUBuRBaO/kEWbWHy8O7/Z2guEJgGba+FcFjOfUYd+3D03JM0UeojwW9TCqIhlk
         h6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YukLnZFg+vaTGD0U64q5+XJJoWojTCW5nM5RkXOVrU=;
        b=JPF4ssAZvmX0mkYt4NpRik5j+3BIEtdoD9ZNH27gZi2BbmEvIFRTb9p3imKyrLwweu
         DmhfhFHkxdCzxqafxXCD9btMr2JaioB3BYVqfFvVrJlqfrp+UgC64Ulh3n5KOKFKfW7i
         UVmGdVoGTVaXI4FdCzyjOgTfW8pxp9Y/m2nuVnvwyqptemthnZSjvM/ZkRrta/dvFEgB
         bmfNjr1dqq/MRa9kRd2jyCPSICZ9XLJsGHTzhiMi+6pAcUtLOzK0LfF7yBOLMt7wFDul
         awJL30FOwSFe84J5PDLl7OblPUJi3H1+DHkQs55oPC/ZCSb5K0wpZ23gcswNWoTSyF1u
         0pQw==
X-Gm-Message-State: ANoB5pkQwuOhUHWcDRuZAiQqQAz7maXQ8DPURJuSAZmwd9HXFgpRt2C2
        d//czscIsH/sJJ82Ry04D6iodUecilY1P1xTfV0o
X-Google-Smtp-Source: AA0mqf46hVr6ttNB+gRnqokYS+tNHS20DT2dgsYOwyumIwg3Kg5lMB2jW3KweLAT1Qq5o6jHreu52rKthIE0t9YC6uc=
X-Received: by 2002:a17:902:9892:b0:186:c3b2:56d1 with SMTP id
 s18-20020a170902989200b00186c3b256d1mr80991587plp.15.1671159852299; Thu, 15
 Dec 2022 19:04:12 -0800 (PST)
MIME-Version: 1.0
References: <389334fe-6e12-96b2-6ce9-9f0e8fcb85bf@huawei.com>
 <efd4ce83299a10b02b1c04cc94934b8d51969e1c.camel@linux.ibm.com>
 <6a5bc829-b788-5742-cbfc-dba348065dbe@huawei.com> <566721e9e8d639c82d841edef4d11d30a4d29694.camel@linux.ibm.com>
 <fffb29b7-a1ac-33fb-6aca-989e5567f565@huawei.com> <40cf70a96d2adbff1c0646d3372f131413989854.camel@linux.ibm.com>
 <a63d5d4b-d7a9-fdcb-2b90-b5e2a974ca4c@huawei.com> <757bc525f7d3fe6db5f3ee1f86de2f4d02d8286b.camel@linux.ibm.com>
 <CAHC9VhR2mfaVjXz3sBzbkBamt8nE-9aV+jSOs9jH1ESnKvDrvw@mail.gmail.com> <fc11076f-1760-edf3-c0e4-8f58d5e0335c@huawei.com>
In-Reply-To: <fc11076f-1760-edf3-c0e4-8f58d5e0335c@huawei.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 15 Dec 2022 22:04:01 -0500
Message-ID: <CAHC9VhT0SRWMi2gQKaBPOj1owqUh-24O9L2DyOZ8JDgEr+ZQiQ@mail.gmail.com>
Subject: Re: [RFC] IMA LSM based rule race condition issue on 4.19 LTS
To:     "Guozihua (Scott)" <guozihua@huawei.com>
Cc:     Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com,
        sds@tycho.nsa.gov, eparis@parisplace.org,
        Greg KH <gregkh@linuxfoundation.org>, sashal@kernel.org,
        selinux@vger.kernel.org,
        "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Dec 15, 2022 at 9:36 PM Guozihua (Scott) <guozihua@huawei.com> wrote:
> On 2022/12/16 5:04, Paul Moore wrote:

...

> > How bad is the backport really?  Perhaps it is worth doing it to see
> > what it looks like?
> >
> It might not be that bad, I'll try to post a version next Monday.

Thanks for giving it a shot.

-- 
paul-moore.com
