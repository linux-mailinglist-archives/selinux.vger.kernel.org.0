Return-Path: <selinux+bounces-220-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 521DC816511
	for <lists+selinux@lfdr.de>; Mon, 18 Dec 2023 03:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 772A01C2213E
	for <lists+selinux@lfdr.de>; Mon, 18 Dec 2023 02:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8341E259C;
	Mon, 18 Dec 2023 02:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JsesuWhn"
X-Original-To: selinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B155528FA
	for <selinux@vger.kernel.org>; Mon, 18 Dec 2023 02:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702867866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ISMFEsMM1g2N73O1vBRmcaqbJpJmsUd8b4uizvNzNBg=;
	b=JsesuWhng555TSELCf/0d+hTwPMH+9UgGFuDDGCw8QtjvZ537Wa68QpZdCvNrdZowoAL1P
	yW+d/8DeJPk6kkOMmaK8WlaZGwk/DZbVsWD6gzh8CglDgY9vDENzMGpEdrP2NfImTc1jHt
	VnbyxZlBhCaRj/wYNAHws8kUw/9Aomg=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-xl-_HZ0XNIG8nqbdCh6_RA-1; Sun, 17 Dec 2023 21:51:02 -0500
X-MC-Unique: xl-_HZ0XNIG8nqbdCh6_RA-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6d2d95d1ee3so2381556b3a.3
        for <selinux@vger.kernel.org>; Sun, 17 Dec 2023 18:51:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702867862; x=1703472662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISMFEsMM1g2N73O1vBRmcaqbJpJmsUd8b4uizvNzNBg=;
        b=vMhYuyVNAuVAiTdJLKeAqn2sLO5vFyFrq1jg2Xa45qNtk7OCUt5ZM1ie1/Mw3SbYD5
         Y8Fgq5nuL6yV03Y0o06WSyRXWCn0gpVI0YcMjrxfyIS9LcBWNYacNJbicq9pYtcjHZq/
         1omgFNPDGdufOZ5sH95QWGIMkiwkLP+vGP7tYh6dwI4hxaG+FQCzCrd80r7KzkCsBP8k
         Eb73wwyNNEPdDocOu7ucaZvI+aoFgy0+2M64GnUTSjSKoMnZHf/2295H6wd1NNvE24eu
         TegIAhpRI+A955STPumw7f23YeTIkCEBggFg/VuHvW0QTFIqkf0AYPySVx7matXaswDm
         eoBw==
X-Gm-Message-State: AOJu0Yz96Dpy7s0dqA3ILyKLgKlu0ypR6MvHTYiWFZ3R9Kwz3oeE8W64
	yBXGwvCgBZHL8wjc7HfWUnJu5kxvpBx8q0YJDVuZ6lHLiiFK2vTghzET9yaT/c4kHGXn7/cFuvn
	OXw40Z/yImmYDV9H1ltX1iFWcBikZMN804w==
X-Received: by 2002:a05:6a21:9985:b0:190:2ae6:c685 with SMTP id ve5-20020a056a21998500b001902ae6c685mr20022266pzb.42.1702867861865;
        Sun, 17 Dec 2023 18:51:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCv9GdFyIZMKAWiwa9SY6YkVr3sTTb5Jm6rcirsnGe0JpRLP24GGIM7M1p0A2vBwQ/GToGo563T213nOdDLUM=
X-Received: by 2002:a05:6a21:9985:b0:190:2ae6:c685 with SMTP id
 ve5-20020a056a21998500b001902ae6c685mr20022250pzb.42.1702867861638; Sun, 17
 Dec 2023 18:51:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212131712.1816324-1-maxime.coquelin@redhat.com>
 <20231212131712.1816324-3-maxime.coquelin@redhat.com> <CACGkMEthp13a20TGashiFNDovK+b10mgfdX8L=3Xv05g5-eo0w@mail.gmail.com>
 <8afc44f7-cef5-4b4a-afac-85a4eb967d3e@redhat.com>
In-Reply-To: <8afc44f7-cef5-4b4a-afac-85a4eb967d3e@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 18 Dec 2023 10:50:50 +0800
Message-ID: <CACGkMEtNZyHDzo2e_N9SM9dw4CK8vpZHWBrk7TFFixD1T7cdjw@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] vduse: Temporarily disable control queue features
To: Maxime Coquelin <maxime.coquelin@redhat.com>
Cc: mst@redhat.com, xuanzhuo@linux.alibaba.com, paul@paul-moore.com, 
	jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, 
	eparis@parisplace.org, xieyongji@bytedance.com, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	david.marchand@redhat.com, lulu@redhat.com, casey@schaufler-ca.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 7:23=E2=80=AFPM Maxime Coquelin
<maxime.coquelin@redhat.com> wrote:
>
> Hi Jason,
>
> On 12/13/23 05:52, Jason Wang wrote:
> > On Tue, Dec 12, 2023 at 9:17=E2=80=AFPM Maxime Coquelin
> > <maxime.coquelin@redhat.com> wrote:
> >>
> >> Virtio-net driver control queue implementation is not safe
> >> when used with VDUSE. If the VDUSE application does not
> >> reply to control queue messages, it currently ends up
> >> hanging the kernel thread sending this command.
> >>
> >> Some work is on-going to make the control queue
> >> implementation robust with VDUSE. Until it is completed,
> >> let's disable control virtqueue and features that depend on
> >> it.
> >>
> >> Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
> >
> > I wonder if it's better to fail instead of a mask as a start.
>
> I think it is better to use a mask and not fail, so that we can in the
> future use a recent VDUSE application with an older kernel.

It may confuse the userspace unless userspace can do post check after
CREATE_DEV.

And for blk we fail when WCE is set in feature_is_valid():

static bool features_is_valid(u64 features)
{
        if (!(features & (1ULL << VIRTIO_F_ACCESS_PLATFORM)))
                return false;

        /* Now we only support read-only configuration space */
        if (features & (1ULL << VIRTIO_BLK_F_CONFIG_WCE))
                return false;

        return true;
}

Thanks

>
> Why would it be better to fail than negotiating?
>
> Thanks,
> Maxime
>


