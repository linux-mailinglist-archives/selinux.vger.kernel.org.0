Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17B4B49BA29
	for <lists+selinux@lfdr.de>; Tue, 25 Jan 2022 18:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1587289AbiAYRTb (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 25 Jan 2022 12:19:31 -0500
Received: from sonic306-27.consmr.mail.ne1.yahoo.com ([66.163.189.89]:39177
        "EHLO sonic306-27.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1587265AbiAYRQb (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 25 Jan 2022 12:16:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1643130982; bh=ZTCfz9qMKBmQxEYPjsLwcn12fT4I6FbGX2UFSljuVnI=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=dmV3XM0SeEoMcteWg6kc1T+qUs9HrCcnhpjrAei9gRXKUb7i1a4bNYGSSGbEM+cFIdrdMjDMVqtJbFNio+41mSpvr3BbuWsDE/JipPgj7BnqlHYh18t5XHmyzFQY3FCZxOwFiXsj45UOAEV2ixI3uHz++VW2hokakbxNlyuS3mWEvI7nJILJ8hPv0QpZmIKxAwAgJcrv5DsrnODiyrItExBIXiND1ejxoR7ykSUlqb0P4JSkJaxn2bvbjHvvuD7Ebg8mM6Q5BZxfn8VAhY4IHjVhbUSomHrl7YmpimBeUbbAzLOUipS7E99oCFGLxchKRt+te58RG9P6qxYc3MAf3Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1643130982; bh=zoCBbjAxOZDlmvkZf4QZPLF9/77i8R5RMpAt4y34oNR=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=t1MqM/7+1Hayk/yyFYwLfGWavWqry7hVJ5huPWF27fA+w5At5u0pcXOX0Md1qWhgtRsBuYd9QbFjHkW2gtEjim6WJlpRQfVoNBxqm3g4RKcxzRjlZsfHt5DmUI0nZfR3WJUfVS1OnAWp8MGryoHC9LVFYH3RSIRHgodrv/AAcbalepRkpXriKe1+AyHxbLahS0if+j1q42fkuL0oL/WNDyl612A0M+xB86t27W8hz0F5ZLT3Ffz95lOVFE8kTcxHZmyMkdufQtiP8yJ4ajrd+OjSr19QYO8YxX2+pfTvSz9gOyEu6Ecky8/3piAberLkMp8lTvsTaZ7hnh77w6LRAA==
X-YMail-OSG: gDxd_AkVM1mePA64EXGdbO.5PRnJIlSbLklFMpmMK_3TETqQ6oi1BXiEBLaJs4U
 e8ekYCHlQTgKPyM.1vvSlgo1bwOqpzi5eo_8Y3O7alsfCqBdg7WI.bMt63oiaJPOVQhAPlywSI2X
 ST_RSgYJHLTraHCL6KnSfF5QCX_z01S7fUkS.Z7RDiHVoZvBT4Ib.oN1qImtIeFAGsDJ2b0AXiJF
 UUB7kYXtPurFimY7dnlKkcaBYKJrB23GB608u8PBeGB.bS3VC6_XOn9QsF_mx_z52bZdUDJI2zWz
 HcRBQVWnDQAQjsm_DA.UGqRYH4p3X6KONuGzS8rnFMrfTE9aChTmVqMrCB4LSWxyKg6bPw3NjAuH
 G5QC_J8xJp2ntos5oB3apFnRhctLr3y4lIuzd.iEpNtDCI8ztziCA3AYjrgiMgKKHYir4g9QEkOK
 EoqTk_xqhrWlRhPRTWoCy85NonrxndFBkvOkP.FGMf6m.jVyi81z214qJQPMZ5T5gw9EzokF252_
 MuJ5jHExFgtG0lcgBdtJ2tIwEayv1caRcR5QQi70GfEsgLvICXf1hWhuLeCsMbUkenPIUzSBgHj7
 yvA8smow7X1yzFqlWxf4OuA.Ja2v7tRBZavWqpXLDBJcrEin_yYgs4hcTv_kny4L5XG39kn46g90
 0zxy3vWvc0dvpN8jKKyc9t3YI0JMUVWzwRwP5PH5E5DcD9jkT_RtK65gJAM_tlQ3JNODznURF2sW
 6KI8NnF5uAhYaK7xyOi.eqgQJ0sjyB4fDaLWXuUHzwV7oWNu9R6OlWDhsCoKq.fi5Q5hGwQHSxqI
 5.cbagumNhNirRq1Yi.fkDYr1jx_PToTkgbZLZZBGkMEzdy59Hm3DZlx_j_XYj3O8Q.ZvM_p3EWo
 zif0sElxQNXEVi01QMKKV.QvtPEu9l59uOFhln0HEpIdWrcHizaCMTdSZy3mtg9UCc0d86QhnT7D
 Nh8TEO6zeUnz61w1MLDj510Dz889gvDoH311XWYrIlZBFyXRehWcQyfHEbraqq7xuOvHvNGY8y7l
 zLG4FqRiFGDY_z7lJ4bzMGxKoLUWqwUtrWc_OKew4Q7En4ZUl6msgLrxkft0QHvFL7i.FINVaItG
 WqOlPXqZZSjsPPk_6vodum8TXLeB7WGhu3nv5saTPnRY7kI8x2QnPcgVHvfM5Y2EsHKNZSRRZSyd
 JWLT3vCX2whVTWLiqmTeW3NDrSdllXjgMsue_IcnWxlxOLigplmT.5CYbciYZkjJ1GdfRjhguq.K
 vdbSIXC_qM2bbkxlzRvH9_f0iAY52aUQkhn4cef7raplBx5X09JH7_FofGZdpqEuKB4G6nfrvC6x
 BBTcdIFfv2Ho5e3xkq_Z3ufE8ihyTO30UaZFTzE3TVo3298VysOaPJfUIYdpz38x1fj7TJ6o1T56
 kBrXRjzN6QRE8U3jmHLgBAionVeWGrDxJQyYnYn.plCqdzyfWGktq7W6jIJ0jxXZtDKff7DZjzgJ
 .GEfGoW5qPe.CCJ5zyv8.LpJDGidXDDIJNwQ5vlgBAQQ92cf7HOTwl9oJ6DM5LFFBNnyikiJUFrX
 hT_6kHRbZCjgJIb8F1SD72WzMUyVT3YJnX66IvrGak1K_SkYmoam5Gky1zkoiCFnNFKtwBU01B3b
 DSL6U61sFPs6.b9nPMQSA.1UCcVF_OeCBdp1wWIaB8ahialOpSP7oZh0kYeD69MMSoRMo4Orljhr
 KRf4Am32Moer_VsjrQTYMzrEzhYqHFQbnTy6gh5IX6zWju5S8oIdL4L66BT1RBsc9b2I2u0GYfoL
 f4JwS.HzM1eorDoUSjyHRiWHqtKl5QkbDtAroWFrEShi26lTPxv2NRPga_M16pJSUaph5T.g4CbH
 VUXb3BhpIY.mM72E.lj2LeLq4O6uoDird.kwF3lcprcoB9SkfoHsZBjRLWdKRpkHQtKLy.NEUCn4
 YsKwF7ZHCk8_An9zFU_bVEb2gwWIvlhYewfCaV5ImIfyXZtzv9H_CrBelg61nN2GxIStwg7Ao724
 N22wnd92aqzeJ5JR0bpjYIDRaD6yZrZ2WRvP99ooJ9.4JkfiaNLzbH10PH7u74Dm1j7FRyWpSR5_
 xOoohLkqtH5otwcZ3v4T5GPUvpHiO2JsNPWYPyP4mNjiueFwVQb9iVvk628dyUkEVNUfQjAiNzYj
 _ZrWlvXzwzvKX0Y7RbxkOKt06LejrflA8C7BJGGYPRXXTAlCQeczoO7lf58jDRoslwvGG8ywvsvC
 vYSkOFeXhQv.K2rW51A50FredcznA7zSjkZlOP8T6_7xknMKq7mZCRwuQJvvmtn4-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Tue, 25 Jan 2022 17:16:22 +0000
Received: by kubenode543.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID 9c14eaaa98df240cf64493acffbf7d7e;
          Tue, 25 Jan 2022 17:16:17 +0000 (UTC)
Message-ID: <19ec3a66-6638-0526-0a96-8b6a5c0ffb26@schaufler-ca.com>
Date:   Tue, 25 Jan 2022 09:16:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next] selinux: access superblock_security_struct in LSM
 blob way
Content-Language: en-US
To:     "GONG, Ruiqi" <gongruiqi1@huawei.com>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>
Cc:     Ondrej Mosnacek <omosnace@redhat.com>,
        Anna Schumaker <Anna.Schumaker@Netapp.com>,
        Olga Kornievskaia <kolga@netapp.com>, selinux@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wang Weiyang <wangweiyang2@huawei.com>,
        Xiu Jianfeng <xiujianfeng@huawei.com>,
        Casey Schaufler <casey@schaufler-ca.com>
References: <20220125071133.188172-1-gongruiqi1@huawei.com>
From:   Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20220125071133.188172-1-gongruiqi1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.19615 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 1/24/2022 11:11 PM, GONG, Ruiqi wrote:
> LSM blob has been involved for superblock's security struct. So fix the
> remaining direct access to sb->s_security by using the LSM blob
> mechanism.
>
> Fixes: 08abe46b2cfc ("selinux: fall back to SECURITY_FS_USE_GENFS if no xattr support")
> Fixes: 69c4a42d72eb ("lsm,selinux: add new hook to compare new mount to an existing mount")
> Signed-off-by: GONG, Ruiqi <gongruiqi1@huawei.com>

Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>

This is pretty important.

> ---
>   security/selinux/hooks.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 5b6895e4fc29..a0243bae8423 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -479,7 +479,7 @@ static int selinux_is_sblabel_mnt(struct super_block *sb)
>   
>   static int sb_check_xattr_support(struct super_block *sb)
>   {
> -	struct superblock_security_struct *sbsec = sb->s_security;
> +	struct superblock_security_struct *sbsec = selinux_superblock(sb);
>   	struct dentry *root = sb->s_root;
>   	struct inode *root_inode = d_backing_inode(root);
>   	u32 sid;
> @@ -2647,7 +2647,7 @@ static int selinux_sb_eat_lsm_opts(char *options, void **mnt_opts)
>   static int selinux_sb_mnt_opts_compat(struct super_block *sb, void *mnt_opts)
>   {
>   	struct selinux_mnt_opts *opts = mnt_opts;
> -	struct superblock_security_struct *sbsec = sb->s_security;
> +	struct superblock_security_struct *sbsec = selinux_superblock(sb);
>   	u32 sid;
>   	int rc;
>   
