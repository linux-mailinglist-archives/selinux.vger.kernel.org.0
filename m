Return-Path: <selinux+bounces-180-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2C180F513
	for <lists+selinux@lfdr.de>; Tue, 12 Dec 2023 19:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90D81281DB5
	for <lists+selinux@lfdr.de>; Tue, 12 Dec 2023 18:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778587E760;
	Tue, 12 Dec 2023 18:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h2PuWfy3"
X-Original-To: selinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC7BB9
	for <selinux@vger.kernel.org>; Tue, 12 Dec 2023 10:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702404010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hi+Je7A1ir5Jf7RMpbBJ6wePhajEbToaWXnOvXBTaw4=;
	b=h2PuWfy3D+a9HlcTpemTh5DUfzHxYeVyrIJp4gC5zw1ofK+ObkxDm+e9XLrNX9iGPKa2Ty
	546eQJRrKH5BtRKOthGhBAqtgbhzqRu/Pf++Wv/aOjHrWVR61vLO1H9V2Mp93qHL7nWUAU
	CdlsR00qy4fK1doTReDYmKdE6j7fJ7U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-LOut5fM-P8Wy9B-01OHr3A-1; Tue, 12 Dec 2023 13:00:08 -0500
X-MC-Unique: LOut5fM-P8Wy9B-01OHr3A-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40c41b91a1fso21938505e9.0
        for <selinux@vger.kernel.org>; Tue, 12 Dec 2023 10:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702404005; x=1703008805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hi+Je7A1ir5Jf7RMpbBJ6wePhajEbToaWXnOvXBTaw4=;
        b=RhgXhHULGhHE7Kqv7x/rxAZhg9ai5lkRkZ5mJ2j5+4GRldhOuczlfo5bWq4llZmW5W
         BJtCxhsQfcwt7l/ljyP2Q6WF6S4xd6S9TaVCDPLbzVd5t3aQ4evv4nAaU/mtGEJAvxxC
         mYiGDfvAv16vfO2MhSC5itiM3OoidBrt5fYYIruqxjq0OoW2Lw8EOG2EklWl6zvi/f8c
         1WGJmFg9Xkr1jXedKm7adQC13eVRTaez/inPKqfa8ynEoPF3ZFo/SJ/9OOX4DdJuN3QU
         axuTeq3wlHcn0sKozFAfCaLVlVnWYo6H59/Zli/6mrB0zmZLfsdsxAV+fq5omD071a3n
         llZw==
X-Gm-Message-State: AOJu0YwNkg4au15iAvYFhiPGZhx5waj2ZhbBovii+HMUfQoWbFPmMuH5
	9nwcucZT5R57ST72OfnfGNoUOuwmpTlCC/BPyc6O/k8HKH/eaH/4R5MPh1/1mvdmjzMJpgkVqdr
	YNxOpQEXGecgd/+cYeQ==
X-Received: by 2002:a05:600c:22d7:b0:40b:5f03:6f2f with SMTP id 23-20020a05600c22d700b0040b5f036f2fmr2295081wmg.265.1702404004891;
        Tue, 12 Dec 2023 10:00:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSDxTS0Dbwm0yWFWvFpkddTtVCdD25MSkyGCWfgQkzixXvX6A/om8nqxSeqL3MjgQ1Ea26IA==
X-Received: by 2002:a05:600c:22d7:b0:40b:5f03:6f2f with SMTP id 23-20020a05600c22d700b0040b5f036f2fmr2295066wmg.265.1702404004421;
        Tue, 12 Dec 2023 10:00:04 -0800 (PST)
Received: from redhat.com ([2.52.23.105])
        by smtp.gmail.com with ESMTPSA id c17-20020a05600c0a5100b0040b4fca8620sm19831250wmq.37.2023.12.12.10.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 10:00:03 -0800 (PST)
