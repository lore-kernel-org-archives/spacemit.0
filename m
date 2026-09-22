Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D54C43DEA3
	for <spacemit@lists.linux.dev>; Tue, 22 Sep 2026 21:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790112846; cv=none; b=UlFjqDZ/pSxlYMFF5EspG2Vvqh+rY8/RGxy8R2TI69HmCZ7fOyJnS72a/wbXm4DKpRWJhFMQoIvqN6LxkNc847tArWg5xtaf1hyBw+OOq90RiV8FwnSg3LUo8fL5UcYShOJfrbv5bQ36LO2SA19mvNmWRukFTL5p+6mczccUAwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790112846; c=relaxed/simple;
	bh=PWHE2LRMydwcWhxScs51lUyq4LhTFBNVBhpTIrCPtCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRHhrJF8CGp08bJQ4i6Qe3OHnglCqqpqONrdfilmb/cgF50GzbFefJMs6zLtWlCcm7z3Rysnh5J4dtgSJZvHHt1dpgTeHJq8/Er9QPcAWWBCUryP8UBc7nHYpI9WGYD3X5hU9iEeln8SiKqNmQOoFWIZg3IXPTfAoqCpRcYSyaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=JBlwk0sd; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="JBlwk0sd"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab201ecso302498d50.2
        for <spacemit@lists.linux.dev>; Tue, 22 Sep 2026 14:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1790112835; x=1790717635; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WeGUBMLWdKwi5Qro48n5wzE6cYnrkvQSg7+ilGkmexE=;
        b=JBlwk0sds0oMIdUYuoYu4aP7xKSCbMnKDn2jHhJMZcpq1GXwFoJWhOpBL0/o65mY5U
         9kgAc8rDrgMiNSTF6rlOB7tedCKMyZ12zPuNV8ZxaFylWncgJKpg69tSK97OpSA0+HwC
         nBHxvn3IoWTN6bGs7cTseqVCrfL3qbC+wqfKNDppuCb3NYY1+4TwnWccVnfgjb3GAnRC
         I4jM7ZBYNdZkEiBkrJ7+giDP3WJXw/y3sVsDIc/brIhNiRqCi811OcO/7vJ2gxGMFXaY
         tfwzd7FKX51Z6kxz6kXjefE+bKrbzKK94/cfxKFO6mC1k2QO2HEjOtBWlOWMqZT1c5p+
         1SJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790112835; x=1790717635;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WeGUBMLWdKwi5Qro48n5wzE6cYnrkvQSg7+ilGkmexE=;
        b=Rkxj+auOxZ2imhv4Z4ZOWBQwWMCIkHmdT4+QNSAVwNWHjq5c/XxMFf5c2vVq2GTSI2
         atFFSOCYlhM2a4wITS5Axxgb6iKrsZRqnSHzhWMyXUwlF0f/Maek+mXuEn369D0JhaWg
         JlA19g2LhHQIU9DVF6DrBSDhDM0hV32uSc5Yg4qb5LZfP0+sO9UmYSXCf9HjH8cBO1Hm
         6fMGMXees1P0fyICwUqf0ssd9E3K0m2wE0U/BSh9raDkrgdfPxsmA/xmom2XRYmMN+2A
         3IsOl04VhZxQKNWsqfApE+sGN28Qktz1/Z3kGIsFgYa3h2US6RT10Tz2wVBjHdUgLeOD
         fU9Q==
X-Gm-Message-State: AFuF++mkbjAVtiPw6o46F/UnTZXvKLrHu3QkF3nmH20M9pHZHoJw1Xo1
	RqVi5slURBcSsG8rYq7l4HoismqwYNVh6kJEvtNkSa+GisWHYC/Y08QKwa39EaofBOpPpADJIc+
	Tbj+X+4w=
