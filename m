Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2CF4052A4
	for <spacemit@lists.linux.dev>; Thu, 24 Sep 2026 06:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230517; cv=none; b=CnhXE8yhpa8oktOCvxcr80NIElBopdguXM48AIRlkE+dc0MUCdDWyDhmmZektHWb66F4WHB+W2O6G3OvYgF+Hx4n9pRI7o12wF5oCIXM21/aXuAUFlYeiwp+louQ+zWjGLN2tFAbXSDPcM3uEhsaUfx7h6SSRL7kpycqxXzunaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230517; c=relaxed/simple;
	bh=Gl1R8KSEpDKWWxx9Gze6KP//Zm1KCkLtE0R/7mkRMko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCSyffFPGeVDUytsRG2z84MXrzQNPm/CENYKbWdJVWZt79sgsX+rqqMLcvHJT9I0oyH5hooR2CYrtg3ozcZqKZlM0xhi9jKEzQoYIWXg436Kbof3PDW09tEN/kqoFU3Jk50dU9h4L/PQOQ2vDKyvq6TIJBCreVBCc0ohyDXcH18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RN361oyx; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RN361oyx"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso965652f8f.2
        for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 23:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790230514; x=1790835314; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GvG+xICcIhp80On27TXTR8cz9U1ZiIOla7jNxC4PfgM=;
        b=RN361oyxZeca9oevg4bQ8te5PdJ/ixmQ5Off27joPhPblPF2mprN/li4wiWB3n7/At
         BD8FyzUznYBPls+soZgO1dN/dQPYeB/Sz9KUXxqNjpThFAR3mn9ns5q0wUqjMFZgGX5D
         Sfd+xFJ7vXF+I9K2bBn27rHEVwhckOuYIe0lf2hTYMy1plc1OptZLDcIIkWmw89FL6Zn
         EullZy1mDgJKmZkF8zwG7UobKT+1Brgf6bckVEaOPTiFDxRaUuYpNFODdJl2qXWnQoLZ
         KD3ocm+YVlMMrG61rqwt7pSYENx2gB6UaX49zGI9OgmsEfzoLUrKLm4x6edTgUySArPn
         nZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230514; x=1790835314;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvG+xICcIhp80On27TXTR8cz9U1ZiIOla7jNxC4PfgM=;
        b=enbCGMwDP88e/rYtbcHJoDM96SP9ebEkdLWHB0GKj+G6AoAuOsN4VhkjwFb9RZU72x
         2hiogyzMf7U0QkQPX2jNDaMjCX0qOCFAxnye9Ry+C6c9Plec0R7+Q/sM3e8SXGp+pe/L
         neBFVECXEnpuVQOaPqG2t9pbVe0vwi6jxkC7oth5hyxd7alonIvLfD8S6argWUCxTOAY
         3CHpNDmnJWaph5VvGJMBggvndUb1l/HU5KGYXbnx3Z/m3Y+uCKxn+eLSnmnPpGHsPeHU
         XUNue39jKzRdwVXYTfTPkNR4v8mdBzetAB/nRUc1FD3+C2BPth7/dEarOWpBgGaUYxba
         v/3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzNa/ywDYu9HYEMktY40OSFEbrosrqyTRqhcjPGH5dqK6bxSK9Q14UGpQOK/5dL41aN0QN3AUyBvg==@lists.linux.dev
X-Gm-Message-State: AFuF++nf0KHHZnHBHJ8EytixBOtg6oa4yY/bt3ehPZ63t3N2dOb7mvjc
	ECg3nsgZjBNc0wfWIC0K3RlZ7QhQoxyJHkktM7s7rj54/H8yJpHE4bdU
X-Gm-Gg: AYBFou0MHX75sy/pLKvsr8QkNGhZbHRYEZshuoGIkTdVS/iytgLJ6JY/KbJTLAnBENh
	6PQIVZhSLY+ROKLMkPtJLQF11djQErX3omIQtb3tECT4h9WS/ECwaUxqr1trCavn9dJXMoC7TfR
	VJr8v1h/+c8o2HUCYxEuc/toR5PFw3wcYzzDrbSXdGQt+eYMxVKzKgPKiMmnR5NBWOGFtDsHRUb
	h4fFJ9E0TMvch+D41W52lYyFj4Ye8OmQ7Ph9b4l/xO2nzOUwcKHJGw7G1lVMj1e2JG7DvBKT9j3
	ZBGw6G+Siuq+ex97VEtuhlTf4ojpcy0oq3jlSjd9r3v9j9A5o0LEBd/pEtwz3v2gQ6oSHtbTnvL
	JFu67FanILITiscAAr3hkj+b4SylQUyI5ucNq/VOqF3k3S1V/2724A8DFJdZ5gb3JaN0VVvDChc
	Q50HQg8H+Vmqdzxf4QGzTSbkFoCCCaIBYCnnCST003kDp9AIsOELj+yA7/oZSOTyvdgZXDBzsy7
	Rm8B0sosLBxNLo3Yl1Iu/nASVByFTiYh95y1ty1sTobsqV4p/Gj/nVS8z0VWjmD75yegnzRewYj
	czi20ACW790CP7HmBa4Unb10k+YCbV9m7MUSFpU76613dE/6OfVXo9qeIF92TTRrq6xd9IyNPA9
	+1Jwb5yug1E2eyxbLOx5c9w==
