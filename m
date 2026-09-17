Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5C83CCFD4
	for <spacemit@lists.linux.dev>; Thu, 17 Sep 2026 19:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672742; cv=none; b=faBKfjkq9RxwYqQN139eDzEy2DgyNcxipF6+0ud51YjtT2JpwLYqreFKHOEb0lnCryGvZRkwmH8Gf7wuGcW3wD8ABWIUd+6t0EART+uq1j5X13tnXYezJqIH9E4dfmIVZOCtUuXbxuWZ520L781/Bab0ksgl3rn9ziIJTlqlfOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672742; c=relaxed/simple;
	bh=DYVL8oxPYnwX4Rj8LhVDhUxTdgiBy1ZxKVToj+a4v6A=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=ZYPBjaq5d03QXpZZ97rWk0vnvlfBa2lSMy/gcVK9Dd+Yj/duDOpiCnElwxs0Gn6kBlI3XEYgWZPGuMOo6mVr0JR4sWeA/8w9J5p5+whqvf1GPCVYOH7UJq+afT0UaGTubWBz2cB5Aw6G42jzxInpVCdFp9WtJ6ZvnzKjeCjdvi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20251104.gappssmtp.com header.i=@dabbelt-com.20251104.gappssmtp.com header.b=hxejQkMV; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20251104.gappssmtp.com header.i=@dabbelt-com.20251104.gappssmtp.com header.b="hxejQkMV"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8692a8568e9so17607b3a.3
        for <spacemit@lists.linux.dev>; Thu, 17 Sep 2026 12:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20251104.gappssmtp.com; s=20251104; t=1789672740; x=1790277540; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JTpcF4933AuqjrXkic6TMoFwsxDS4r0Nwe4Mg2qA+JE=;
        b=hxejQkMVkii8XvMHDPr/u9N3DSGX8jeHmZt9hXD30IDqaqyEU0Wd6E9HfPLwkaWMt/
         zjPk3PtrARRtrof2ZQCpNaVgOnSePaPEESYbZTdQO6OQGD2R9YJo7xx6Xz+jsaIIW/BN
         MJvgWN4j7iDbEKTvGdbT/6QstP/vIxyI+LgnQUCKwmnLA4sAuTI/44GowlKRLap/F9yz
         LxU5SYyVwKDvEw2YvzSicdj771Mq+Qp/RJ83/wBTBDMrmW5/DF+NAJcPQB92+hwubEHC
         it5Fm5pUz/ZSuFqogM9Zq3nnJJmCOc21cymKUj46UQaHW4fPAo0KrHKjTDvrePClhTcj
         3utQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672740; x=1790277540;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JTpcF4933AuqjrXkic6TMoFwsxDS4r0Nwe4Mg2qA+JE=;
        b=drxchS/uBAuU/P6VXuUQ8uK4tTlPproZWVNPo8Ei+9MFQfn35cpZfiKwlPbXCut+ht
         tDD6cNNDJt5blD4jkiMHCARaJvbDdo9oXC1XXCelp3+twQu8UY+baSr/4XYxeDFFOw0M
         DiIdk4YQk//mTjxykmlLgyGlRHBWMvcLxyezsGQ5ajZDfnU7M+mkzirr/STTsdpj3Ukg
         jU01h3wDt8MPLe8ishP12CES+g5rmTlRytib9ynUCSn1+luTRzdz5HI9bnDoHuTcAeug
         eFmQPjOXjXCKznxmM4hMmBHvKewo4LLz8MHHIKfImRiaYo8nbrKs58R/IgDHvb5quKSW
         tSAw==
X-Gm-Message-State: AFuF++mMa9/abybj8oMH0MHznFp0oi59Bi7DUPbk5rOZNY8JlGCDzbaq
	vrCXFWGW1PRGRKQePPi+HkfelFfFFdC8QGIUnWlGF2fQPgL5g/RdlXDNUxKJVnFQ2l8V4TFA/ZV
	RSzip
