Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD58631BB6
	for <lists+selinux@lfdr.de>; Mon, 21 Nov 2022 09:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiKUIkZ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 21 Nov 2022 03:40:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiKUIkY (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 21 Nov 2022 03:40:24 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11FFD2656F
        for <selinux@vger.kernel.org>; Mon, 21 Nov 2022 00:40:20 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id n3so2177799wrp.5
        for <selinux@vger.kernel.org>; Mon, 21 Nov 2022 00:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddKdS4x8c4ZSI9PbKdla4xMHlbecpUYnHnf7KqPY/v4=;
        b=Yw0jbRZtRIiD1OeFezkx1DvohAZnSs9+qCRIEPvD1Gr2DIn36xoi7Y8xPX/tqfjSx1
         JVDydLlgeOwGEvOys0Z0qlWWF8c5gGzSkgUwK1TIiYjH6cAqZNg1yGsMBNlhT+nPyD3t
         +yJO0urki33bMWHVCXbaiCCzOwPZOY00nAaAVZV52w7cAcqClbu8ePVH65b9Cj/makMR
         hB06mGZDme+HQGU2QV79G4YWF6aPRbP3FrRjXl8try/c6Wm8iSpUc8W5VZeiNdJgmFTV
         6dP0jq+/6nafmdXHQvTY2rSQKRZ5xjlHj/EmZHK9uFzG3r8cPr9jdMhBAYrZKrBNtjik
         iI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddKdS4x8c4ZSI9PbKdla4xMHlbecpUYnHnf7KqPY/v4=;
        b=7zF9h5Few1kJateeDI/fa2Guf89+eCJjDc2kQwoVeE95+9fcRi8f3wSjz7cW5rwXiQ
         as70VI5roU3GvN2/YjoJQYMEo+jnjmOWKvposyuD9KCfOQDYPuKovh1ccTbUHryKngsh
         Gx5KuSGGToZutnaZFqjmesjMh/MPxzPVsY7NPlvsvW4CpqRShVKX05CgmDsA/8ABM/oG
         TlVGbXHrtJFFzimm9FyBgFnSl/7tu4eaD1DsOBohS6u+mGGwelExHIjuY2+O1zsTlDll
         dXyAVGFpAlFpI1OHuKHvh+vqk278Ptuj1gyLimZeXggMYAAStBuKW9nPzKjZ1Tl/mV1G
         XmvQ==
X-Gm-Message-State: ANoB5pl2yiOr7n+KDMEjHB9IkrkUCW7vKfRAMLpJFsKsEsosHwOlYNfk
        T6TePZnI0NEslBBVqKvj7xHlfMmXFjdNFTp/iKM=
X-Google-Smtp-Source: AA0mqf7jrwEUn4DoiB5l6psbYhzY48Dyz+XAcWOe4nKr1Tj1vMDhI6WL1HAr/AfOzytKVwUSlQkxOzqqxDj0Uq9Xq8Y=
X-Received: by 2002:a5d:58fb:0:b0:236:74c5:1b2d with SMTP id
 f27-20020a5d58fb000000b0023674c51b2dmr10103437wrd.14.1669020018603; Mon, 21
 Nov 2022 00:40:18 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6000:1f92:0:0:0:0 with HTTP; Mon, 21 Nov 2022 00:40:17
 -0800 (PST)
Reply-To: subik7633@gmail.com
From:   Susan Bikram <jeannemorgan479@gmail.com>
Date:   Mon, 21 Nov 2022 00:40:17 -0800
Message-ID: <CABXDZ2KhDuhROR0gMNi1jRkgvLdi-WMBfLVZ-PdWmEAEWfxUzg@mail.gmail.com>
Subject: Please can i have your attention
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Dear ,

Please can I have your attention and possibly help me for humanity's
sake please. I am writing this message with a heavy heart filled with
sorrows and sadness.
Please if you can respond, i have an issue that i will be most
grateful if you could help me deal with it please.

Susan
