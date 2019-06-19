Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A69464B0E1
	for <lists+selinux@lfdr.de>; Wed, 19 Jun 2019 06:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbfFSEeH (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 19 Jun 2019 00:34:07 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41816 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbfFSEeH (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 19 Jun 2019 00:34:07 -0400
Received: by mail-pf1-f196.google.com with SMTP id m30so8940764pff.8
        for <selinux@vger.kernel.org>; Tue, 18 Jun 2019 21:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IV+JYdYPb8Zn3uQ2e6/D+/5ZTRgunkx7DW9vZ1oytDY=;
        b=lZfKjFmpF+kSolMRukVTHY1HGMY8w1a6fITnsVl6bvKUP1DixWL/Ghr0wVEcgrJkMY
         Qk0cqyQB5AWVOQ/5fb8W5i8FgPY8cFoY0Firr3dCq2MV0st2c7vzmSwHq4mP4wx6Ikrx
         D5FbslX/gp7BC0ot8RXVHa3MSR9zfuTrjOXGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IV+JYdYPb8Zn3uQ2e6/D+/5ZTRgunkx7DW9vZ1oytDY=;
        b=dKejQH8ANyLpPMJfvT11PiPo8VyVRfQkTYrVvESaF1UY03yqvNJG7u0h/THXGWTVHk
         DS1bi5LgHY6VKUamkIHVnO8eczoQqGPb6tvaK8Vc7K21jkKoCJt+hsiOlleorV4nnGKv
         MCiLpFJ1MXU4dnUC1IFlAgtcQ1HzcxjMYdXsYI2MS+kamt8YFNru+GTiU4rcNc0s6Gv5
         /Qigxdaglxg3bIl7GQ4bstSaMeTwRX0HVaFXyAQILzR5Y1VtMub3VYqqJoavuZesXjZq
         pdKCd9u7oDssKrf2pbgCjA3BwF1Sp/Qo5n7WQckJW8pmeFexgZwizxz/7kbwtOlUR8C5
         fZAQ==
X-Gm-Message-State: APjAAAVLXT7Z3+GUX9GkA8lGa+ouLw5g4yO+PcvypEJLO7YzMJDLaa+o
        ZeiFjlClzXK7pOq1lxMs/r2Yog==
X-Google-Smtp-Source: APXvYqw/I50P/QEV0Q2f2EtQagyUBrKGuGmRPdOiSIBRzUCW+ZCLiTiEcipy9wce1ESadMev9lxC2A==
X-Received: by 2002:a17:90a:1aa4:: with SMTP id p33mr9096253pjp.27.1560918846482;
        Tue, 18 Jun 2019 21:34:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x26sm14708316pfq.69.2019.06.18.21.34.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 21:34:05 -0700 (PDT)
Date:   Tue, 18 Jun 2019 21:34:04 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: Re: [PATCH v2 00/25] LSM: Module stacking for AppArmor
Message-ID: <201906182133.EBF2C78D@keescook>
References: <20190618230551.7475-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618230551.7475-1-casey@schaufler-ca.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Jun 18, 2019 at 04:05:26PM -0700, Casey Schaufler wrote:
> Patches 0001-0003 complete the process of moving managment
> of security blobs that might be shared from the individual
> modules to the infrastructure.

I think these are happy stand-alone patches and should just go into the
common LSM tree for v5.3.

-- 
Kees Cook
