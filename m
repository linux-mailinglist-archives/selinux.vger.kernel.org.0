Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2D814D1B83
	for <lists+selinux@lfdr.de>; Tue,  8 Mar 2022 16:19:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236497AbiCHPUH (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 8 Mar 2022 10:20:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231816AbiCHPUF (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 8 Mar 2022 10:20:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2E26C4A92E
        for <selinux@vger.kernel.org>; Tue,  8 Mar 2022 07:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646752748;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=c9fMqAOqXMGjuKYWGiPefQodA5imvgEaCvx0iMNkaLE=;
        b=AXaUl6jDeOfQkqLUjy2U/2A7Ac7uBC5C+GYTyu/ycppProMwNK1PEeCHITW3fnSUYQmzOi
        BWqWqZLok+69jbjWFysouhXOTsaWZdgi4U1yjeHCUsnPr486TnrLlaq1H1LfPLEZmYjPPv
        v0Pd7yurAVei/Kr6X1bDBFRMDtctWtc=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-Oqy-uj9bPrCirWIUK7I1sg-1; Tue, 08 Mar 2022 10:19:06 -0500
X-MC-Unique: Oqy-uj9bPrCirWIUK7I1sg-1
Received: by mail-oo1-f72.google.com with SMTP id j3-20020a4a92c3000000b00319481d8795so14201155ooh.9
        for <selinux@vger.kernel.org>; Tue, 08 Mar 2022 07:19:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=c9fMqAOqXMGjuKYWGiPefQodA5imvgEaCvx0iMNkaLE=;
        b=nTCS7bNbJWegEYWafZuwJRC+HUsUint+/NZRIzv5oiGbmOfQkqENFWS1k1ro8KpKeQ
         smS8x4ADXUwjJ+EbHUmDV3oR4QDTTSdKldrRhjzKF+NI7c0vDr0LR/Kdt2nPvge1KNl6
         ZdMTFlk7sEK3AJ31KonRZp5UwuCDLjd+QmRXK/mRrsUQUoZWCVov7FJosGoQNVej311j
         oZJn4Zjc9u7Le+Nm6CIpWabOlTtKoLgOe7cL4IHzkaPGAqlCP5X205MONV1Gkn/6SdWX
         SB3eaT3b3CzJsfls3vedSHSCLsqnkqWiYEg6nOITEfms5wiLoPynyyZmSmD706mXsjG6
         YJeQ==
X-Gm-Message-State: AOAM531F4AHzbbbrRk0sp8VzT5SrVIrMY49snQw2fK6z3PFwQ3xAKXGs
        e1ZvqonkM8REF/LLb3aK+WlkkFMuHSU+vf9ZDkzk4QpLPVtD0Z3ROhkaJBdMJ3uCDJuq9nc+VeD
        lRJN5X0LH8mDs1Hdds1gMtexoYNTWTVJvDw==
X-Received: by 2002:a05:6870:510:b0:d6:f5d1:d1ff with SMTP id j16-20020a056870051000b000d6f5d1d1ffmr2606883oao.128.1646752745890;
        Tue, 08 Mar 2022 07:19:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxcRvfgptBF8+w6DCk5KZ2L5UsNCxMTI2odXOQRW4StQkfxb+F6UpA+qaBb9xxGjvTKsH9aj7szDjXuHYND7Q=
X-Received: by 2002:a05:6870:510:b0:d6:f5d1:d1ff with SMTP id
 j16-20020a056870051000b000d6f5d1d1ffmr2606872oao.128.1646752745664; Tue, 08
 Mar 2022 07:19:05 -0800 (PST)
MIME-Version: 1.0
From:   Joseph Marrero Corchado <jmarrero@redhat.com>
Date:   Tue, 8 Mar 2022 10:18:55 -0500
Message-ID: <CAGGQ6=ZDv=zoHit_3SOCD-DTut9sfYFp8hHMLjCw7+uxR66zzg@mail.gmail.com>
Subject: libsemanage rename calls fail on containers
To:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi

I have submitted an issue:

https://github.com/SELinuxProject/selinux/issues/343

to and a proposed fix for it on a draft PR:
https://github.com/SELinuxProject/selinux/pull/342

Maybe there is a better way of doing this but if this looks like a
good starting point, I will continue by adding some input validation.
If there are any pointers it would be helpful. New to C here...

Thanks.

-- 

Joseph Marrero