X-Gm-Gg: AYBFou07eqG4ogu21KA6xfRUQwbXDhoCuhhDMNAr+KiRsHdG4OiASkCr1QvciFYlFsV
	XMyii74x7kkp6qnQq3Kc6q2fQbq/ho5lP0ceP7k4Ma72OjLURTSxLSjyk/EHq9AaUlQu7o0ekOm
	HGeEAjoOCTxgNHwIwipBZ0ZIsFqEzGcpI4YiaAEulyKtVnEHKGQuLKhMgHgVvl4AujRAOXVN5rK
	fllzEgn4gflYa2RYalYMXzCKV/tOVTeiUE5KRKX9odAzJaaQ4jgnboUaZqDGLQhGfLJcsqnR3kw
	buEAkA7Y9tZGQ5+6buvDyx96T6lP8SfLooHxQ0/YanfAJGoaIUkMFDxMl5BTLxNVq8gf0XJDmbQ
	O0yzGrTXCRLtCfRG5sO9BngyzWS4wleGXe3Sxsg7S89b0h0V7SVdf9nt0xvS5wPxHEMoYK8NyIR
	EOYOl6bpnCyLF5E8WAfTvA6jXhVL4JwQRzdxKW2WKVrvMCAc76xu3dxRIAkXNRQNSD9jOfkh/EG
	pBjgTnKIA==
X-Received: by 2002:a05:690e:1383:b0:672:d326:d31e with SMTP id 956f58d0204a3-672d578465fmr383171d50.44.1790112834519;
        Tue, 22 Sep 2026 14:33:54 -0700 (PDT)
Received: from localhost ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a466bc81a6sm2551187b3.46.2026.09.22.14.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:33:54 -0700 (PDT)
Date: Tue, 22 Sep 2026 16:33:52 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
Message-ID: <arL0QBe_XYLO8Yy7@Tao-Chiu's-Mac>
References: <apSYF5x1Tu7PlyL1@aurel32.net>
 <ap-SIQ9DLt-CfAx6@aurel32.net>
 <aqGNGp8PInSV4vty@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqGNGp8PInSV4vty@aurel32.net>

Hi Aurelien,

Sorry for replying late. I did run a compilation test with vectorized
glibc in qemu after seeing this thread shortly, but then focus on
something else as it didn't catch any corruption we've seen here.

On Wed, Sep 09, 2026 at 06:45:14PM +0200, Aurelien Jarno wrote:
> [Added Andy and Karl in Cc: as they have been involved in the vectored 
> user copy code and fighting similar issues]
> 
> Hi,
> 
> Some more progress on that topic.
> 
> On 2026-09-08 06:42, Aurelien Jarno wrote:
> > Dear all,
> > 
> > I have done some small progress on that issue. Help is still wanted and 
> > would be appreciated.
> > 
> > On 2026-08-30 22:52, Aurelien Jarno wrote:
> > > Dear all,
> > > 
> > > For the last weeks, I have been tracking a random memory corruption and
> > > relatively rare on SpacemiT K1 (Banana Pi F3 and Milk-V Jupiter). It 
> > > started upgrading to glibc 2.43, which does memset() through vector 
> > > instructions.  It is reproducible using the Debian 7.1.7-1~bpo13+1 
> > > kernel, but I have also been able to reproduce it with a vanilla 7.2.2 
> > > kernel, using a similar configuration to the Debian kernel. The board 
> > > uses OpenSBI 1.9 and the vendor U-Boot.

The KVM fix, which is in 7.3 now, is irrelavant to this bug (see below),
because the fix targets preemptible kernel-mode vector, but we can
trigger this bug with CONFIG_RISCV_ISA_V_PREEMPTIVE unset. Nontheless,
if we want to test on the latest code, feel free to grab the series at
[3] and boot with riscv_novstateopt to preseve the context poisoning
behavior.

> > 
> > I have been able to rule out OpenSBI from the issue, I have checked 
> > there is not trap top OpenSBI when the problem happens.
> > 
> > > Typically it manifests itself with the following kind of error, when 
> > > running g++ from GCC 16 as part of building software (e.g. OpenJDK, 
> > > Blender, Dolfin, Qt6):   
> > > 
> > > Assembler messages:
> > > {standard input}:284588: Error: unknown pseudo-op: `.uleb1'
> > > {standard input}:284588: Error: unrecognized opcode `ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿvl874'
> > > 
> > > The broken chars are 0xff and it seems there are always 240 (but with 
> > > poor statistics). Sometimes it instead causes a GCC ICE instead.
> > 
> > I have identified that the 0xff comes from the poisoning done for v0 in
> > __riscv_v_vstate_discard(), which should only happen for a syscall. 
> > Indeed changing the value to different ones propagates to the above 
> > error message.
> > 
> > Furthermore I have found that changing CONFIG_RISCV_ISA_V_PREEMPTIVE 
> > doesn't change anything, and that changing RISCV_ISA_V_UCOPY_THRESHOLD 
> > changes the number of broken bytes.