X-Received: by 2002:a05:6000:430b:b0:486:e2e8:bda0 with SMTP id ffacd0b85a97d-4887171065fmr2543898f8f.46.1790230514075;
        Wed, 23 Sep 2026 23:15:14 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-adbf-6901-6c54-85ea-c6d5-a48d.310.pool.telefonica.de. [2a02:3100:adbf:6901:6c54:85ea:c6d5:a48d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889130sm11723684f8f.37.2026.09.23.23.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:15:13 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:15:11 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Andy Chiu <tchiu@tenstorrent.com>, spacemit@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
Message-ID: <arS-yYLK8Df5knSE@gmail.com>
References: <apSYF5x1Tu7PlyL1@aurel32.net>
 <ap-SIQ9DLt-CfAx6@aurel32.net>
 <aqGNGp8PInSV4vty@aurel32.net>
 <arL0QBe_XYLO8Yy7@Tao-Chiu's-Mac>
 <arSshYwcyHjC2dh3@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arSshYwcyHjC2dh3@aurel32.net>

On Thu, Sep 24, 2026 at 06:52:21AM +0100, Aurelien Jarno wrote:
> Thanks for your feedback. Note that at this stage I have not been able 
> to reproduce the issue with QEMU. I guess it's very timing dependent, 
> also I am not sure if QEMU simulates partially executed instructions 
> (outside of page faults).
> 

Hello Aurelien, Andy,

I tested this with a local TCG diagnostic change. It did not reproduce
the K1 failure, but it answers the partial-instruction question.

My LLM agent helped me running these tests.

In stock TCG at 7074591d7954, vle8.v can leave partial state on a memory
fault, but the vector helper runs atomically with respect to guest
interrupts [1,2]. Stock QEMU therefore cannot take an asynchronous
interrupt partway through this load.

In a bare-metal test at VLEN=256 and LMUL=8, a page fault after element
16 left vstart=16 and a snapshot containing 16 source bytes followed by
240 poison bytes. After the missing page was mapped, QEMU resumed the
load and completed the copy correctly.

I then added a hook to QEMU vector-load which performs 16 elements, sets
vstart=16, raises a timer interrupt, and resumes at the same vle8.v. The
bare-metal test completed 262,145 such restarts and 67,108,864 copied
bytes without a mismatch.

I also booted Linux 388b607d107c with:

  CONFIG_RISCV_ISA_V=y
  CONFIG_RISCV_ISA_V_UCOPY_THRESHOLD=1
  CONFIG_RISCV_ISA_V_PREEMPTIVE=n

With the hook restricted to S-mode loads with SUM and SIE set, a checked
pipe test completed 90,308,608 bytes across copy_from_user() and
copy_to_user(), including demand-faulting source and destination pages.
The hook logged at least 327,680 forced interruptions at vstart=16,
without a byte mismatch.

As a negative control, I made one load read 16 elements and then retire
as if all 256 had completed. That produced the 16-source/240-poison
signature in bare metal, and the Linux checker reported exactly 240
differing bytes. This is an injected symptom, but confirms that the test
detects the reported failure shape.

Correct QEMU fault recovery and forced interrupt restart therefore did
not produce the corruption. Reaching the 16/240 result required
deliberately modelling a load that completed early without a trap. That
fits the observed first load/store pair, but does not establish its
cause. Your IRQ-disabled result also makes a normal asynchronous restart
a poor fit.

The normal Linux load-fault path exits before vse8.v and falls back to
the scalar copy [3,4]. Do you have the original trap PC, cause and fault
address for the second-iteration fault? Those values could show whether
an unexpected synchronous trap is involved.

Thanks,
Karl

[1] https://gitlab.com/qemu-project/qemu/-/blob/7074591d7954876951f84c15b994a43251d5a3c1/target/riscv/tcg/vector_helper.c#L403
[2] https://gitlab.com/qemu-project/qemu/-/blob/7074591d7954876951f84c15b994a43251d5a3c1/accel/tcg/cpu-exec.c#L930
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/riscv/lib/uaccess_vector.S?h=v7.2#n38
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/riscv/lib/riscv_v_helpers.c?h=v7.2#n23
