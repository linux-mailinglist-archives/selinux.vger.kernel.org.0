Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ACEE7C6E0C
	for <lists+selinux@lfdr.de>; Thu, 12 Oct 2023 14:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378664AbjJLM0r convert rfc822-to-8bit (ORCPT
        <rfc822;lists+selinux@lfdr.de>); Thu, 12 Oct 2023 08:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347244AbjJLM0q (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 12 Oct 2023 08:26:46 -0400
Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com [14.137.139.154])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20669BA;
        Thu, 12 Oct 2023 05:26:43 -0700 (PDT)
Received: from mail02.huawei.com (unknown [172.18.147.227])
        by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4S5pQ43bBvz9v7JM;
        Thu, 12 Oct 2023 20:11:08 +0800 (CST)
Received: from [127.0.0.1] (unknown [10.204.63.22])
        by APP2 (Coremail) with SMTP id GxC2BwA327bY5SdlSIcLAg--.35546S2;
        Thu, 12 Oct 2023 13:26:13 +0100 (CET)
Message-ID: <168dd7a1a1d6e5318b3d68e743ccaced54591ac7.camel@huaweicloud.com>
Subject: Re: [PATCH v3 12/25] security: Introduce inode_post_setattr hook
From:   Roberto Sassu <roberto.sassu@huaweicloud.com>
To:     Mimi Zohar <zohar@linux.ibm.com>, viro@zeniv.linux.org.uk,
        brauner@kernel.org, chuck.lever@oracle.com, jlayton@kernel.org,
        neilb@suse.de, kolga@netapp.com, Dai.Ngo@oracle.com,
        tom@talpey.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com,
        jmorris@namei.org, serge@hallyn.com, dhowells@redhat.com,
        jarkko@kernel.org, stephen.smalley.work@gmail.com,
        eparis@parisplace.org, casey@schaufler-ca.com
Cc:     linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-nfs@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
        selinux@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>
Date:   Thu, 12 Oct 2023 14:25:58 +0200
In-Reply-To: <b295d1aae72d8122178dc93c9aac21217bde682a.camel@linux.ibm.com>
References: <20230904133415.1799503-1-roberto.sassu@huaweicloud.com>
         <20230904133415.1799503-13-roberto.sassu@huaweicloud.com>
         <22761c3d88c2c4dbac747cc7ddca3d743c6d88d9.camel@linux.ibm.com>
         <80e4a1ea172edb2d4d441b70dcd93bfa1654a5b7.camel@huaweicloud.com>
         <b295d1aae72d8122178dc93c9aac21217bde682a.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CM-TRANSID: GxC2BwA327bY5SdlSIcLAg--.35546S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr1DAF4xuFW8JrWUtF15twb_yoW8XFy5pF
        W8KayDKFs8tFW7A3s3tF4fZ3yFvFyfKw1UXrsYqryxA3Wq9r13KFs7GayF9FWDGrWUGw1Y
        vr4ag3srWryDZa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
        6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
        vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
        xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I
        0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8C
        rVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4
        IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCF04k20xvY
        0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
        0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAI
        cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0x
        vE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
        87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IUbHa0PUUUUU==
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAQAIBF1jj5TzGgABsA
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, 2023-10-12 at 07:43 -0400, Mimi Zohar wrote:
> On Thu, 2023-10-12 at 09:42 +0200, Roberto Sassu wrote:
> > On Wed, 2023-10-11 at 20:08 -0400, Mimi Zohar wrote:
> > > gOn Mon, 2023-09-04 at 15:34 +0200, Roberto Sassu wrote:
> > > > From: Roberto Sassu <roberto.sassu@huawei.com>
> > > > 
> > > > In preparation for moving IMA and EVM to the LSM infrastructure, introduce
> > > > the inode_post_setattr hook.
> > > > 
> > > > It is useful for EVM to recalculate the HMAC on modified file attributes
> > > > and other file metadata, after it verified the HMAC of current file
> > > > metadata with the inode_setattr hook.
> > > 
> > > "useful"?  
> > > 
> > > At inode_setattr hook, EVM verifies the file's existing HMAC value.  At
> > > inode_post_setattr, EVM re-calculates the file's HMAC based on the
> > > modified file attributes and other file metadata.
> > > 
> > > > 
> > > > LSMs should use the new hook instead of inode_setattr, when they need to
> > > > know that the operation was done successfully (not known in inode_setattr).
> > > > The new hook cannot return an error and cannot cause the operation to be
> > > > reverted.
> > > 
> > > Other LSMs could similarly update security xattrs or ...
> > 
> > I added your sentence. The one above is to satisfy Casey's request to
> > justify the addition of the new hook, and to explain why inode_setattr
> > is not sufficient.
> 
> I was suggesting simplifying the wording.  Perhaps something like:
> 
> Other LSMs could similarly take some action after successful file attri
> bute change.

Ok, will use that.

Thanks

Roberto