Turnning off CONFIG_RISCV_ISA_V_PREEMPTIVE makes the ucopy fall back to
the scalar copy on a page fault, because faulthandler_disabled() would
return true after kernel_vector_begin(). So if we are suspecting a
corruption at vector restart, then it is not, there is no restarting of
such instruction.

The only possible way to have a restarted vector ld/st here under
!CONFIG_RISCV_ISA_V_PREEMPTIVE is then an irq restart. I don't know if
you test this code with !CONFIG_RISCV_ISA_V_PREEMPTIVE **and** with
irqs_disabled() == true in the user copy code. If we still observed
a corruption under this case, then it suggests that the corruption
happens even eariler. It is then either the faulting instruction itself,
or the corruption happens even eariler.

> 
> The values from __riscv_v_vstate_discard() end-up there because they are 
> the last values written to the vector registers. I have added some 
> poisoning in __asm_vector_usercopy_sum_enabled before the loop, and 
> those values appear instead. Using different values per vector register, 

Do you know what is the address of corrupted data? If it always starts at
a page boundary (e.g offset 0x00000 for THP) then it suggests a strong
correlation with fault handling.

> I have found that the corruption comes from a partial load of the vle8.v 
> instruction, while the result of the poisoning and the partial load are
> then both written by the vse8.v:
> 
>  loop:
>         vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
>         fixup vle8.v vData, (pSrc), 10f
>         sub iNum, iNum, iVL
>         add pSrc, pSrc, iVL
>         fixup vse8.v vData, (pDst), 11f
>         add pDst, pDst, iVL
>         bnez iNum, loop
> 
> One hypothesis could be that for some reason, an exception (page table 
> fault, irq, ...), the vle8.v instruction is interrupted, and only 
> partially loads the vector register from memory. This stops at a 16-byte 
> boundary (at least on the K1), and the remaining part of the v0-v7 
> register is left with the previous value (with the original kernel that 
> is the poisoning done in __riscv_v_vstate_discard). In theory when the 
> instruction is interrupted, vstart is set to a non-zero value (for 
> instance 16), and it should get re-executed after the exception. In 
> practice, in some very rare cases, it doesn't happen and the next 
> executed instruction is the following sub.
> 
> That said with exceptions and vector context switches, the explanation 
> is likely way more complex. [1] gives a possible different scenario, 
> involving an interrupt or a fault between the vsetvli and vle8.v/vse8.v 
> instructions. However it doesn't fix the issue, neither patch [2]
> (in that case tested with CONFIG_RISCV_ISA_V_PREEMPTIVE=y).
> 
> 
> > Disabling the vectored user code entirely with the following patch seems
> > to prevent the issue (or make it sufficiently rare that I have not 
> > encountered it):
> 
> A much better way to do that is setting RISCV_ISA_V_UCOPY_THRESHOLD=-1.  
> 
> I also tried the same kernel on a K3, and it appears to improve 
> stability, getting rid of issues that I attributed to thermal issues.  
> (due to the absence of fan driver, I run the fan as a fixed speed 
> ~4000rpm). The symptoms are however quite different, it's GCC crashes 
> with "The bug is not reproducible, so it is likely a hardware or OS 
> problem.".
> 
> Regards
> Aurelien
> 
> [1] https://lore.kernel.org/20260806193241.10552-1-kmehltretter@gmail.com/
> [2] https://lore.kernel.org/all/20260810172255.1532787-2-tchiu@tenstorrent.com/
> 

[3] https://lore.kernel.org/all/20260918215154.2481482-1-tchiu@tenstorrent.com/

> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
