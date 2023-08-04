Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A51EF76F7B4
	for <lists+selinux@lfdr.de>; Fri,  4 Aug 2023 04:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231650AbjHDCUU (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 3 Aug 2023 22:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbjHDCUT (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 3 Aug 2023 22:20:19 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AF4A3
        for <selinux@vger.kernel.org>; Thu,  3 Aug 2023 19:20:18 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-40fcc91258fso11901891cf.1
        for <selinux@vger.kernel.org>; Thu, 03 Aug 2023 19:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1691115617; x=1691720417;
        h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1tUtETQ9Y4CDfANOw/Y4lC/Kn2zvMBTE7Cd/Vht41dU=;
        b=UBXI1vJk6GPKDRVVjo+Tjq7Sek62Uyimhvg2k7lj8geUOwchLs2Vjcp0JiCGAdHX3X
         lQM4j4KUGgvhlm8ho3eln1256n14uyfvqlkx91YdNkpUia+JlKIOlA4ahX7VlehVGX2W
         KTjP5EsrfG+KQOpbeeSqQaSeZsMH13DZw6aATG3m3+jzf9c5vUjSfyIXQNOzx0567W/J
         OxYdGYJB5CeZBPDRWviBE0Ig/pDX6Y8IWUQf0GJJhIRLOnmrFk7Ms0+DxypmUpy8Ohhc
         JObEifcYnhoO6D0ec8RskMSR7dylySlOcnrQeTn4S3Y0gp85ONv5GzH+zPxMWxByR3ol
         4WQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691115617; x=1691720417;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1tUtETQ9Y4CDfANOw/Y4lC/Kn2zvMBTE7Cd/Vht41dU=;
        b=Iv7aLCi9DoQ0Ut3YqtMKxE/3CpzhOjOUKltPC0zcZVwdGvlGeYagp0J7Rc0SnykvM+
         +AFDGz7EZWnAWtGomcst3LyRebhopDMKA2NoCzkRb0f+uoZ69mT/lfRQDdsNcHpAyFap
         Yt7aJCn+dyHMN+sdxEFSTjF93jcNlb4QgZLOfLZ3ekyUNgz/lrzAnd6tt4Bhef3Q3udc
         3hTfYH75qgtlIzhczIVDOwJTj6qeQ1kEti617Cow/bYSID9cxYTWXQDOJI6t5xwJMClu
         w9RpRo93MZ6XbPOI+3srRortUqSB8+vEyKUp/GUCVIzZTm21TnfozI8srJEzYoHIKvGd
         jSgQ==
X-Gm-Message-State: AOJu0Yyru17gwsNptaMEAM/B7lpDBuw+U4bzAKes3X83/PQI03npdIQj
        E18Aw2rdJFEY/MCB4mSGp27x
X-Google-Smtp-Source: AGHT+IGRRWMyjQXVBn8k6IXPvIpX3OFY6x/mGnjxyvWm57BloOdheYj4ttIZTQN+UMm18+Q+ExLK3Q==
X-Received: by 2002:ac8:4e41:0:b0:40f:f07f:1c01 with SMTP id e1-20020ac84e41000000b0040ff07f1c01mr872061qtw.40.1691115617380;
        Thu, 03 Aug 2023 19:20:17 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id kl2-20020a05622a2c4200b004053dc8365esm344831qtb.23.2023.08.03.19.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 19:20:16 -0700 (PDT)
Date:   Thu, 03 Aug 2023 22:20:16 -0400
Message-ID: <39a1306cf590503f3121a0255e5ce7ac.paul@paul-moore.com>
From:   Paul Moore <paul@paul-moore.com>
To:     =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>,
        selinux@vger.kernel.org
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] selinux: avoid implicit conversions in avtab code
References: <20230728155501.39632-9-cgzones@googlemail.com>
In-Reply-To: <20230728155501.39632-9-cgzones@googlemail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Jul 28, 2023 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com> wrote:
> 
> Return u32 from avtab_hash() instead of int, since the hashing is done
> on u32 and the result is used as an index on the hash array.
> 
> Use the type of the limit in for loops.
> 
> Avoid signed to unsigned conversion of multiplication result in
> avtab_hash_eval().
> 
> Use unsigned loop iterator for index operations, to avoid sign
> extension.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
> v2: avoid declarations in init-clauses of for loops
> ---
>  security/selinux/ss/avtab.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/security/selinux/ss/avtab.c b/security/selinux/ss/avtab.c
> index 32f92da00b0e..8a508018e696 100644
> --- a/security/selinux/ss/avtab.c
> +++ b/security/selinux/ss/avtab.c

...

> @@ -324,7 +324,8 @@ int avtab_alloc_dup(struct avtab *new, const struct avtab *orig)
>  
>  void avtab_hash_eval(struct avtab *h, const char *tag)
>  {
> -	int i, chain_len, slots_used, max_chain_len;
> +	u32 i;
> +	unsigned int chain_len, slots_used, max_chain_len;

Since the total number of elements in the hash table and the number
of hash buckets/slots are both u32, it seems reasonable to me that
we would also want the 'chain_len', 'slots_used', and 'max_chain_len'
variables as u32, yes?

>  	unsigned long long chain2_len_sum;
>  	struct avtab_node *cur;
>

--
paul-moore.com