Date: Tue, 12 Dec 2023 12:59:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>, jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com, paul@paul-moore.com, jmorris@namei.org,
	serge@hallyn.com, stephen.smalley.work@gmail.com,
	eparis@parisplace.org, xieyongji@bytedance.com,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, david.marchand@redhat.com, lulu@redhat.com
Subject: Re: [PATCH v5 4/4] vduse: Add LSM hook to check Virtio device type
Message-ID: <20231212124518-mutt-send-email-mst@kernel.org>
References: <20231212131712.1816324-1-maxime.coquelin@redhat.com>
 <20231212131712.1816324-5-maxime.coquelin@redhat.com>
 <c58da5f5-131f-425e-b008-260506d1bc0d@schaufler-ca.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c58da5f5-131f-425e-b008-260506d1bc0d@schaufler-ca.com>

On Tue, Dec 12, 2023 at 08:33:39AM -0800, Casey Schaufler wrote:
> On 12/12/2023 5:17 AM, Maxime Coquelin wrote:
> > This patch introduces a LSM hook for devices creation,
> > destruction (ioctl()) and opening (open()) operations,
> > checking the application is allowed to perform these
> > operations for the Virtio device type.
> 
> My earlier comments on a vduse specific LSM hook still hold.
> I would much prefer to see a device permissions hook(s) that
> are useful for devices in general. Not just vduse devices.
> I know that there are already some very special purpose LSM
> hooks, but the experience with maintaining them is why I don't
> want more of them. 

What exactly does this mean? Devices like tap etc? How do we
find them all though?

