Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 254D333A36
	for <lists+selinux@lfdr.de>; Mon,  3 Jun 2019 23:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfFCVuu (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 3 Jun 2019 17:50:50 -0400
Received: from sonic303-9.consmr.mail.bf2.yahoo.com ([74.6.131.48]:33024 "EHLO
        sonic303-9.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726272AbfFCVuu (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 3 Jun 2019 17:50:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1559598648; bh=VhpqopIotudNuCiLKYtTB/ElDm9HB0G0nVPd3S5kTaE=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject; b=lrHsrJRby4hOaioiG8TpLLxEswQRoVuDDTC4obwR5OuI6ZSedpOgjQGtHr2aJDU+93IPvfMdqS7VLn7mmwZzLB4Llk4DLtICllPQO4GcC56s+x+Uy+U1lPuILpATFnZCgBAG16Pz+nfugn3rLVTCYXWqf1MLurn4pzEQ9VDnftDCJ+e06mO6EEEYLlyplrhmOtnZyK2i4+pWJLo+Jo6+LPkdmJLXqZQVCOP6CrhVocaN6yQzwfPUEEmfLi2vkymM41ISc3krTZTdrfbP23cdllOeNR8NKg2k/ekXhZf8iL5gHCAttz2Y2Ct5RqGGrqgIEEZm+KnkZwNxQJTb4kF6IQ==
X-YMail-OSG: Lc26mNIVM1noavuX5n_RtsofjV41Db_Ii2wtvB5qh8rksUZJovRNZlxtFetFtQa
 hWcH8eQMuQo2WVU1LUYObpJDtSmRxbyIpFhBqNt9QBWJThZm3nxZmrAaNdUaoK1SnFpzlx__n1Jj
 4Go1xiCk_YYXx_3s1DXjVJro8Aol0uotQQTA9_hSQ1H4hSZIQmWHcwSCiBfYLDFz_4JBq_x8g5Fn
 aflmefKWEBqmtBrej2IHR74cgRfT_V3JM9Ji4tgOd.aSVXyw_mkmKYiFM684bPuKlVkwMXRRmdAj
 _ozwU2VUJxLFLv7f4DO6MU5pL6nb3gZyS8dpN2twnwXStzai03yhrUK9_rD2m01a0JXkMEvIY.aE
 vyNtoZTRqPaYuIrZLxOCaDHmr8BrQi4UA3YbJBLdjvfR.kkEJCQB8YCJH5NCDIsDorMr_STPs70x
 a7qUFBJHZ4zzvdbXLdX5wbS9vJiOU1d_6.Tv5AQifHq_.0v7RDw38.Udqh.zjics8pahTr9Urmi4
 Us.VX2ve2gnSe4mrblh7j4udEJe.hVRaHa099SnB8mw0wkjkMBDGaU4HGIyhQxKy1spJZ1vbnRTj
 oDJUTYtzhpVBax1_EBrXKLxaoeaBREKQT25MpmBffIhZw5tsjJkzgw_yvPnMlv555ilCMWlnOWxU
 0zbWDdY2f3NrWMnF.l_4qGgR0xdVl0kkGP4BdwI81vVF8qQJZKUjSAbcempTcZqP.f_YvIxSSzwC
 dbysT2WMo5ltD950AKWw1r58hdZjAH_85Ml.EmTpsda546jUo9chCD94ibLpm0B1_77C4ELxY5vt
 dyJreuEV8.vQQc2v7wsz8vu8hzB0VvSvS1tmQy0mTyo4HYqirE9y242DeixBKsxMaprb4s.dAnTO
 kggvlLv0zsfHSd8xDbWtMH5hUo_A2bTB7vDzPRJweeMyyoL1pJCzDJfIZua.QvzpDWfIA1JF_Fxi
 UHEhJomKM2qOev.1vxAxfIajgFnqrLxJgxxKUzuFSH9T8Nksf6ge058MPQFLjzCwUxqABdhj8a.8
 Rb8kGz47uwNLSHS0p2mpdqcYXkrt8ACUsO_67j_HRiACY33OxdVzC9rGr5n_zqacsNWTmSuaDgwH
 kZp1ssHk2Eisk3u1RmPADN0mZo7kSa6kXXIuZy32mFJ.HKx5Phznf4p4w5uM1nQTbpgNIAz2h3OS
 MPO_f_Gx8y33mNjvlp6SvAIC1jB9Eppx.47C5KvisXX1CEX6214SHtBMvH9KzNLXldR8svcd9_wU
 pNPeObqAtkA--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.bf2.yahoo.com with HTTP; Mon, 3 Jun 2019 21:50:48 +0000
Received: from c-73-223-4-185.hsd1.ca.comcast.net (EHLO [192.168.0.103]) ([73.223.4.185])
          by smtp415.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 3fe81df611a3b892f9504b6653dc7653;
          Mon, 03 Jun 2019 21:40:44 +0000 (UTC)
Subject: Re: [PATCH 25/58] IMA: Clean out lsm_export scaffolding
To:     Kees Cook <keescook@chromium.org>
Cc:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov, casey@schaufler-ca.com
References: <20190531231020.628-1-casey@schaufler-ca.com>
 <20190531231020.628-26-casey@schaufler-ca.com>
 <201906011905.75B11DC86@keescook>
From:   Casey Schaufler <casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
 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
 abzjfg==
Message-ID: <ca667eb3-bf5a-4031-43bd-4b7178af233b@schaufler-ca.com>
Date:   Mon, 3 Jun 2019 14:40:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <201906011905.75B11DC86@keescook>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 6/1/2019 7:06 PM, Kees Cook wrote:
> On Fri, May 31, 2019 at 04:09:47PM -0700, Casey Schaufler wrote:
>> +++ b/security/integrity/ima/ima_api.c
>> @@ -159,7 +159,7 @@ void ima_add_violation(struct file *file, const unsigned char *filename,
>>   * ima_get_action - appraise & measure decision based on policy.
>>   * @inode: pointer to inode to measure
>>   * @cred: pointer to credentials structure to validate
>> - * @secid: secid of the task being validated
>> + * @l: LAM data of the task being validated
>>   * @mask: contains the permission mask (MAY_READ, MAY_WRITE, MAY_EXEC,
>>   *        MAY_APPEND)
>>   * @func: caller identifier
> Call this "l" just hurts me. Why shouldn't it still be secid?

Changing the type while leaving the name alone, or
changed slightly (e.g. secids instead of secid) makes
tracking down unchanged uses much harder. How about
lsme, or export?

> Also typo: LAM -> LSM.

That too.