X-Gm-Gg: AYBFou0atWHsGHBcRylOcvOljOB+5tpThHSQWqyxJ9XXyoButGne8MIVa31ESSbPYo7
	TwGD6UV9BOsQaY6ph9bvj8Drw3uLtCTl39Vj5f/qBwp44B3ayjcIttmzNSk6tjn1yHPcuX+uSCC
	VT/oVNRnv8M85CSH39Sxl5cMBwMZynZ6nUsG/nVtxMvXXiAt87XYU71WWqfQvD9mSOv+dOoo03Z
	8qSa5VdT+UcxdCgNOdt9ZhW9jtMdy92/qu2XTGnzZuGrTvst9J7pAcPI+VWbB7OFdH8gY6/fMVQ
	rn8smbixp6YhLp1jdymNMQLxA8sIUhltlSAZt6vCDh2IKb5qdO7pHVjvoYPUA7mSk1fThXXDK0L
	8YEu8Y74kiHn+32i8NXpYVexJgMHvbYxpIDJeaC2FC56SaBcE6Vpifx0yp3QA/A68MvfzQ39wcl
	r1hDnOltNm7Zbk8k9zypDsrmA3HppVKfx73pKdSqhuIeA7xEY/Xx5Um+mSqe7K6jkADvgdoVrue
	NWgICIQ5aSAT/cwU3gxEYLrB6HZkQ==
X-Received: by 2002:a05:6a20:4327:b0:3d3:ae40:51e6 with SMTP id adf61e73a8af0-3dd5f78606dmr17656746637.26.1789672739753;
        Thu, 17 Sep 2026 12:18:59 -0700 (PDT)