> >
> > Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
> > ---
> >  MAINTAINERS                         |  1 +
> >  drivers/vdpa/vdpa_user/vduse_dev.c  | 13 ++++++++++++
> >  include/linux/lsm_hook_defs.h       |  2 ++
> >  include/linux/security.h            |  6 ++++++
> >  include/linux/vduse.h               | 14 +++++++++++++
> >  security/security.c                 | 15 ++++++++++++++
> >  security/selinux/hooks.c            | 32 +++++++++++++++++++++++++++++
> >  security/selinux/include/classmap.h |  2 ++
> >  8 files changed, 85 insertions(+)
> >  create mode 100644 include/linux/vduse.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a0fb0df07b43..4e83b14358d2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -23040,6 +23040,7 @@ F:	drivers/net/virtio_net.c
> >  F:	drivers/vdpa/
> >  F:	drivers/virtio/
> >  F:	include/linux/vdpa.h
> > +F:	include/linux/vduse.h
> >  F:	include/linux/virtio*.h
> >  F:	include/linux/vringh.h
> >  F:	include/uapi/linux/virtio_*.h
> > diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
> > index fa62825be378..59ab7eb62e20 100644
> > --- a/drivers/vdpa/vdpa_user/vduse_dev.c
> > +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
> > @@ -8,6 +8,7 @@
> >   *
> >   */
> >  
> > +#include "linux/security.h"
> >  #include <linux/init.h>
> >  #include <linux/module.h>
> >  #include <linux/cdev.h>
> > @@ -30,6 +31,7 @@
> >  #include <uapi/linux/virtio_blk.h>
> >  #include <uapi/linux/virtio_ring.h>
> >  #include <linux/mod_devicetable.h>
> > +#include <linux/vduse.h>
> >  
> >  #include "iova_domain.h"
> >  
> > @@ -1442,6 +1444,10 @@ static int vduse_dev_open(struct inode *inode, struct file *file)
> >  	if (dev->connected)
> >  		goto unlock;
> >  
> > +	ret = -EPERM;
> > +	if (security_vduse_perm_check(VDUSE_PERM_OPEN, dev->device_id))
> > +		goto unlock;
> > +
> >  	ret = 0;
> >  	dev->connected = true;
> >  	file->private_data = dev;
> > @@ -1664,6 +1670,9 @@ static int vduse_destroy_dev(char *name)
> >  	if (!dev)
> >  		return -EINVAL;
> >  
> > +	if (security_vduse_perm_check(VDUSE_PERM_DESTROY, dev->device_id))
> > +		return -EPERM;
> > +
> >  	mutex_lock(&dev->lock);
> >  	if (dev->vdev || dev->connected) {
> >  		mutex_unlock(&dev->lock);
> > @@ -1828,6 +1837,10 @@ static int vduse_create_dev(struct vduse_dev_config *config,
> >  	int ret;
> >  	struct vduse_dev *dev;
> >  
> > +	ret = -EPERM;
> > +	if (security_vduse_perm_check(VDUSE_PERM_CREATE, config->device_id))
> > +		goto err;
> > +
> >  	ret = -EEXIST;
> >  	if (vduse_find_dev(config->name))
> >  		goto err;
> > diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
> > index ff217a5ce552..3930ab2ae974 100644
> > --- a/include/linux/lsm_hook_defs.h
> > +++ b/include/linux/lsm_hook_defs.h
> > @@ -419,3 +419,5 @@ LSM_HOOK(int, 0, uring_override_creds, const struct cred *new)
> >  LSM_HOOK(int, 0, uring_sqpoll, void)
> >  LSM_HOOK(int, 0, uring_cmd, struct io_uring_cmd *ioucmd)
> >  #endif /* CONFIG_IO_URING */
> > +
> > +LSM_HOOK(int, 0, vduse_perm_check, enum vduse_op_perm op_perm, u32 device_id)
> > diff --git a/include/linux/security.h b/include/linux/security.h
> > index 1d1df326c881..2a2054172394 100644
> > --- a/include/linux/security.h
> > +++ b/include/linux/security.h
> > @@ -32,6 +32,7 @@
> >  #include <linux/string.h>
> >  #include <linux/mm.h>
> >  #include <linux/sockptr.h>
> > +#include <linux/vduse.h>
> >  
> >  struct linux_binprm;
> >  struct cred;
> > @@ -484,6 +485,7 @@ int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
> >  int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
> >  int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen);
> >  int security_locked_down(enum lockdown_reason what);
> > +int security_vduse_perm_check(enum vduse_op_perm op_perm, u32 device_id);
> >  #else /* CONFIG_SECURITY */
> >  
> >  static inline int call_blocking_lsm_notifier(enum lsm_event event, void *data)
> > @@ -1395,6 +1397,10 @@ static inline int security_locked_down(enum lockdown_reason what)
> >  {
> >  	return 0;
> >  }
> > +static inline int security_vduse_perm_check(enum vduse_op_perm op_perm, u32 device_id)
> > +{
> > +	return 0;
> > +}
> >  #endif	/* CONFIG_SECURITY */
> >  
> >  #if defined(CONFIG_SECURITY) && defined(CONFIG_WATCH_QUEUE)
> > diff --git a/include/linux/vduse.h b/include/linux/vduse.h
> > new file mode 100644
> > index 000000000000..7a20dcc43997
> > --- /dev/null
> > +++ b/include/linux/vduse.h
> > @@ -0,0 +1,14 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _LINUX_VDUSE_H
> > +#define _LINUX_VDUSE_H
> > +
> > +/*
> > + * The permission required for a VDUSE device operation.
> > + */
> > +enum vduse_op_perm {
> > +	VDUSE_PERM_CREATE,
> > +	VDUSE_PERM_DESTROY,
> > +	VDUSE_PERM_OPEN,
> > +};
> > +
> > +#endif /* _LINUX_VDUSE_H */
> > diff --git a/security/security.c b/security/security.c
> > index dcb3e7014f9b..150abf85f97d 100644
> > --- a/security/security.c
> > +++ b/security/security.c
> > @@ -5337,3 +5337,18 @@ int security_uring_cmd(struct io_uring_cmd *ioucmd)
> >  	return call_int_hook(uring_cmd, 0, ioucmd);
> >  }
> >  #endif /* CONFIG_IO_URING */
> > +
> > +/**
> > + * security_vduse_perm_check() - Check if a VDUSE device type operation is allowed
> > + * @op_perm: the operation type
> > + * @device_id: the Virtio device ID
> > + *
> > + * Check whether the Virtio device creation is allowed
> > + *
> > + * Return: Returns 0 if permission is granted.
> > + */
> > +int security_vduse_perm_check(enum vduse_op_perm op_perm, u32 device_id)
> > +{
> > +	return call_int_hook(vduse_perm_check, 0, op_perm, device_id);
> > +}
> > +EXPORT_SYMBOL(security_vduse_perm_check);
> > diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> > index feda711c6b7b..18845e4f682f 100644
> > --- a/security/selinux/hooks.c
> > +++ b/security/selinux/hooks.c
> > @@ -21,6 +21,8 @@
> >   *  Copyright (C) 2016 Mellanox Technologies
> >   */
> >  
> > +#include "av_permissions.h"
> > +#include "linux/vduse.h"
> >  #include <linux/init.h>
> >  #include <linux/kd.h>
> >  #include <linux/kernel.h>
> > @@ -92,6 +94,7 @@
> >  #include <linux/fsnotify.h>
> >  #include <linux/fanotify.h>
> >  #include <linux/io_uring.h>
> > +#include <uapi/linux/virtio_ids.h>
> >  
> >  #include "avc.h"
> >  #include "objsec.h"
> > @@ -6950,6 +6953,34 @@ static int selinux_uring_cmd(struct io_uring_cmd *ioucmd)
> >  }
> >  #endif /* CONFIG_IO_URING */
> >  
> > +static int selinux_vduse_perm_check(enum vduse_op_perm op_perm, u32 device_id)
> > +{
> > +	u32 requested_op, requested_type, sid = current_sid();
> > +	int ret;
> > +
> > +	if (op_perm == VDUSE_PERM_CREATE)
> > +		requested_op = VDUSE__CREATE;
> > +	else if (op_perm == VDUSE__DESTROY)
> > +		requested_op = VDUSE__DESTROY;
> > +	else if (op_perm == VDUSE_PERM_OPEN)
> > +		requested_op = VDUSE__OPEN;
> > +	else
> > +		return -EINVAL;
> > +
> > +	ret = avc_has_perm(sid, sid, SECCLASS_VDUSE, requested_op, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (device_id == VIRTIO_ID_NET)
> > +		requested_type = VDUSE__NET;
> > +	else if (device_id == VIRTIO_ID_BLOCK)
> > +		requested_type = VDUSE__BLOCK;
> > +	else
> > +		return -EINVAL;
> > +
> > +	return avc_has_perm(sid, sid, SECCLASS_VDUSE, requested_type, NULL);
> > +}
> > +
> >  /*
> >   * IMPORTANT NOTE: When adding new hooks, please be careful to keep this order:
> >   * 1. any hooks that don't belong to (2.) or (3.) below,
> > @@ -7243,6 +7274,7 @@ static struct security_hook_list selinux_hooks[] __ro_after_init = {
> >  #ifdef CONFIG_PERF_EVENTS
> >  	LSM_HOOK_INIT(perf_event_alloc, selinux_perf_event_alloc),
> >  #endif
> > +	LSM_HOOK_INIT(vduse_perm_check, selinux_vduse_perm_check),
> >  };
> >  
> >  static __init int selinux_init(void)
> > diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
> > index a3c380775d41..b0a358cbac1c 100644
> > --- a/security/selinux/include/classmap.h
> > +++ b/security/selinux/include/classmap.h
> > @@ -256,6 +256,8 @@ const struct security_class_mapping secclass_map[] = {
> >  	  { "override_creds", "sqpoll", "cmd", NULL } },
> >  	{ "user_namespace",
> >  	  { "create", NULL } },
> > +	{ "vduse",
> > +	  { "create", "destroy", "open", "net", "block", NULL} },
> >  	{ NULL }
> >    };
> >  


