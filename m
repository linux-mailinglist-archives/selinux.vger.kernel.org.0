Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC4267773B6
	for <lists+selinux@lfdr.de>; Thu, 10 Aug 2023 11:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234099AbjHJJJM (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 10 Aug 2023 05:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233139AbjHJJIj (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 10 Aug 2023 05:08:39 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC037211E
        for <selinux@vger.kernel.org>; Thu, 10 Aug 2023 02:08:38 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe0c566788so956200e87.0
        for <selinux@vger.kernel.org>; Thu, 10 Aug 2023 02:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1691658517; x=1692263317;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xol/W+TvwhMd6CwwK6yrJqAS9Tv78RNFD7MRPU7oFb8=;
        b=ZRu0XiA9V0IseCnwRNvEo1LfISeMdXM1UxAINjtcjxJhEfoYn84di4Vf4feEnvyjQr
         YLWyP3ULvjpqTaVDtUpr8YSQj8NWEHB5oKl8plMtJsPjRwwaRGm8mQRB3ptHSV4m2PRn
         cSZkXXGe1ODstwlN5h/HNWEu9qHRs5bw+OXYzs94NagW5uvFWziudlA4AsDpey7e/i2q
         K9Vb6tJKP/AnJ5WorlHIhscNzBnEZZ6rLwPYCTUKKVyy66oMvFpJWNRYVLG+Q7CO+CJr
         B5iudtNyIzushzY9/Lw2XoudjDo90IAFanrTR4G+Zxis52gBKzGVtA5BaNcgzN6pDjd6
         Wr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691658517; x=1692263317;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xol/W+TvwhMd6CwwK6yrJqAS9Tv78RNFD7MRPU7oFb8=;
        b=jsOyKNmRTrNlNurmQoYTFPd7XPTMYOGQQUHoO9zLQqhhe8xJHKOzbrtx3inTreO5fh
         1XjEKTMqYjpTJi8HuA3JL4iGxnQ8G4YRyPM+h0+3Cr6OMxYk1TMsE9OxBMTC9ZS2oR21
         FnMIlB6T0VO+hihfTP4MEhdJNaWt7ecfYA+/tOE0wa6JX2tWVktOLZHdCJLkiEkcqWUR
         d6t5lbQeh8iq3PJfAMVQ5pLkk5fYuT/ideuYyaZr4K+SFQ4tSbVyKL0N8fGWgNBlsc/7
         Uo/G7q1PwkIYxT3i/9lPoyGdXZl7Sx8e3RNRriETmiCzPqRg9X3aoZlv9O6y0S+PvRlq
         3tkg==
X-Gm-Message-State: AOJu0YxypPWxRTixi0mJuhqQaxlNiYeWag4EomtfkUT3UCOcDnGSTdtj
        Rs7Q3OJRByshA6IYDSkJoKOl7w==
X-Google-Smtp-Source: AGHT+IGHsVD7kNwE0OP5lernztvDqqsgfDrdbPMMQprcfSZ56KzwkpOB3mBxt0B0KFX7TvbYMtw6Fw==
X-Received: by 2002:a05:6512:2808:b0:4fe:1f02:e54b with SMTP id cf8-20020a056512280800b004fe1f02e54bmr1743000lfb.56.1691658516875;
        Thu, 10 Aug 2023 02:08:36 -0700 (PDT)
Received: from [10.43.1.246] ([83.142.187.84])
        by smtp.gmail.com with ESMTPSA id s7-20020a19ad47000000b004fe83d228e4sm203930lfd.71.2023.08.10.02.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 02:08:36 -0700 (PDT)
Message-ID: <6c5157fd-0feb-bce0-c160-f8d89a06f640@semihalf.com>
Date:   Thu, 10 Aug 2023 11:08:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v1 0/2] Add LSM access controls for io_uring_setup
Content-Language: en-US
From:   Dmytro Maluka <dmy@semihalf.com>
To:     Paul Moore <paul@paul-moore.com>
Cc:     Jeffrey Vander Stoep <jeffv@google.com>,
        Gil Cukierman <cukie@google.com>, Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>, kernel-team@android.com,
        linux-kernel@vger.kernel.org, io-uring@vger.kernel.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        Joel Granados <j.granados@samsung.com>,
        Jeff Xu <jeffxu@google.com>,
        Takaya Saeki <takayas@chromium.org>,
        Tomasz Nowicki <tn@semihalf.com>,
        Matteo Rizzo <matteorizzo@google.com>,
        Andres Freund <andres@anarazel.de>
References: <20221107205754.2635439-1-cukie@google.com>
 <CAHC9VhTLBWkw2XzqdFx1LFVKDtaAL2pEfsmm+LEmS0OWM1mZgA@mail.gmail.com>
 <CABXk95ChjusTneWJgj5a58CZceZv0Ay-P-FwBcH2o4rO0g2Ggw@mail.gmail.com>
 <CAHC9VhRTWGuiMpJJiFrUpgsm7nQaNA-n1CYRMPS-24OLvzdA2A@mail.gmail.com>
 <54c8fd9c-0edd-7fea-fd7a-5618859b0827@semihalf.com>
 <CAHC9VhS9BXTUjcFy-URYhG=XSxBC+HsePbu01_xBGzM8sebCYQ@mail.gmail.com>
 <d2eaa3f8-cca6-2f51-ce98-30242c528b6f@semihalf.com>
 <CAHC9VhQDAM8X-MV9ONckc2NBWDZrsMteanDo9_NS4SirdQAx=w@mail.gmail.com>
 <dc055b47-b868-7f5d-98bf-51e27df6b2d8@semihalf.com>
In-Reply-To: <dc055b47-b868-7f5d-98bf-51e27df6b2d8@semihalf.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 8/9/23 19:28, Dmytro Maluka wrote:
>   So one of the questions I'm wondering about is: if Android implemented
>   preventing execution of any io_uring code by non-trusted processes
>   (via seccomp or any other way), how much would it help to reduce the
>   risk of attacks, compared to its current SELinux based solution?

And why exactly I'm wondering about that: AFAICT, Android folks are
concerned about the high likelihood of vulnerabilities in io_uring code
just like we (ChromeOS folks) are, and that is the main reason why
Android takes care of restricting io_uring usage in the first place.
