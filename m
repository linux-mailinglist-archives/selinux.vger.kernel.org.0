Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49FCF15ABE1
	for <lists+selinux@lfdr.de>; Wed, 12 Feb 2020 16:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbgBLPUv (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 12 Feb 2020 10:20:51 -0500
Received: from UPDC19PA20.eemsg.mail.mil ([214.24.27.195]:42328 "EHLO
        UPDC19PA20.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727531AbgBLPUu (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 12 Feb 2020 10:20:50 -0500
X-EEMSG-check-017: 58317607|UPDC19PA20_ESA_OUT02.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.70,433,1574121600"; 
   d="scan'208";a="58317607"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
  by UPDC19PA20.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 12 Feb 2020 15:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1581520846; x=1613056846;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=M+2ZwZzCGkluLLIFXEvzEIZch7Gzgw+4hXn4mhq1rLA=;
  b=dhgO/3j8hcNuoqTftZMP5vQvpRxxqUL+32/Pqxfh2VresNTJ29sfd7Tg
   YvjEVoXzFuQegFsCnFnLpX2UYSDv7vjGfo1V2339cBotM1PLhWRd+bojw
   +uXPJYW6qI3ofnSKT1+yi4gPvmF+FIw3/Q6xZW4q9TturM48QajgVX0OC
   X5UOAKQSpdb/JWBXuZ9z6d18RI9UbmNX+CSIs5NvQco30tIrsqgAGN3hq
   xwzapDILcDHMxj9mLirx7yEIWok9PP4bbxbPqFOXDEpdfSdae3dkg96ZB
   QowIBFJ2jw9W2F4jbpKZOgy7Sx+UU4OKCtgjvONyTSJntNm3ysTWrEt8G
   A==;
X-IronPort-AV: E=Sophos;i="5.70,433,1574121600"; 
   d="scan'208";a="32974141"
IronPort-PHdr: =?us-ascii?q?9a23=3ADrzsiRN+OeIPapsRSfUl6mtUPXoX/o7sNwtQ0K?=
 =?us-ascii?q?IMzox0Kf37r8bcNUDSrc9gkEXOFd2Cra4d16yI7uu/BCQp2tWojjMrSNR0TR?=
 =?us-ascii?q?gLiMEbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ?=
 =?us-ascii?q?/iOgVrO+/7BpDdj9it1+C15pbffxhEiCCybL9vIxi6twTcu8kZjYZgKqs61w?=
 =?us-ascii?q?fErGZPd+lKymxkIk6ekQzh7cmq5p5j9CpQu/Ml98FeVKjxYro1Q79FAjk4Km?=
 =?us-ascii?q?45/MLkuwXNQguJ/XscT34ZkgFUDAjf7RH1RYn+vy3nvedgwiaaPMn2TbcpWT?=
 =?us-ascii?q?S+6qpgVRHlhDsbOzM/7WrakdJ7gr5Frx29phx/24/Ub5+TNPpiZaPWYNcWSX?=
 =?us-ascii?q?NcUspNSyBNB4WxYIUVD+oFIO1WsY/zqVUTphe6HAWhCufixjpOi3Tr36M1zv?=
 =?us-ascii?q?4hHBnb0gI+EdIAsHfaotv7O6gdU++60KbGwC7fb/5Vwzrx9JTEfx4jrPyKQL?=
 =?us-ascii?q?l+cdDRyU4qFw7dk1uQtZLqPyuV1usTtWiQ8vduVee1hG4jrwF+vDiuzdorh4?=
 =?us-ascii?q?nSm40V0UvJ9Tl5wYkpJd24T1R3Ydi/EJRKrS2aOIx2Qt07TmxupS00yaUGtI?=
 =?us-ascii?q?amcCUFx5kr3R7SZ+Gdf4SW7R/vSvydLSp+iXl4YrywnQyy/lKlyuDkU8m010?=
 =?us-ascii?q?tFoTRdn9nXs3ANywTT6s+aSvth5kuh2SiA1wTU6uxcPUA7j7DbK588wr4rjJ?=
 =?us-ascii?q?YTsELDHiHxmEXtkqCZal8o+vSo6uv7YrXmoYWQN4lohQHlLqsigMm/AeU8Mg?=
 =?us-ascii?q?QWXmib//qz1KH78EHkT7hHgec6n6nEvJzAO8gWqbC1DxVI3oo77hawFTam0N?=
 =?us-ascii?q?AWnXkdK1JFfQqKj5P0NFHVO/34Efe+jEiskDds3fzGOKbhDY/XInjMl7fhY6?=
 =?us-ascii?q?5x61RAxwor0dBf+5VUB6kbL/L3REDwu8LXDx8jPwOv3uboFc9y1oUdWWKIHK?=
 =?us-ascii?q?+UK6fSsV6O5uIyLOiAfo4VuDDhK/c74/7il2M2mVgYfaOxx5sYdGi4Huh6I0?=
 =?us-ascii?q?WeeXfjmNMBHnkFvwUgTezmkkaCUSJJaHaoWKI8+DY7CIO6DYfEWICgm7OB3C?=
 =?us-ascii?q?KhEZ1XYmBKEEyDEXDtd4+cQfcDdDqSItN9kjwDTbWhU5Eu1Q2wuw/gyrtqNe?=
 =?us-ascii?q?vU+isWtZL5ztd6+vPcmgsv+jBuCMSdyW6NRXlunmwUXz82wLx/oUtlx1iZza?=
 =?us-ascii?q?d4huJXGMdQ5/xXSAc6M4DTz+hgB9D1QALBcc+DSEy6TdW+HTExUtUxzscLY0?=
 =?us-ascii?q?Z8HdWigRfD0jGwA7ALirOLBIY78r7G03ftIMZ9zm7M1LM9gFk+XstPKWqmi7?=
 =?us-ascii?q?Z99wfJAY7Jkl+Vl6CrdaQfwS7N8H2MwHGKvEFZVg5wTKrEUWoeZkvQsdT2+E?=
 =?us-ascii?q?fCQ6WyBrQgNwtL0dSCJbdSat31kVVGQ+/uONbZY2K2nWe/Hw2IyqmIbIXwe2?=
 =?us-ascii?q?UdwCTdCE4anAAV5nuGMQk+BiG8o2PRFjBuFFTvY1/y/ul6sn+0Ukg0zwSSZU?=
 =?us-ascii?q?17y7W14gIVheCbS/4LxLIEvzouqy91HFay2NLaEcSApwt/fKVdet494VFH1X?=
 =?us-ascii?q?7HuAx5JJCvM6dihlsGeQRto0zuzwl3CplHkcUyt3wl0gxyKaKD3VNCaTyYx5?=
 =?us-ascii?q?bwNaPTKmXo4B+vcbTZ2kre0NaX/KcP5+40q1L5vAGmDkAi6Wlo08FJ03uA4Z?=
 =?us-ascii?q?XHFBISXojsUkYz6hh6vKrXYjIn6IPRznJjK7O4sjjY29ImHOEl0Aqvf89DMK?=
 =?us-ascii?q?OYEw//C8gaB9CwJ+ExhVepahYEM/5I9K4xJcymceGK2K+2M+p6hj2mkHxN4J?=
 =?us-ascii?q?ph3UKU6yp8VunI0o4Hw/6C2wuISSz8gE26vcDwhYBEeTYSHm+7ySf6BI9cfa?=
 =?us-ascii?q?1ycpwNCWe1PcK3wM1+iIT3W35E8l6sGUkG2NSpeRqTd1zxxxFf1UMSoXa/gy?=
 =?us-ascii?q?u30yR0ky01rqqYxCHO2PrtdAAIOmFVX2RijU3jIYywj9EaWkikdRQmlByg5U?=
 =?us-ascii?q?zi3ahUuLx/L3XPQUdPZyX2LWRiUqyqtrqYYs5P84glsSNNX+S5f1+aS6Txox?=
 =?us-ascii?q?wA0yPsB2Fe3iw0dym2upXlmBx3kGycLHd3rHrdY81/2AnQ68bASv5W2DoLXz?=
 =?us-ascii?q?N3iSPSBlSmI9ap+tCUnY/Zsu+iT2KhSoFTcS7zwIOFriS7/25qDQeln/Cuht?=
 =?us-ascii?q?3nFRI10Snm2NRxTyrIthP8bpP32KS9NOJtZlNoC0Pk68pmBoF+lZM9hIsK2X?=
 =?us-ascii?q?gbmpqY5nkHnnnpMdVdx63+aGABRTkRw97a+ALlwlFsLmqVx4LlUXWQ2tFuZ8?=
 =?us-ascii?q?KmYm4N2SIy8dpKCKGK47xAhyd1pUC4rQ3Ja/hngjgd0ecu6GIdg+wRugotyS?=
 =?us-ascii?q?GdAqsIEkRDJyzjiQmH79Cko6VLfmqgbb+w1E9ml9C7EL6Cuh1cWGr+epo6By?=
 =?us-ascii?q?Bw7d5yMFbN0H3194Hld8PcbdMVth2IjRjAi/JZJ442lvoPnSBnI37yvWU5y+?=
 =?us-ascii?q?4nihxjxY+1vJKdJGVr/aK2GBhYOyb6Z8MU/THtgqJekdiM04+zGZVhHy0BXI?=
 =?us-ascii?q?H0QvKwDDISqfPnOh6PED04t3eUAqDQHRSf6Eh4tH/ACZOrOGuSJHYDzNVuXg?=
 =?us-ascii?q?WSJEtagAoMRjU1goY5Fhy2xMzmaEp2/DQR6UD3qxRWzOJnKgfwUn3FqAezaj?=
 =?us-ascii?q?c0SYOfLBpV7gFD4UfYKsie7uN1HyFF8Zyttg2NKmqHZwtWCWEFQFCLB1fmPr?=
 =?us-ascii?q?O2/9nP7/CYBvaiL/vJebiOr/ZRV/KIxZOvz4tm+TmMO96MPnZ8Ff073FRMXX?=
 =?us-ascii?q?RjF8TegTUPRDQdlzjRYM6DuBe85ip3o9ik8PTsXgLv6o+PC7pPMdp04RC5m7?=
 =?us-ascii?q?mDN++WhCZ2MjtY2IgDyWXUx7gY2V4YkztueCW1EbQcqS7NS7rdmqtWDx4cbS?=
 =?us-ascii?q?N8Ks9I47gz3gVXPc7UkNX12aN2j/ErEVdFUV3hmseyaMwLJWG9KE3IBEKROL?=
 =?us-ascii?q?uaIj3Lxtn9YbmgRr1IkOVUqxqwtC6HE0/sOjSCmCLkVxSuMeFKkSGbIAZeuI?=
 =?us-ascii?q?a7chZsBmnvVs/pZQOjOt9tkTI22aE0hm/NNWMENTh8ckVNrqCf7C9BgfVwBX?=
 =?us-ascii?q?ZB7nx7IumAgCuZ8ebYJYgMsfdxASR7ifha4HIkxLtR9i1EQ+Z1mCTKpN50v1?=
 =?us-ascii?q?6mivWPyiZgUBdWrjZLhYSLvVhtOKnA7ZlPR2rL/A8X7WWRFxQLp8JpCtjou6?=
 =?us-ascii?q?9N19jPkLz8JSxc89Lb48QcHdLYKMGZP3o7NxrmBjrUABECTT6xOmHVn1Zdn+?=
 =?us-ascii?q?2K9n2Jspg6rYDhmIEQRb9fVVw1EO4aC0t+EdwcL5d4QCkknaSYjMEW/3q+qg?=
 =?us-ascii?q?feRMFAspDATPKSDu3lKCyFgrlcexsI3bT4IJwSNo39x0xtdF16kJ3FG0reUt?=
 =?us-ascii?q?FAuSlhbg4voEVR63hyVGMz21j7ZQyz/XAcC+W0nh0qigt5eeQh7jDs4004Jl?=
 =?us-ascii?q?DSvis/jFExmcn5gTCWaDPxKKawXYdLCyv7rkQxKon0Qxx0bQ2pgUNpLynER7?=
 =?us-ascii?q?1PgLt6b2xrixHTuYFJGfFCSa1IehgQxeuYZ/8wy1RTtj2nxVNb5evCEZZikA?=
 =?us-ascii?q?oqcZixr3NPwwJjdMI6KbXNK6VX0FhdnaaOvi6z1uAt2w8SPUEN8WKWeCESo0?=
 =?us-ascii?q?MILaMqJy2y/uxj8QaCgSdMeHAQV/o2pfJn7kc9O+WGzyL93L9PM1q+N/aaL6?=
 =?us-ascii?q?+AuGjPi9SIQlUu2UMMjERF+bl20dw/c0qPTUwvzb2RFxoTNcXYNA5acdBd+2?=
 =?us-ascii?q?XJcSaJq+XNzop/P5+hGeDwUe+OqKEUj1qgHAYoGYQM88sAEoC00E7GN8fnIq?=
 =?us-ascii?q?cJyQg25Av1PlWFF+9EeAyEkDgZucGz1px30pdHJjEbH2p9NT+75rHNpg8lmP?=
 =?us-ascii?q?CDRss5Ym8GXosYMXI7QMq6mzZDv3RHAjm30+YZxxab4z/4pyTQFyX8YsFnZP?=
 =?us-ascii?q?eVfhNsFMq29S8k86i4k1LX9IvRJ33iP9R4ptDP8f8ap4qAC/5MSbl9rlvcm4?=
 =?us-ascii?q?5DSnOwVm7AC8K6KILoa4ktcdz7EHK6Xka5iz0rU8eidOqqe4GMjBHlVM5+rY?=
 =?us-ascii?q?WS2jMkK4fpHzUTCxph4ese6Kt6ZgodS546ZwP48QU4K6G7Zgyf14P9bXyqLG?=
 =?us-ascii?q?5tU/RHzei8L4dSxi4oY/7ynGAsVbkm3uK39ggLX5hMgRbAk6XwL7JCWDT+Ty?=
 =?us-ascii?q?QOMz7EojA0wi04bbc/?=
X-IPAS-Result: =?us-ascii?q?A2DJAwCLFkRe/wHyM5BlHQEBAQkBEQUFAYF7gX2BbAEgE?=
 =?us-ascii?q?iqEFIkDhmQBAQEBAQEGgRIliXCRSQkBAQEBAQEBAQE3AQGEQAKCbTgTAhABA?=
 =?us-ascii?q?QEEAQEBAQEFAwEBbIVDgjspAYMCAQUdBgQLAQVBEAkCGAICJgICVwYNBgIBA?=
 =?us-ascii?q?YJjP4JXJY99m3l/M4VKg0iBPoEOKow+eYEHgREnDAOCXT6HW4JeBI1Ngk+Hb?=
 =?us-ascii?q?3yWb4JEgk6KRok1BhyCSIgSkDstq3QigVgrCAIYCCEPgydQGA2OKRcVjiwjA?=
 =?us-ascii?q?zACkV8BAQ?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil) ([144.51.242.1])
  by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 12 Feb 2020 15:20:42 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id 01CFJLvn070940;
        Wed, 12 Feb 2020 10:19:23 -0500
Subject: Re: [PATCH v5 01/10] capabilities: introduce CAP_PERFMON to kernel
 and user space
To:     Alexey Budankov <alexey.budankov@linux.intel.com>
Cc:     Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
        "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
        "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
        "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "james.bottomley@hansenpartnership.com" 
        <james.bottomley@hansenpartnership.com>,
        Serge Hallyn <serge@hallyn.com>,
        James Morris <jmorris@namei.org>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robert Richter <rric@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jiri Olsa <jolsa@redhat.com>, Andi Kleen <ak@linux.intel.com>,
        Stephane Eranian <eranian@google.com>,
        Igor Lubashev <ilubashe@akamai.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Song Liu <songliubraving@fb.com>,
        Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
        oprofile-list@lists.sf.net, Andy Lutomirski <luto@amacapital.net>
References: <0548c832-7f4b-dc4c-8883-3f2b6d351a08@linux.intel.com>
 <9b77124b-675d-5ac7-3741-edec575bd425@linux.intel.com>
 <64cab472-806e-38c4-fb26-0ffbee485367@tycho.nsa.gov>
 <05297eff-8e14-ccdf-55a4-870c64516de8@linux.intel.com>
 <CAADnVQK-JzK-GUk4KOozn4c1xr=7TiCpB9Fi0QDC9nE6iVn8iQ@mail.gmail.com>
 <537bdb28-c9e4-f44f-d665-25250065a6bb@linux.intel.com>
 <63d9700f-231d-7973-5307-3e56a48c54cb@linux.intel.com>
 <d7213569-9578-7201-6106-f5ebc95bd6be@tycho.nsa.gov>
 <2e38c33d-f085-1320-8cc2-45f74b6ad86d@linux.intel.com>
 <dd6a1382-7b2f-a6e6-a1ac-009566d7f556@tycho.nsa.gov>
 <8141da2e-49cf-c02d-69e9-8a7cbdc91431@linux.intel.com>
From:   Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <7c367905-e8c9-7665-d923-c850e05c757a@tycho.nsa.gov>
Date:   Wed, 12 Feb 2020 10:21:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8141da2e-49cf-c02d-69e9-8a7cbdc91431@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 2/12/20 8:53 AM, Alexey Budankov wrote:
> On 12.02.2020 16:32, Stephen Smalley wrote:
>> On 2/12/20 3:53 AM, Alexey Budankov wrote:
>>> Hi Stephen,
>>>
>>> On 22.01.2020 17:07, Stephen Smalley wrote:
>>>> On 1/22/20 5:45 AM, Alexey Budankov wrote:
>>>>>
>>>>> On 21.01.2020 21:27, Alexey Budankov wrote:
>>>>>>
>>>>>> On 21.01.2020 20:55, Alexei Starovoitov wrote:
>>>>>>> On Tue, Jan 21, 2020 at 9:31 AM Alexey Budankov
>>>>>>> <alexey.budankov@linux.intel.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 21.01.2020 17:43, Stephen Smalley wrote:
>>>>>>>>> On 1/20/20 6:23 AM, Alexey Budankov wrote:
>>>>>>>>>>
>>> <SNIP>
>>>>>>>>>> Introduce CAP_PERFMON capability designed to secure system performance
>>>>>>>>>
>>>>>>>>> Why _noaudit()?  Normally only used when a permission failure is non-fatal to the operation.  Otherwise, we want the audit message.
>>>>>
>>>>> So far so good, I suggest using the simplest version for v6:
>>>>>
>>>>> static inline bool perfmon_capable(void)
>>>>> {
>>>>>       return capable(CAP_PERFMON) || capable(CAP_SYS_ADMIN);
>>>>> }
>>>>>
>>>>> It keeps the implementation simple and readable. The implementation is more
>>>>> performant in the sense of calling the API - one capable() call for CAP_PERFMON
>>>>> privileged process.
>>>>>
>>>>> Yes, it bloats audit log for CAP_SYS_ADMIN privileged and unprivileged processes,
>>>>> but this bloating also advertises and leverages using more secure CAP_PERFMON
>>>>> based approach to use perf_event_open system call.
>>>>
>>>> I can live with that.  We just need to document that when you see both a CAP_PERFMON and a CAP_SYS_ADMIN audit message for a process, try only allowing CAP_PERFMON first and see if that resolves the issue.  We have a similar issue with CAP_DAC_READ_SEARCH versus CAP_DAC_OVERRIDE.
>>>
>>> I am trying to reproduce this double logging with CAP_PERFMON.
>>> I am using the refpolicy version with enabled perf_event tclass [1], in permissive mode.
>>> When running perf stat -a I am observing this AVC audit messages:
>>>
>>> type=AVC msg=audit(1581496695.666:8691): avc:  denied  { open } for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>> type=AVC msg=audit(1581496695.666:8691): avc:  denied  { kernel } for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>> type=AVC msg=audit(1581496695.666:8691): avc:  denied  { cpu } for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>> type=AVC msg=audit(1581496695.666:8692): avc:  denied  { write } for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>
>>> However there is no capability related messages around. I suppose my refpolicy should
>>> be modified somehow to observe capability related AVCs.
>>>
>>> Could you please comment or clarify on how to enable caps related AVCs in order
>>> to test the concerned logging.
>>
>> The new perfmon permission has to be defined in your policy; you'll have a message in dmesg about "Permission perfmon in class capability2 not defined in policy.".  You can either add it to the common cap2 definition in refpolicy/policy/flask/access_vectors and rebuild your policy or extract your base module as CIL, add it there, and insert the updated module.
> 
> Yes, I already have it like this:
> common cap2
> {
> <------>mac_override<--># unused by SELinux
> <------>mac_admin
> <------>syslog
> <------>wake_alarm
> <------>block_suspend
> <------>audit_read
> <------>perfmon
> }
> 
> dmesg stopped reporting perfmon as not defined but audit.log still doesn't report CAP_PERFMON denials.
> BTW, audit even doesn't report CAP_SYS_ADMIN denials, however perfmon_capable() does check for it.

Some denials may be silenced by dontaudit rules; semodule -DB will strip 
those and semodule -B will restore them.  Other possibility is that the 
process doesn't have CAP_PERFMON in its effective set and therefore 
never reaches SELinux at all; denied first by the capability module.



