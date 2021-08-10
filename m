Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A573D3DFC24
	for <lists+selinux@lfdr.de>; Wed,  4 Aug 2021 09:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235946AbhHDHgN (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 4 Aug 2021 03:36:13 -0400
Received: from agnus.defensec.nl ([80.100.19.56]:54444 "EHLO agnus.defensec.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235809AbhHDHgN (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 4 Aug 2021 03:36:13 -0400
Received: from brutus (brutus.lan [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id 64BAD2A008A;
        Wed,  4 Aug 2021 09:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl 64BAD2A008A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1628062559;
        bh=vACXs95eDeBF1DUeW+hQHZ5wWUO5X4oJYyRvYUIEzxA=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=FZnRyjdUzUWCrt+k/pz5Cngk/HSQCCm9Q7tluY3z31UBbWtYxlLTuWLC+sfbARSBm
         DeaIqWoU8BMxfFVHHx9QrP5zljJWum/woQ0Six2D6S3S+eaNKw5Urb3E/7AlSgcIHA
         jDzeMDBHzyCmVjiO1tq/2iQMZkz4laF/SsFZ0Fzo=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     James Carter <jwcart2@gmail.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Subject: Re: libsepol regressions
References: <871r7dtfbp.fsf@defensec.nl>
        <CAP+JOzQt1pxNMZuPK_dzdDHtshrrpEo1ynkFq7CaNpCG1n_JyA@mail.gmail.com>
Date:   Wed, 04 Aug 2021 09:35:56 +0200
In-Reply-To: <CAP+JOzQt1pxNMZuPK_dzdDHtshrrpEo1ynkFq7CaNpCG1n_JyA@mail.gmail.com>
        (James Carter's message of "Mon, 2 Aug 2021 10:50:19 -0400")
Message-ID: <878s1h7jc3.fsf@defensec.nl>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

James Carter <jwcart2@gmail.com> writes:

> On Sun, Aug 1, 2021 at 10:32 AM Dominick Grift
> <dominick.grift@defensec.nl> wrote:
>>
>>
>> Fedora recently decided to pull in various libsepol patches from
>> master[1]
>>
>> My policy has broken down in various way's. Some changes make sense but
>> some others I have issues with.
>>
>> An example of something I never expected to be allowed in the first
>> place is re-declarations of blocks and recent changes exposed some instances
>> where I declared blocks multiple times and got away with it.
>>
>> However I also encountered issues that i am not sure how to deal
>> with.
>>
>> re-declarations of macros are no longer allowed:
>>
>
> Re-declarations were never supposed to be allowed (other than the
> declaration of types and typeattributes when using the -m flag), but
> there were not sufficient checks being done when copying the CIL AST
> when expanding macro calls, resolving the inheritance of blocks, and
> things like that.
>
> The result was behavior that depends on the rule order and one of the
> principles of CIL is that there would be no rule order dependencies.
>
>> Take this example:
>> https://github.com/DefenSec/dssp5/blob/dev/src/dev/termdev.cil
>>
>> Here I inherit a set of macros from the
>> "file.all_macro_template_chr_files" template and then I override some of these
>> macros by manually re-declaring them with slighty different content (the
>> xperm rules are appended).
>>
>> This use to be allowed but I am no longer allowed to redeclare macros.
>>
>
> I can see that this might be useful behavior.
>
>> This would not necessarily be a big problem IF this would instead work:
>>
>> diff --git a/src/dev/termdev.cil b/src/dev/termdev.cil
>> index 1c0fe66..4f067db 100644
>> --- a/src/dev/termdev.cil
>> +++ b/src/dev/termdev.cil
>> @@ -3,21 +3,9 @@
>>
>>  (block termdev
>>
>> -       (macro appendinherited_all_chr_files ((type ARG1))
>> -             (allow ARG1 typeattr appendinherited_chr_file)
>> -             (allowx ARG1 typeattr (ioctl chr_file (not (0x5412)))))
>> -
>> -       (macro readwriteinherited_all_chr_files ((type ARG1))
>> -             (allow ARG1 typeattr readwriteinherited_chr_file)
>> -             (allowx ARG1 typeattr (ioctl chr_file (not (0x5412)))))
>> -
>>         (macro type ((type ARG1))
>>               (typeattributeset typeattr ARG1))
>>
>> -       (macro writeinherited_all_chr_files ((type ARG1))
>> -             (allow ARG1 typeattr writeinherited_chr_file)
>> -             (allowx ARG1 typeattr (ioctl chr_file (not (0x5412)))))
>> -
>>         (typeattribute typeattr)
>>
>>         (blockinherit .file.all_macro_template_chr_files)
>> @@ -33,3 +21,12 @@
>>
>>               (allow typeattr termdev.typeatt
>>                      (chr_file (not (execmod mounton))))))
>> +
>> +(in termdev.appendinherited_all_chr_files
>> +    (allowx ARG1 typeattr (ioctl chr_file (not (0x5412)))))
>> +
>> +(in termdev.readwriteinherited_all_chr_files
>> +    (allowx ARG1 typeattr (ioctl chr_file (not (0x5412)))))
>> +
>> +(in termdev.writeinherited_all_chr_files
>> +    (allowx ARG1 typeattr (ioctl chr_file (not (0x5412)))))
>>
>> But the above in-statements cannot be resolved.
>>
>
> I think that overriding the macros would make more sense, but I'll
> have to think about it.
>
> It would be a pain, but you could do something like:
> (block B1
>   (macro M1 (...)
>     ...
>   )
>   (macro M2 (...)
>     ...
>   )
> )
>
> (block B2
>   (block parent
>     (blockinherit B1)
>   )
>   (macro M1 (...)
>     (call parent.M1 (...))
>     ...
>   )
>   (macro M2 (...)
>     (call parent.MA (...))
>     ...
>   )
> )
>
>> This is not the only instance where this approach does not work. I also
>> have templates that declare blocks. I use to be allowed to re-declare
>> these blocks so that I could add to them but this is no longer
>> allowed. However these blocks also cannot be resolved outside of the
>> templates, so I cannot use "in" to reference them.
>>
>> It seems as if the "in" blocks are resolved before the "blockinherit"
>> blocks are expanded.
>>
>
> It is true that in-statements are resolved before inheritance, so what
> you have above would not work.
>
> If you are just adding rules and not declarations, then you don't have
> to put the rules in the block.
> Example:
> (block B1
>   (block B
>     (type t)
>    )
> )
> (block B2
>   (blockinherit B1)
>   (allow B.t self (CLASS (PERM)))
> )

Ive been trying to translate this to a actual use-case in my policy to
see if that would suffice.

I have these high level "content" templates that basically allow you to
inherit a whole skeleton without filecon's because a skeleton can be
generic but filecon's are specific so they have to be added later.

(block skel
  (type type)
  (allow ...)
  (block conf
  (type type)
  (allow ...))
  (block exec
  (type type)
  (allow ,,,))
  etc...)

These skeletons can then be inherited and the filecons (and custom rules)
can be added later:

(block myapp
  (blockinherit skel)
  (allow ...))

With 3.2 I was able to mimic in-statements by re-declaring the
blocks so that I would be able to insert the filecons (and custom rules)
later:

(block myapp
  (blockinherit shel)
  (allow ...)
  (block conf
    (filecon "/etc/myapp" file file_context))
  (block exec
    (filecon "/bin/myapp" file file_context)))

If in-statements would be resolved after inheritance then I could do:

(block myapp
  (blockiherit skel)
  (allow ...))

(in myapp.conf
  (filecon "/etc/myapp" file file_context))

(in myapp.exec
  (filecon "/bin/myapp" file file_context))

Your suggestion would be suffice if I would use raw filecons instead of
context:

(block myapp
  (blockinherit skel)
  (allow ...)
  (filecon "/etc/myapp" file (sys.id sys.role myapp.conf.type
  ((s0)(s0))))
  (filecon "/bin/myapp" file (sys.id sys.role myapp.exec.type
  ((s0)(s0)))))

But then that would be yet another inconsistency that would be hard to explain:
Can only use file_context keyword in filecon if you don't use
inheritance.

Not to mention macro's. If there is one thing I dislike then its having to
duplicate macros everywhere. I like to template macros from the ground
up to reduce points of failure and to encourage consistency. This
implies inheritance as well.

I try not to use high level abstractions like these myself, but the idea
is that users of my policy are able to create/script higher level abstractions
on top of my policy. So that they can for example create policy
generation scripts using higher level templates.

This is why consistency matters to me. I can get used to buts-and-ifs but can
the end-user of my policy do that as well?

Eventually I envision something like:

;; generic high level base template used in a script created by end-users
(block myapp
  (blockinherit skel))

;; custom stuff added by the script based on script input
(in myapp
  (allow type self (class (perm))))

(in myapp.conf
  (filecon "/etc/myapp" file file_context)
  (call .tmp.associate (type))

(in myapp.exec
  (filecon "/bin/myapp" file file_context))

(in user
  (call .myapp.run (type)))

>
> It might be possible to attempt to resolve all in-statements before
> inheritance as what currently happens and then try to resolve any
> remaining in-statements after inheritance has been resolved.
>
> I'll have to think about the problem a bit.
>
> Thanks for the questions,
> Jim
>
>
>
> The problem
>> [1] https://src.fedoraproject.org/rpms/libsepol/c/c59879b8aa30ceb601ac4e449ee5e958c6659fbc?branch=rawhide
>>
>> --
>> gpg --locate-keys dominick.grift@defensec.nl
>> Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
>> https://sks-keyservers.net/pks/lookup?op=get&search=0xDA7E521F10F64098
>> Dominick Grift

-- 
gpg --locate-keys dominick.grift@defensec.nl
Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
https://sks-keyservers.net/pks/lookup?op=get&search=0xDA7E521F10F64098
Dominick Grift
