Return-Path: <selinux+bounces-5451-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DE2C17677
	for <lists+selinux@lfdr.de>; Wed, 29 Oct 2025 00:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8E1304E5F36
	for <lists+selinux@lfdr.de>; Tue, 28 Oct 2025 23:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4AB30648C;
	Tue, 28 Oct 2025 23:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="fnHEDd9O"
X-Original-To: selinux@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4273054F0
	for <selinux@vger.kernel.org>; Tue, 28 Oct 2025 23:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761695477; cv=none; b=RfLWarvUlR+2OMRN0dBT7cyF4SwZpSLluzq9nfSV7rhhcHWbOw8G4mYMkr8aD7gO3z5aHiiEvGY4t4JRRTATu9HzQi9UaHvv4fiYKUGt/hb9kz8y/9Ik5n9xYZs6vJ+Sv7XjZcf9lC4pRxkOhaH8/00bhsMnhAkpB+aO5vInHBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761695477; c=relaxed/simple;
	bh=zhqXyFTzb2t3B9Dp9QKvidvf264lh5WpAlH4hAvSPD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lqPn11MNUBToi0MMleb2iZawBkeCUMEz0Iz8Azg086TyJ6qs0XhG4wj0vMVLkrfqjJHOBoyPuzww2xfmzNNP7Dgfs6kZGPeKVDkhUxqoxDhEudRapk4bps+h4ignGWaHPHQa7GWhH5B2Lr58PDevpVeuCywwlR0WiyF5hmMupWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=fnHEDd9O; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b6cdba2663dso4753688a12.2
        for <selinux@vger.kernel.org>; Tue, 28 Oct 2025 16:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1761695475; x=1762300275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ss0xsZDTL1rwOqKY2yzsfuodL2zhm4Ktw8Z3rrAQsGY=;
        b=fnHEDd9OESW8jqv4smyGKFm+OqaP/L6WyQOyxmytcboxuIZmCn2d5OIjDlj4H83pbQ
         DNMSGk++elnzbqoGpEs3Y4W+aSy76QCWVvUzYJjTIm8e+POHZ9DcpC2LRXkQd5qPBP2g
         1g8lrMQBjzgUwgy2Ix8WUuVSVykKqvA0eTONevzKE4wNIUZ2IsQ/s+RvIiMp/pLyzCjO
         BsjYSxL3tJwQQgmoWHbQKIUcILsgzRPb5YTHGsLHMIp9zhbkHiGNfmD4n9T3CG5W3+el
         hvb43Zv8eBUA4zUNpTmOoJIXUE3+5YG9sb87y0t64ycC4jM8AxrEfokDiKCO6q3FDn1C
         hDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761695475; x=1762300275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ss0xsZDTL1rwOqKY2yzsfuodL2zhm4Ktw8Z3rrAQsGY=;
        b=u/dlbVT4tUy4jCF7VoH/tah2nkN8OVIgRQrpnPbLusF39QGduFakkg5DNy//dWronr
         bllOQt4fWwcDEss6Hwt2oOZd/ACjQlSrozlLVv2ECEjtXITBycSu6C2APuKnLuMwfIJe
         Fw3hIk+c71PewqyRHI7vqvCIDKHaCKaoo7UxDmS3qlC37GVEo18oBBcdoqVl39dO+xx6
         O4ACzm6ECq+Xqe/TvlXyc3fPwXFDh+JwhJG1Fg9XL75O2iWhYc96K5jfgi3R2H1xN0nD
         24LpRux49q9MYqS919sBdnnHCIQ6z7oymHQ7apuzytSNN0wztg7xUiZ+N/GsK2tu2VeR
         sqiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPMhDXGFAdDE1xPOSLPwO30oDGAY3jpMVK6NPiapspRWlGQPknBxqzHAkSvxpUduDUEBfukjqg@vger.kernel.org
X-Gm-Message-State: AOJu0YzyqN7D5PpKtS7r+5B0cL54mXZMPsUT2pN4tmG+D1fKkJ1tLGSG
	r4uzS4iTX/QaCv9xPrPrrk8qYnWay/hvhD1SCVzjoE59Xd2u0vcNe5eivz5rZDXdUOTJm4VwdJ+
	KfMRx/uorCl+x3gt/tK5rtDvmWMbXUicgIM3lMIO6
X-Gm-Gg: ASbGncv35hHFMESFPoNP2pi2RKucPhhl8mSL0RVnBvCTVt4KjHfAYUeeN8kTrEpqDJ7
	itR085L860M8vbXJ7r6HSrGrlvk8GLnXaefgbcmeJBOcLD+Rs5fQCLeYDwTenzU/k/mL9IbFhsZ
	sK7d3F0E69MWsuuIunUnX6bsRkca5Pr0fRpOZ6D8NVRrpkxYl6xQqv15ACR0NJFHvd0YUVWNn56
	r52m3UFTaggIiBgJAyxXAPOwoMiBefIu0wbK+MFgx//lxhSNoJBy0hiAERE
X-Google-Smtp-Source: AGHT+IEQNyH4/UIhryBKstXm8OFaWiuLlbUq8UQcH5+4F6rsLQi06Pj91sWwNLFBJTsNKL1LL+PFGKuePdALOMKBWdA=
X-Received: by 2002:a17:903:32c1:b0:267:99bf:6724 with SMTP id
 d9443c01a7336-294deebc1a4mr13124835ad.31.1761695475463; Tue, 28 Oct 2025
 16:51:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk> <20251028004614.393374-35-viro@zeniv.linux.org.uk>
In-Reply-To: <20251028004614.393374-35-viro@zeniv.linux.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Oct 2025 19:51:04 -0400
X-Gm-Features: AWmQ_bn3uluZWrDfxLWehWBukesK9g25bn5Thq9tyHBU2hJYs5NTI3fvunVput8
Message-ID: <CAHC9VhRa011jL86779TBk8FK-pcWinLkSkQ1MoxGyyfJg5SMgA@mail.gmail.com>
Subject: Re: [PATCH v2 34/50] selinuxfs: new helper for attaching files to tree
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu, 
	neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org, 
	rostedt@goodmis.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 8:46=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> allocating dentry after the inode has been set up reduces the amount
> of boilerplate - "attach this inode under that name and this parent
> or drop inode in case of failure" simplifies quite a few places.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  security/selinux/selinuxfs.c | 160 +++++++++++++++--------------------
>  1 file changed, 66 insertions(+), 94 deletions(-)

Looks fine to me, thanks Al.  If for some reason the rest of the
patchset doesn't go anywhere, let me know and I can take this patch;
it seems like a nice improvement independent of the rest.

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com

