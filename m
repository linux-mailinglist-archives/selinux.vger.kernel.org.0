Return-Path: <selinux+bounces-3704-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60365AB9030
	for <lists+selinux@lfdr.de>; Thu, 15 May 2025 21:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E16A54A754E
	for <lists+selinux@lfdr.de>; Thu, 15 May 2025 19:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BD11E480;
	Thu, 15 May 2025 19:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="Zu3LZ7Cm"
X-Original-To: selinux@vger.kernel.org
Received: from sonic303-28.consmr.mail.ne1.yahoo.com (sonic303-28.consmr.mail.ne1.yahoo.com [66.163.188.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFD4257452
	for <selinux@vger.kernel.org>; Thu, 15 May 2025 19:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.188.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747338712; cv=none; b=X5c+oFQVAJBx2dmT9jAqXHX3+vHJJ5Sgr23Szrpa0Cn5zPqpDqVda2p/Jbk1qXFNmex2PCZGqm1rrMuv1DIPfOe9qkLr1jYvblZrJRqyDxWDF56zMeDMJPLD8Y57538VZoVZ1r8io6jTB7hj7njobowd85WO48Sojm8tOT9u8+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747338712; c=relaxed/simple;
	bh=5Vklj1JrYFY0Fn/4gKWqs/4yp/bPqwNhhsaVTgh4ktQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IzbH13GdwZfgKHW+SZsG7rw/OBLEEskhvtm/QBgONcSlRJRKvJVLIc2bfSB6wyhZjtCmLOj7VisHlSJhsYCsOmTpguTqFadZp3mFXADJ/c4cylZ7f8jlGgiGT5GHQn2izeeP7AvvHpsazBf9o3mCIj2gA3x3bPhaHsDV91/J8vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com; spf=none smtp.mailfrom=schaufler-ca.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=Zu3LZ7Cm; arc=none smtp.client-ip=66.163.188.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=schaufler-ca.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747338709; bh=mzJPSMc+sQkgk0EYMCjYYjj8aigO7t2bGixg9cVvOIQ=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=Zu3LZ7CmTSYwamTsTFjk7GsOCGlRYFTlXOjXeIDh1uMfzuXw2IbnK95VdtfTEMRNB7MpNFW+zK9jWPb6eVWNJkHmRhgHOCmas4EQTYd8n3NVgo5bPAByj3KmZ6nUY3nhZnOGqb9kAPBj/GAixR1uRTYiVgJLAXoKsgmZZv0zxuCp4ByOxPSUBdcktzMi9uOpirsbk+HXmAz70MmUaj3zxOY5pu9K5cR944dfguG690qpJXx+jRZXNRPdvjGJWZaowd1z/3hrmpmNGnSEhEjaLQpjgKaLRx0C3Flg3YfcRMsXUZhu0mKKb5TDRXv3SxeR+HjH8APIA+wWOLSZiDQgmg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747338709; bh=y/fmvehrQ8kS9kkkovTD/PEYpSdu8SXeNiTGgPZvv4s=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=UJ/0VvzFAtOKXTwFTPjyRFE9Y5cdOofiKoth+ndQ5OyNANyJ3VacUH6Pxq5lOFpxHcvIutPEO79ldoUdPHaMB43ubEpLHXF+ACv45ZwO5tZ9t1hzBclyEg8GaIX/P37uCQbn8PFSRtaEIKRiPRyUJN6aCxHNTGLLcoay5XA07T1xmdDwwjoBAunqKIH073clY2BHCA2MJipzW9hUyX6lRU67+wiZV6GVtUUuCjd/s6OaYaZVmZcHBoAaMXzKjKoW+eMgJ8Gz9SbPf02+mt0PYBrnYRPmFA8z7/Qxv93d3IEkZkVw7E7h0F8hHNwzuBOPt4fQs6uMpvLgKOpX7yfKhA==
X-YMail-OSG: JITX38sVM1laDubLeL8oWsHYkKrX0oIK_4fRCoCZOmQxJLZHCmulFCy1eF3YlrI
 GWZC4jr19.Oi2LTyha7TeNqhZ6I2VIijAvooANIfndBXxW2W.QGMNb5EBhUvT5J96cw9kGK9bSVt
 aTGwgnnDH3RUP_0L3Njxx7LqI_y1JTvluj6Psma0nIu.VCvHBMeGHPRqnMb5FQoGwjjVw2NlP2c9
 ZbYJhxGelmCkwj_idi1GMM5N.xFaUN6UMkiokrqM3g1E6Ljq2.lQsgqGwv.JB9FEmVhGgDg.H2yh
 ZafoVO719IQQ_OW4vY95KLBHAC3ZToGHM2WKSfjo775g8hoVikM.YrjKRK3ys94P99RUTGzsE72H
 t_l77dpSCpOOQJ78W5nwc.9lS4zx874bgTyABjsibySfLAe.EVAhSAqcYzZerSlYtkvgJTBVIoNw
 C.ZDTPGtIQGk2h3UIOd6vLvikcgt8RfCS.g64v_HcMyijBN04UIpNlxHBm8s1svM918NTAH_Wb4P
 R5z5tNLTJverImHzmzS4E40u.Z9cpxRMOqWt8SN8g8ibkTEF0hEwbVI6202AUE7lxknx4ewBmVmE
 6BByavHJJ.EYuZmr4MPzTp01wAFRpspt_wUuPnXduG9OvA4L1k3XoRWKGIXlexULNeifLtaBe_pd
 MESkPxEG6YwReJXbHprdfOfm8GbaOKFoX7zeSxw0NeA6pO8gvzKw6wMMJ5KQcL73ETUni.H611Ol
 tdVfZdXYX5bknbpOsipxLrfmXY4PEXb5AwqTQBVuSiT6HtgjCuwswxnQqmqu5NILLnSijv3vkPX7
 3hL6ffZFyWRgl07E9X7QemERuvtaFbgbE802nN3P860phteeutM6Qts01Wk7oUfF6Eu7cLuI6Hph
 gABfmwcqiBVDBCQBQ4LWvVXyM5H6NQNkPuSKy94si4DIB3K1Uhp8L.V8Nt9A8Qhk3dUzUCCxmyrW
 DuqY.eyU5F3kZ9zNBkuR8qoT17q0GZw8PeWV00IyKOa8DrLk3WpAuRU1RGWNyPjk87cjzOPWspbe
 woYQizvISdjdUp7ZB2ZuSzIW8P_R.zZ1uLfIZ8M7IOegN9wnXKwntiv5krNzWSODPTuwIwoZgS8V
 A4xO1kLOLhTJA2Mcwy2qzdvtXmtltMK94jQ4whI0_Mvn_7JoQnw3fIR4qrM_1r77ks1IXVa2ZXeS
 iT378wAFTv.fQgaQCwWxbTKcdXIhbNTMuDn7i0XaWysvkOfwWpSGW59cB27Kr7iN7mdB7Tau0ROr
 Gg3DO8SicC2WN9gO3K3SrGr1G1qk2DQJ56AWZ1wZfUNaHRb55zEKlpidHANJHPPucHDDgbNjULTe
 i._8Kry5Zf7DlJJLz0vurTe5mM9zI1.mbNF5hRrPESxHZCQGtLY6s97yVzcIDHXWUox5kJ7rqIPO
 Dp7_irnk6.T8LUQb8MdOajLWxnJCA8J27bAYT0tvk1QAbwB0RFd0.ssAQRswIePYhfjHiR0pVaRQ
 ghffWWTrM5bE8CyVdy77VYOE5FXbRKwt7E59DZA41LeOBn10vk0__2srya1OvcW7hjeL8EjI8zFa
 LLB1Q77.vQJPZG0aCDQ_HEH6fvaGS1zn1nCzxKKzeEwqhVu8PAO4UZF6QTvA.tbTWGznchG1xqfu
 3n5u1LLzXx688spQeOmWDJZQaqgSpBjjDK8urPTW0DAep4OPAekv8X.DBGv8jSn4bm.OZ5aaTB9q
 T7b8FxeUSkP4CW55zMdc.0c3aWFBQehGW12XY0qKjN9Ji4RPR_0K3XlZu5Fqp28tcTsDTUYQYmgF
 1KiqAtdAHGKwJ2w5ZODRSLagAgSAfxIJAXyEsa7RlSWB5W.8ax2n.872X.Rv2sfBkRp5Bv2EZaJ_
 d.YEmS4PdgVs2_fKX_VN80tULyiw0oRuSyxCmkx9J0MsGkfVMTbtWjzgMatRRVLXV5zC1uRbFrJv
 nZfgHtrb5uZOLNmQ3IqnFq2fhaC4cAViXxOdGREcUovd.gV_OUL4Hk0iy0ANdZ5kVhqGGay_xhLv
 CvNZvU3_QIlZOtKSM.7ZgOIyiTTUUM8e_lgnL4UDnLIDrMsUK5CdEUx9JtOzw4Z_GBxDSntHAsPA
 AYk3rOHIlDsTVHPCCm08U3JGuvb11B4yKL_uejpqX4jsfXHfGQGtzHuVhTUXin3p4wIfq7W6tTDZ
 5aRY90IPEVp3GwI7oD0VNexGIkxPDhulKOwx7Wu_WgRU.CJOuiGcGrd2Av5Zd
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 56921ec7-e220-416b-93a5-6714fb42e731
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ne1.yahoo.com with HTTP; Thu, 15 May 2025 19:51:49 +0000
Received: by hermes--production-gq1-74d64bb7d7-nccgl (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 3a0f0cf09f4326d3879ebd144ed3f975;
          Thu, 15 May 2025 19:41:37 +0000 (UTC)
Message-ID: <9351b5b9-ee06-464d-96d8-9fb5a9c94c82@schaufler-ca.com>
Date: Thu, 15 May 2025 12:41:36 -0700
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 29/29] lsm: add support for counting lsm_prop support
 among LSMs
To: Paul Moore <paul@paul-moore.com>
Cc: linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org,
 selinux@vger.kernel.org, John Johansen <john.johansen@canonical.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>,
 Fan Wu <wufan@kernel.org>, =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 Kees Cook <kees@kernel.org>, Micah Morton <mortonm@chromium.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Casey Schaufler <casey@schaufler-ca.com>
References: <20250409185019.238841-31-paul@paul-moore.com>
 <20250409185019.238841-60-paul@paul-moore.com>
 <81106a29-90ce-4439-9b4c-60bb2962fe04@schaufler-ca.com>
 <CAHC9VhRUr+sXhLzDSjiG9bEVbzZd2u632dLMVpcCe6By_d_H4w@mail.gmail.com>
 <3d884912-6225-485b-a7dd-2aa4073265f2@schaufler-ca.com>
 <CAHC9VhR5OFDvJNJLy9jKMsB4ZVx=phm6k6iebT6VuXD96kNEEA@mail.gmail.com>
 <c5b81e66-7e73-41cb-a626-9f18f6074e53@schaufler-ca.com>
 <CAHC9VhSiGc16g36gtZvWKYdtdx-3WG7HbWWhNXvPSBRfA7uphQ@mail.gmail.com>
 <5df7b895-888e-4aa0-a21f-0a8264158bfa@schaufler-ca.com>
 <CAHC9VhScu-AsvOAJ+4VoQB_QTmhuFGwVXmQF2PpgH+D-qLi7=w@mail.gmail.com>
Content-Language: en-US
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <CAHC9VhScu-AsvOAJ+4VoQB_QTmhuFGwVXmQF2PpgH+D-qLi7=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.23840 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 5/15/2025 11:13 AM, Paul Moore wrote:
> On Thu, May 15, 2025 at 10:12 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> On 5/14/2025 3:11 PM, Paul Moore wrote:
>>> On Wed, May 14, 2025 at 5:16 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>>>> On 5/14/2025 1:57 PM, Paul Moore wrote:
>>>>> On Wed, May 14, 2025 at 3:30 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>>>>>> On 5/13/2025 1:23 PM, Paul Moore wrote:
>>>>>>> On Tue, May 13, 2025 at 12:39 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>>>>>>>> On 4/9/2025 11:50 AM, Paul Moore wrote:
>>> ..
>>>
>>>>>> In my coming audit patch I changed where the counts of properties are
>>>>>> maintained from the LSM infrastructure to the audit subsystem, where they are
>>>>>> actually used. Instead of the LSM init code counting the property users, the
>>>>>> individual LSM init functions call an audit function that keeps track. BPF
>>>>>> could call that audit function if it loads a program that uses contexts. That
>>>>>> could happen after init, and the audit system would handle it properly.
>>>>>> Unloading the bpf program would be problematic. I honestly don't know whether
>>>>>> that's permitted.
>>>>> BPF programs can definitely go away, so that is something that would
>>>>> need to be accounted for in any solution.  My understanding is that
>>>>> once all references to a BPF program are gone, the BPF program is
>>>>> unloaded from the kernel.
>>>>>
>>>>> Perhaps the answer is that whenever the BPF LSM is enabled at boot,
>>>>> the audit subsystem always queries for subj/obj labels from the BPF
>>>>> LSM and instead of using the normal audit placeholder for missing
>>>>> values, "?", we simply don't log the BPF subj/obj fields.  I dislike
>>>>> the special case nature of the solution, but the reality is that the
>>>>> BPF is a bit "special" and we are going to need to have some special
>>>>> code to deal with it.
>>>> If BPF never calls audit_lsm_secctx() everything is fine, and the BPF
>>>> context(s) never result in an aux record. If BPF does call audit_lsm_secctx()
>>>> and there is another LSM that uses contexts you get the aux record, even
>>>> if the BPF program goes away. You will get an aux record with only one context.
>>>> This is not ideal, but provides the correct information. This all assumes that
>>>> BPF programs can call into the audit system, and that they deal with multiple
>>>> contexts within BPF. There could be a flag to audit_lsm_secctx() to delete the
>>>> entry, but that seems potentially dangerous.
>>> I think the answer to "can BPF programs call into the audit subsystem"
>>> is dependent on if they have the proper BPF kfuncs for the audit API.
>>> I don't recall seeing them post anything to the audit list about that,
>>> but it's also possible they did it without telling anyone (ala move
>>> fast, break things).  I don't think we would want to prevent BPF
>>> programs from calling into the normal audit API that other subsystems
>>> use, but we would need to look at that as it comes up.
>> I suggest that until the "BPF auditing doesn't work!!!" crisis hits
>> there's not a lot of point in going to heroic efforts to ensure all
>> the bases are covered. I'll move forward assuming that an LSM could
>> dynamically decide to call audit_lsm_secctx(), and that once it does
>> it will always show up in the aux record, even if that means subj_bpf=?
>> shows up every time.
> My only concern is that I suspect most/all of the major distro enable
> the BPF LSM by default which means that suddenly a lot of users/admins
> are going to start seeing the multi-subj/obj labeling scheme only to
> have an empty field logged.

That will only occur if a BPF program says it want to provide contexts
and then stops doing so, either by exiting or in error. As no BPF programs
currently use audit, it seems that this is at worst a future problem.
Should BPF programs develop the ability to use audit the behavior will need
to be documented. I don't see how we can anticipate what they'll end up
trying.