Received: from localhost ([2001:5a8:4687:d600:a432:5959:dbd9:36fd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b0520asm17913779eec.27.2026.09.17.12.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:18:59 -0700 (PDT)
Date: Thu, 17 Sep 2026 12:18:59 -0700 (PDT)
X-Google-Original-Date: Thu, 17 Sep 2026 12:18:57 PDT (-0700)
Subject:     Re: Random corruption on SpacemiT K1 (and K3) with RVV
In-Reply-To: <aqm1Ik5202PyscK3@aurel32.net>
CC: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, tchiu@tenstorrent.com,
  kmehltretter@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: aurelien@aurel32.net
Message-ID: <mhng-6CE84C42-173E-4FAB-B163-A2AF2DC3D084@Palmers-Mini.rwc.dabbelt.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 15 Sep 2026 14:14:10 PDT (-0700), aurelien@aurel32.net wrote:
> Hi,
>
> Some more update, even if the progress is quite low.

Well, thanks for digging into this.

>
> On 2026-09-09 18:45, Aurelien Jarno wrote:
>> [Added Andy and Karl in Cc: as they have been involved in the vectored 
>> user copy code and fighting similar issues]
>> 
>> Hi,
>> 
>> Some more progress on that topic.
>> 
>> On 2026-09-08 06:42, Aurelien Jarno wrote:
>> > Dear all,
>> > 
>> > I have done some small progress on that issue. Help is still wanted and 
>> > would be appreciated.
>> > 
>> > On 2026-08-30 22:52, Aurelien Jarno wrote:
>> > > Dear all,
>> > > 
>> > > For the last weeks, I have been tracking a random memory corruption and
>> > > relatively rare on SpacemiT K1 (Banana Pi F3 and Milk-V Jupiter). It 
>> > > started upgrading to glibc 2.43, which does memset() through vector 
>> > > instructions.  It is reproducible using the Debian 7.1.7-1~bpo13+1 
>> > > kernel, but I have also been able to reproduce it with a vanilla 7.2.2 
>> > > kernel, using a similar configuration to the Debian kernel. The board 
>> > > uses OpenSBI 1.9 and the vendor U-Boot.
>
> I have been able to also reproduce the issue with the vendor OpenSBI. It 
> is also reproducible with linux 7.2.6.
>
>> > I have been able to rule out OpenSBI from the issue, I have checked 
>> > there is not trap to OpenSBI when the problem happens.
>> > 
>> > > Typically it manifests itself with the following kind of error, when 
>> > > running g++ from GCC 16 as part of building software (e.g. OpenJDK, 
>> > > Blender, Dolfin, Qt6):   
>> > > 
>> > > Assembler messages:
>> > > {standard input}:284588: Error: unknown pseudo-op: `.uleb1'
>> > > {standard input}:284588: Error: unrecognized opcode `ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿvl874'
>> > > 
>> > > The broken chars are 0xff and it seems there are always 240 (but with 
>> > > poor statistics). Sometimes it instead causes a GCC ICE instead.
>> > 
>> > I have identified that the 0xff comes from the poisoning done for v0 in
>> > __riscv_v_vstate_discard(), which should only happen for a syscall. 
>> > Indeed changing the value to different ones propagates to the above 
>> > error message.
>> > 
>> > Furthermore I have found that changing CONFIG_RISCV_ISA_V_PREEMPTIVE 
>> > doesn't change anything, and that changing RISCV_ISA_V_UCOPY_THRESHOLD 
>> > changes the number of broken bytes.
>> 
>> The values from __riscv_v_vstate_discard() end-up there because they are 
>> the last values written to the vector registers. I have added some 
>> poisoning in __asm_vector_usercopy_sum_enabled before the loop, and 
>> those values appear instead. Using different values per vector register, 
>> I have found that the corruption comes from a partial load of the vle8.v 
>> instruction, while the result of the poisoning and the partial load are
>> then both written by the vse8.v:
>> 
>>  loop:
>>         vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
>>         fixup vle8.v vData, (pSrc), 10f
>>         sub iNum, iNum, iVL
>>         add pSrc, pSrc, iVL
>>         fixup vse8.v vData, (pDst), 11f
>>         add pDst, pDst, iVL
>>         bnez iNum, loop
>
> I have instrumented that code, basically adding a function to check the 
> copy afterwards (only using scalar instructions), and report values in 
> case of errors. So far I have been able to catch the issue 4 times that 
> way (including one where I haven't seen any visible consequence on the 
> userland). 
>
> This is what I observed:
> - The issue always happens for the first bytes of the user copy, which 
>   in all cases were supposed to be up to 4096 bytes long.
> - On the first iteration of the loop only the first 16 bytes are loaded 
>   by the vle8.v instruction but the full 256 bytes are written to the 
>   destination by the vse8.v instrution.

That sounds like some sort of trap handling issue: something's filling 
out the first word of the vector, but then not the rest, but then not 
triggering a restart of the instruction.  We talked some on IRC and it 
sounds like that trap isn't getting into Linux, so it's possible 
something in M-mode is mangling it -- this is where we start to get into 
vstart/idempotent instruction territory and that's not well tested by 
running on QEMU, so it wouldn't be super surprising we're just stumbling 
into a bug there.

I have a K3 that I've been meaning to play around with, I'm going to go 
try to see if I can get it running and reproduce this one.

> - On the second iteration of the loop, the vle8.v causes a trap, which 
>   ends up in the 10f fixup. At fixup level, vl=0x100, vlenb=0x20, 
>   vstart=0x0 and vtype=0xc3.
> - Considering the 2 first iterations of the loop (i.e. 512 bytes), 
>   neither the source nor destination addresses cross a page.
>
> All that said, it is what I can *observe*. I have no idea if the first 
> iteration of the loop also goes through fixup or not. Also in addition 
> to precise traps (which definitely happen for the second iteration), IRQ 
> could happen at any moment. I use CONFIG_RISCV_ISA_V_PREEMPTIVE=n for my 
> test, in order to limit the code paths to review, so during that copy 
> preempt is disabled, but IRQ is not.
>
> Regards
> Aurelien
>
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
