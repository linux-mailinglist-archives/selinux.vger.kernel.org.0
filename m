Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54BA46A0962
	for <lists+selinux@lfdr.de>; Thu, 23 Feb 2023 14:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234151AbjBWNF2 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 23 Feb 2023 08:05:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234279AbjBWNF0 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 23 Feb 2023 08:05:26 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A034A1C6
        for <selinux@vger.kernel.org>; Thu, 23 Feb 2023 05:05:25 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id h14so12885228plf.10
        for <selinux@vger.kernel.org>; Thu, 23 Feb 2023 05:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Um4c+voS3XpG24j5qk2nD/RXqdrpm4yb28H/jH4dzB0=;
        b=ZRt2D3BcNlLmIsQdIqHek1JZjbD+eUuNEjr2c5rNjm2/22QTpbWrUWFDlOMhuAlItu
         v4+FhUEM6Mg23fgfhWQoLzP8gB/ofSHmckEMUK9LzGwJE33tm4t5k2hjexdhB7HsGcSX
         GSSyBvZEuuo96InD5QtrXOBGecj+b376FNBvSWymfWa9EoFXGOKyI+DMXKYGP7ADXRJM
         9objVQU/24w6HOQathtr3pkOAlqv8oB0gOzLGlxFU9fbD+duDnJCflLE94cNf2aZeF0C
         ctmkBhyUnZtcZqEecJDfXNJ6weVIY5gzvHy2aB+jyiXd1AvQfnQoL8vvtcqxomr2mWJG
         HMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Um4c+voS3XpG24j5qk2nD/RXqdrpm4yb28H/jH4dzB0=;
        b=GcBNZM2QDaoxHaEkkAbcpv+rtyHbvQI5diXZjPE/urwf+otHHAQWvEsKx+Jqe9ZocU
         lSkFJ6cF9LOg/hIDfEKuPueIgcbeggf4FuX/IcHQvT5ulQq8+neRsTZchaQPEzrraqMq
         ZGcQvN5wBm34ydt3Q+JWp2bkEef9T8xSeTp/iQplhpOSIiXF/L4yh9JPUEB2nZYxWL6Q
         4GLptrghdcUyrvKibIhvsljJBPhQu+hx1zQ0095oSzscB1B6sDRsh+dilMpKT+UbkK1D
         6xZJ/nJFRpd8d881pBcYOQTxmfLwSGgROTnH0Y8Lfi8CMngN0FePUOY9+CNyIvPD9/Mk
         sYBA==
X-Gm-Message-State: AO0yUKWno/eN4qa04o9bwy2s/G6vnc5b8vAJMxB7boC5MKyiHz/HBTXa
        q9w5ueUSxP8sHhJCx+RBniDsPzfqxAlBDkUQGYuUlohS
X-Google-Smtp-Source: AK7set+fpKWzEqKh2lbBL29rcau7PL5tJcxdt4cBgAtw+yq9SGOP45aJrCbTHDS4eInZbt+IDYroTmxBnKe2wNUwOC4=
X-Received: by 2002:a17:902:efd3:b0:19b:636:b153 with SMTP id
 ja19-20020a170902efd300b0019b0636b153mr1686012plb.6.1677157524833; Thu, 23
 Feb 2023 05:05:24 -0800 (PST)
MIME-Version: 1.0
References: <Y/Z/eJU/yEseH2Jk@rowland.harvard.edu>
In-Reply-To: <Y/Z/eJU/yEseH2Jk@rowland.harvard.edu>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Thu, 23 Feb 2023 08:05:13 -0500
Message-ID: <CAEjxPJ63keBZZTemgVmhejZh8RLD55t+JDPuVtFVp3sKW6Y3fg@mail.gmail.com>
Subject: Re: What's wrong with this usage of semanage fcontext?
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     selinux@vger.kernel.org, Dominick Grift <dac.override@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Feb 22, 2023 at 4:00 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> To anyone who can provide some advice: I'd like to know what's going
> wrong here.
>
> ------------------------------------------------------------
> # semanage fcontext -a -e /home '/mnt/export/share./home'
> # semanage fcontext -l -C
> ...
> SELinux Local fcontext Equivalence
>
> /mnt/export/share./home = /home
> # restorecon -v -r /mnt/export/share4/home
> Warning no default label for /mnt/export/share4/home
> ------------------------------------------------------------
>
> Shouldn't /mnt/export/share4/home match the PCRE '/mnt/export/share./home'?
> Why does restorecon say there's no default label?

I could be wrong but I think the equivalence aka substitution only
works for fixed strings, not regexes (at least wrt the source/original
path).
